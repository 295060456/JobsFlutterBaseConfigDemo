#!/bin/zsh
setopt +o nomatch
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/homebrew/bin:$PATH"

# ✅ 彩色输出
cecho() {
  local color="$1"; shift
  local text="$*"
  case "$color" in
    red) echo "\033[31m$text\033[0m" ;;
    green) echo "\033[32m$text\033[0m" ;;
    yellow) echo "\033[33m$text\033[0m" ;;
    blue) echo "\033[34m$text\033[0m" ;;
    *) echo "$text" ;;
  esac
}

# ✅ 环境命令依赖校验
require_commands() {
  local cmds=("grep" "awk" "xargs" "git" "curl")
  for cmd in "${cmds[@]}"; do
    if ! command -v "$cmd" >/dev/null; then
      cecho red "❌ 缺少命令：$cmd，请先安装或修复 PATH"
      exit 1
    fi
  done
}

# ✅ 自述信息
show_description() {
  clear
  cecho blue "🛠 Flutter SDK 升级助手（支持 FVM / 系统 Flutter）"
  echo ""
  cecho yellow "📌 功能说明："
  echo "1️⃣ 检查当前路径是否为 Flutter 项目（pubspec.yaml + lib/）"
  echo "2️⃣ 自动识别 flutter 命令是否由 FVM 转发"
  echo "3️⃣ 如果是 FVM："
  echo "   - 获取实际 SDK 路径"
  echo "   - 检查是否存在本地修改（git status）"
  echo "   - 提供 stash / force / cancel 三种交互处理"
  echo "   - 支持切换 channel（fzf 选择）"
  echo "   - 升级对应 SDK（fvm flutter upgrade）"
  echo "4️⃣ 如果是系统 flutter："
  echo "   - 若为 Homebrew 安装，使用 brew upgrade flutter"
  echo "   - 否则直接 flutter upgrade（并支持 channel 选择）"
  echo ""
  cecho yellow "📦 自动安装并自检依赖工具："
  echo "✅ Homebrew"
  echo "✅ fzf（交互式选择 Flutter channel）"
  echo ""
  cecho green "📂 当前执行路径：$(pwd)"
  echo ""
  echo "🔍 请按回车继续（或 Ctrl+C 退出）"
  read -rs
}

# ✅ 智能切换 Homebrew 源
check_and_set_homebrew_mirror() {
  local test_url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
    cecho yellow "🌐 正在测试 Homebrew 官方源可达性..."

  if curl --connect-timeout 3 -s --head "$test_url" | /usr/bin/grep -q "200 OK"; then
    cecho green "✅ Homebrew 官方源可访问，继续使用默认源"
  else
    cecho red "⚠️ 官方源访问失败，仅设置清华 Bottle 镜像（Git 仓库镜像已停用）"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
  fi
}

# ✅ 自检工具
ensure_brew() {
  if ! command -v brew >/dev/null; then
    cecho red "🧰 未安装 Homebrew，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    cecho green "✅ Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup
  fi
}

ensure_fzf() {
  cecho blue "📢 正在检查 fzf..."
  if ! command -v fzf >/dev/null; then
    cecho yellow "🧰 安装 fzf 中..."
    brew install fzf || {
      cecho red "❌ 安装 fzf 失败，终止"
      exit 1
    }
  else
    cecho green "✅ fzf 已安装"
  fi
}

# ✅ 判断方法
is_flutter_fvm_proxy() {
  if type flutter | /usr/bin/grep -q 'fvm flutter'; then return 0; fi
  [[ "$(which flutter)" == *".fvm/"* ]] && return 0
  return 1
}

get_sdk_path_from_fvm() {
  fvm flutter --version --verbose 2>/dev/null \
    | /usr/bin/grep "Flutter root" \
    | /usr/bin/awk -F'at ' '{print $2}' \
    | /usr/bin/xargs || true
}

get_sdk_path_from_system() {
  local path
  path=$(flutter --version --verbose 2>/dev/null \
    | /usr/bin/grep "Flutter root" \
    | /usr/bin/awk -F'at ' '{print $2}' \
    | /usr/bin/xargs || true)
  if [[ -z "$path" ]]; then
    for p in /opt/homebrew/Caskroom/flutter/*/flutter /usr/local/Caskroom/flutter/*/flutter; do
      [[ -x "$p/bin/flutter" ]] && path="$p" && break
    done
  fi
  echo "$path"
}

check_sdk_git_changes() {
  [[ -d "$1/.git" ]] && [[ -n "$(cd "$1" && git status --porcelain)" ]]
}

