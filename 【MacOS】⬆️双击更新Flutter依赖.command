#!/bin/zsh

# ========== 彩色输出 ==========
red()    { echo "\033[1;31m$1\033[0m"; }
green()  { echo "\033[1;32m$1\033[0m"; }
yellow() { echo "\033[1;33m$1\033[0m"; }

# ========== 自述 ==========
clear
green "📦 Flutter 项目依赖升级助手（支持 FVM + fzf）"
green "===================================================================="
green "✅ 功能说明："
green "   ➤ 自动检测 Flutter 项目目录（含 pubspec.yaml + lib/）"
green "   ➤ 自动检测并安装/升级 fzf"
green "   ➤ 选择依赖升级方式：全清空 / 逐个升级"
green "   ➤ 全清空仅重新拉包，不调用其他脚本"
green "===================================================================="
echo ""

# ========== fzf 自检并安装/升级 ==========
echo "🔍 正在检测 fzf..."
if ! command -v fzf >/dev/null 2>&1; then
  yellow "📦 未安装 fzf，正在安装..."
  brew install fzf
else
  green "✅ fzf 已安装，尝试升级..."
  brew upgrade fzf
fi

# ========== 判断并获取 Flutter 项目根目录 ==========
is_flutter_project() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

project_dir="$(cd "$(dirname "$0")" && pwd)"
while ! is_flutter_project "$project_dir"; do
  red "❌ 当前目录不是 Flutter 项目（缺少 pubspec.yaml 或 lib/）"
  echo ""
  read "input_path?📂 请拖入 Flutter 项目根目录（或直接回车使用当前路径）："
  input_path="${input_path/#\~/$HOME}"
  input_path="${input_path//\\/}"
  input_path="${input_path%"${input_path##*[![:space:]]}"}"

  if [[ -n "$input_path" ]]; then
    project_dir="$input_path"
  fi
done

cd "$project_dir" || {
  red "❌ 切换到目录失败：$project_dir"
  exit 1
}

green "📁 已定位 Flutter 项目目录：$project_dir"

# ========== fzf 选择升级方式 ==========
echo ""
green "🎯 请选择依赖升级策略："
upgrade_strategy=$(printf "🧹 全量清空 .pub-cache 并重新拉取依赖（推荐）\n⚙️ 逐个升级 pubspec.yaml 中的依赖（当前逻辑）" | fzf --prompt="📦 选择升级方式 > " --height=10 --reverse)

if [[ "$upgrade_strategy" == "🧹 全量清空 .pub-cache 并重新拉取依赖（推荐）" ]]; then
  red "⚠️ 即将清空 ~/.pub-cache/hosted/pub.dev 目录（不影响项目代码）"
  read "?🔁 是否继续执行？（输入 y 确认，其他跳过）" confirm_wipe
  if [[ "$confirm_wipe" == "y" ]]; then
    rm -rf ~/.pub-cache/hosted/pub.dev/*
    green "✅ 已清空 pub.dev 缓存"

    echo ""
    green "📦 正在重新获取依赖..."
    fvm flutter pub get

    green "🎉 全量依赖升级流程完成！"
    exit 0
  else
    yellow "⏭️ 取消清空缓存，回到原始脚本逻辑"
  fi
fi

# ========== 用户确认继续 ==========
read "?🟢 按回车继续执行逐个升级逻辑，输入任意字符后回车退出：" user_confirm
if [[ -n "$user_confirm" ]]; then
  red "❌ 已取消执行"
  exit 0
fi

# ========== 显示 outdated 状态 ==========
echo ""
yellow "📋 当前依赖状态（包括已废弃包）"
echo "===================================================================="
fvm flutter pub outdated
echo "===================================================================="
echo ""

read "?📈 是否进入逐个升级流程？（回车 = 执行，任意输入跳过）" confirm_upgrade
if [[ -n "$confirm_upgrade" ]]; then
  yellow "⏭️ 跳过升级流程"
  exit 0
fi

# ========== 收集依赖分类 ==========
dependencies=($(grep -A 1000 '^dependencies:' pubspec.yaml | grep -B 1000 '^dev_dependencies:' | grep -E '^\s*[a-zA-Z0-9_-]+:\s*\^?[0-9]' | awk -F: '{print $1}' | sed 's/^[ \t]*//'))
dev_dependencies=($(grep -A 1000 '^dev_dependencies:' pubspec.yaml | grep -v 'flutter:' | grep -E '^\s*[a-zA-Z0-9_-]+:\s*\^?[0-9]' | awk -F: '{print $1}' | sed 's/^[ \t]*//'))

# ========== 合并依赖来源 ==========
declare -A dep_sources
for pkg in "${dependencies[@]}"; do
  dep_sources["$pkg"]="dependencies"
done
for pkg in "${dev_dependencies[@]}"; do
  dep_sources["$pkg"]="dev_dependencies"
done

transitives=$(fvm flutter pub outdated --json | grep -oE '"package":"[^"]+"' | cut -d'"' -f4)
for pkg in $transitives; do
  if [[ -z "${dep_sources["$pkg"]}" ]]; then
    dep_sources["$pkg"]="transitive"
  fi
done
all_pkgs=("${(k)dep_sources}")

# ========== 升级循环 ==========
for pkg in "${all_pkgs[@]}"; do
  echo ""
  yellow "🔍 正在处理包：$pkg（来源：${dep_sources[$pkg]}）"

  output=$(fvm flutter pub outdated "$pkg" --json 2>/dev/null)
  current=$(echo "$output" | grep -oE '"current":"[^"]+"' | head -n1 | cut -d'"' -f4)
  resolvable=$(echo "$output" | grep -oE '"resolvable":"[^"]+"' | head -n1 | cut -d'"' -f4)
  latest=$(echo "$output" | grep -oE '"latest":"[^"]+"' | head -n1 | cut -d'"' -f4)

  if [[ -z "$current" || -z "$latest" ]]; then
    red "⚠️ 无法获取版本信息，可能已废弃或格式异常"
    continue
  fi

  if [[ "$current" == "$latest" ]]; then
    green "✅ $pkg 已是最新版本（$current）"
    continue
  fi

  echo "📌 当前版本：$current"
  echo "🔧 可解析版本（不改 pubspec.yaml）：$resolvable"
  echo "🆕 最新版本：$latest"

  if [[ "${dep_sources[$pkg]}" != "transitive" ]]; then
    read "?🚀 是否将 $pkg 升级为 ^$latest 并写入 pubspec.yaml？（y = 升级，回车跳过）" upgrade
    if [[ "$upgrade" == "y" ]]; then
      matched_line=$(grep -E "^\s*$pkg:" pubspec.yaml)
      if [[ "$matched_line" =~ (git:|path:|sdk:) ]]; then
        yellow "⚠️ $pkg 为 git/path/sdk 类型依赖，跳过修改"
      else
        new_line=$(echo "$matched_line" | sed -E "s/(\s*$pkg:\s*)\^?[0-9]+\.[0-9]+\.[0-9]+/\1^$latest/")
        if [[ "$matched_line" != "$new_line" ]]; then
          sed -i '' "s|$matched_line|$new_line|" pubspec.yaml
          green "✅ $pkg 已更新版本为：$new_line"
        else
          yellow "⏭️ 无法替换该行格式，跳过"
        fi
      fi
    else
      yellow "⏭️ 跳过 $pkg"
    fi
  else
    yellow "📦 $pkg 是间接依赖，无法直接升级"
  fi
done

# ========== flutter pub get ==========
echo ""
read "?📦 是否执行 flutter pub get？（回车 = 执行，任意输入跳过）" get_choice
if [[ -z "$get_choice" ]]; then
  fvm flutter pub get
  green "✅ 依赖安装完成"
else
  yellow "⏭️ 未执行 flutter pub get，请手动执行"
fi

# ========== 重新验证状态 ==========
echo ""
yellow "🔁 正在重新检查依赖状态..."
echo "===================================================================="
fvm flutter pub outdated
echo "===================================================================="
green "🎉 脚本执行完毕！"