prompt_git_action() {
  local sdk_path="$1"
  cecho red "⚠️ 检测到 Flutter SDK（$sdk_path）有本地修改："
  cd "$sdk_path"
  git status -s
  echo ""

  while true; do
    cecho yellow "请选择如何处理这些修改："
    echo "1) git stash 后继续升级（推荐）"
    echo "2) 强制升级（--force，会清除本地修改）"
    echo "3) 取消升级"
    read "?👉 输入选项数字 (默认 1): " choice
    choice=${choice:-1}
    case "$choice" in
      1) cecho blue "📦 正在 stash 本地修改..." && git stash && return 0 ;;
      2) cecho yellow "🚨 将强制升级 Flutter SDK..." && return 2 ;;
      3) cecho red "🚫 已取消升级" && exit 0 ;;
      *) cecho red "❌ 无效输入，请重新输入 1 / 2 / 3（回车默认 1）" ;;
    esac
  done
}

select_channel() {
  echo -e "stable\nbeta\nmain\nmaster" | fzf --prompt="切换 Channel > "
}

# ✅ 执行升级
perform_upgrade() {
  local sdk_cmd="$1"
  local sdk_path="$2"

  if check_sdk_git_changes "$sdk_path"; then
    prompt_git_action "$sdk_path"
    [[ $? -eq 2 ]] && "$sdk_cmd" upgrade --force && return
  fi

  if [[ "$sdk_path" == *"/Caskroom/flutter/"* ]]; then
    cecho blue "🍺 检测到 Flutter 是通过 Homebrew 安装，使用 brew 升级方式"
    brew upgrade flutter || {
      cecho red "❌ brew upgrade flutter 失败"
      exit 1
    }
    return
  fi

  local channel=$(select_channel)
  [[ -n "$channel" ]] && "$sdk_cmd" channel "$channel"
  cecho yellow "🚀 开始升级 Flutter SDK..."
  "$sdk_cmd" upgrade
}

# ✅ 判断 flutter 命令来源与 SDK 路径
detect_flutter_cmd_and_sdk_path() {
  # 显示当前 flutter 路径信息
  cecho yellow "🧩 当前 flutter 路径：$(which flutter)"
  type flutter

  flutter_cmd="flutter"
  sdk_path=""

  # 判断是否为 FVM 转发
  if is_flutter_fvm_proxy; then
    flutter_cmd="fvm flutter"
    sdk_path=$(get_sdk_path_from_fvm)
    cecho green "✅ flutter 命令是由 FVM 转发"
  else
    sdk_path=$(get_sdk_path_from_system)
    cecho yellow "⚠️ flutter 命令是系统 Flutter"
  fi

  # SDK 路径 fallback 判断
  if [[ -z "$sdk_path" ]]; then
    cecho red "❌ 无法识别 Flutter SDK 路径，尝试 fallback"
    sdk_path=$(get_sdk_path_from_fvm)
    if [[ -n "$sdk_path" ]]; then
      cecho green "✅ fallback 成功：$sdk_path"
    else
      cecho red "❌ fallback 也失败，终止"
      cecho yellow "📋 flutter --version --verbose 输出如下（供调试）："
      echo "--------------------"
      flutter --version --verbose
      echo "--------------------"
      exit 1
    fi
  fi

  # 最终确认的 SDK 路径
  cecho blue "📁 当前 Flutter SDK 路径：$sdk_path"
}

# ✅ 主函数入口
main() {
  show_description                            # ✅ 自述信息
  require_commands                            # ✅ 检查必要命令依赖（如 grep、awk、git、curl 等）
  check_and_set_homebrew_mirror               # ✅ 检查 Homebrew 源可达性，必要时切换为国内镜像
  ensure_brew                                 # ✅ 自检 Homebrew，如未安装则自动安装并升级
  ensure_fzf                                  # ✅ 检查并安装 fzf 工具（用于 channel 选择等交互）
  detect_flutter_cmd_and_sdk_path             # ✅ 检测 flutter 是否通过 FVM 管理，并获取 SDK 路径
  perform_upgrade "$flutter_cmd" "$sdk_path"  # ✅ 执行 Flutter SDK 升级流程（支持 FVM / 系统 flutter）

  echo ""
  cecho green "✅ Flutter SDK 升级完成"         # ✅ 最终成功提示
  read "?⏎ 按回车关闭窗口"                       # ✅ 提示用户手动关闭窗口（适用于 GUI 脚本或 Terminal 自动退出）
}

main
