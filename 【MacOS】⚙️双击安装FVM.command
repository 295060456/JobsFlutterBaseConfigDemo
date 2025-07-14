#!/bin/zsh

# ========== 彩色输出 ==========
red()    { echo "\033[1;31m$1\033[0m"; }
green()  { echo "\033[1;32m$1\033[0m"; }
yellow() { echo "\033[1;33m$1\033[0m"; }

# ========== 更详细的头部介绍 ==========
echo ""
green "🛠️ 欢迎使用 Flutter 项目一键初始化脚本（支持 FVM）"
green "====================================================================="
green "📦 功能概述："
green "   ➤ 本脚本适用于 Flutter 项目，支持使用 FVM 管理多个 SDK 版本"
green "   ➤ 自动检测当前目录是否为 Flutter 项目（必须包含 pubspec.yaml + lib/）"
green "   ➤ 自动检测并安装依赖工具（brew / jq / fzf / dart / fvm）"
green "   ➤ 自动从 Google 获取可用 Flutter 稳定版本，并可视化选择"
green "   ➤ 同步写入新版 .fvmrc（JSON 格式）与旧版 .fvm/fvm_config.json"
green "   ➤ 自动执行 fvm install/use，绑定并切换所选 Flutter 版本"
green "   ➤ 支持可选命令：flutter clean / pub get / doctor / analyze"
green "   ➤ 检查 .packages、.flutter-plugins、.metadata 等 Flutter 状态文件"
green "   ➤ 显示 SDK 安装路径 ~/.fvm/versions/<version>"
green ""
green "📁 注意事项："
green "   当前脚本目录将被视为 Flutter 项目根目录"
green "   若当前路径不符合条件，将提示你手动拖入 Flutter 项目"
green "====================================================================="
echo ""

# ========== 检查 Flutter 项目路径 ==========
is_flutter_project() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR"

if ! is_flutter_project "$SCRIPT_DIR"; then
  red "❌ 当前路径不是 Flutter 项目"
  while true; do
    echo ""
    echo "📁 请拖入一个 Flutter 项目文件夹，然后按回车："
    read "FLUTTER_DIR?路径："
    FLUTTER_DIR=${FLUTTER_DIR//\\//}
    FLUTTER_DIR=${FLUTTER_DIR//\"/}
    FLUTTER_DIR=$(eval "echo $FLUTTER_DIR")

    if is_flutter_project "$FLUTTER_DIR"; then
      cd "$FLUTTER_DIR"
      SCRIPT_DIR="$FLUTTER_DIR"
      green "✅ 成功进入 Flutter 项目：$SCRIPT_DIR"
      break
    else
      red "⚠️  无效路径，请确保包含 pubspec.yaml 和 lib/"
    fi
  done
fi

read "?⏳ 按【回车】继续，或 Ctrl+C 退出..."

# ========== 工具检测 ==========
check_install_tool() {
  local tool=$1
  if ! command -v "$tool" &>/dev/null; then
    yellow "🔧 正在安装 $tool ..."
    brew install "$tool"
  else
    green "✅ 已安装：$tool"
  fi
}

for t in brew jq fzf dart; do
  check_install_tool "$t"
done

# ========== 安装/升级 FVM ==========
export PATH="$HOME/.pub-cache/bin:$PATH"
dart pub global activate fvm

# ========== 读取已有版本 ==========
CONFIGURED_VERSION=""
if [[ -f .fvmrc ]]; then
  CONFIGURED_VERSION=$(jq -r '.flutterSdkVersion // empty' .fvmrc 2>/dev/null)
elif [[ -f .fvm/fvm_config.json ]]; then
  CONFIGURED_VERSION=$(jq -r '.flutterSdkVersion // empty' .fvm/fvm_config.json)
fi

if [[ "$CONFIGURED_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  green "📄 当前配置版本：$CONFIGURED_VERSION"
else
  CONFIGURED_VERSION=""
fi

# ========== 获取 Flutter 稳定版本 ==========
VERSIONS=$(curl -s https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json |
  jq -r '.releases[] | select(.channel=="stable") | .version' |
  sort -V | uniq | tac)

if [[ -z "$VERSIONS" ]]; then
  red "❌ 无法获取 Flutter 稳定版本列表，请检查网络"
  exit 1
fi

# ========== 使用 fzf 选择版本 ==========
if [[ -n "$CONFIGURED_VERSION" ]]; then
  echo ""
  green "📄 当前配置版本：$CONFIGURED_VERSION"
  echo "⬇️ 请选择要使用的 Flutter 版本（当前版本已标记 ✅，回车保持当前）"
  CHOICES=$(echo "$VERSIONS" | awk -v current="$CONFIGURED_VERSION" '{ if ($0 == current) print "✅ " $0; else print $0 }')
else
  echo ""
  echo "⬇️ 可用 Flutter 稳定版本如下（回车默认选择最新）"
  CHOICES="$VERSIONS"
fi

RAW_SELECTED_LINE=$(echo "$CHOICES" | \
  fzf --prompt="🎯 选择要使用的 Flutter 版本：" \
      --height=50% \
      --border \
      --ansi)

SELECTED_VERSION=$(echo "$RAW_SELECTED_LINE" | sed 's/^✅ //' | grep -Eo '^[0-9]+\.[0-9]+\.[0-9]+$')

if [[ -z "$SELECTED_VERSION" ]]; then
  if [[ -n "$CONFIGURED_VERSION" ]]; then
    SELECTED_VERSION="$CONFIGURED_VERSION"
    yellow "📎 保持使用当前版本：$SELECTED_VERSION"
  else
    SELECTED_VERSION=$(echo "$VERSIONS" | head -n1)
    yellow "📎 默认使用最新版本：$SELECTED_VERSION"
  fi
fi

# ========== 写入配置文件 ==========
echo "{\"flutterSdkVersion\": \"$SELECTED_VERSION\"}" > .fvmrc
green "✅ 写入 .fvmrc（JSON 格式，兼容 fvm 3.2.x）：$SELECTED_VERSION"

mkdir -p .fvm
echo "{\"flutterSdkVersion\": \"$SELECTED_VERSION\"}" > .fvm/fvm_config.json
yellow "☑️ 同步写入 .fvm/fvm_config.json（辅助兼容）"

# ========== 安装并切换版本 ==========
fvm install "$SELECTED_VERSION"
fvm use "$SELECTED_VERSION"

# ========== flutter 命令别名 ==========
if ! grep -q 'flutter()' ~/.zshrc; then
  echo '' >> ~/.zshrc
  echo 'flutter() { fvm flutter "$@"; }' >> ~/.zshrc
  green "✅ flutter 命令别名已写入 ~/.zshrc"
fi

# ========== 状态文件检查 ==========
[[ -f .packages ]] && green "📁 已检测到 .packages 文件" || yellow "⚠️ 未检测到 .packages 文件"
[[ -f .flutter-plugins ]] && green "📁 已检测到 .flutter-plugins 文件" || yellow "⚠️ 未检测到 .flutter-plugins 文件"
[[ -f .metadata ]] && green "📁 已检测到 .metadata 文件" || yellow "⚠️ 未检测到 .metadata 文件"
[[ -d .dart_tool ]] && green "📁 已检测到 .dart_tool 目录" || yellow "⚠️ 未检测到 .dart_tool 目录"

# ========== 检查重复依赖函数 ==========
check_duplicate_dependencies() {
  local dep_list=$(awk '
    $1=="dependencies:" {mode="dep"; next}
    $1=="dev_dependencies:" {mode="dev"; next}
    /^[a-zA-Z0-9_]+:/ {
      pkg=$1; sub(":", "", pkg)
      if (mode == "dep") dep[pkg]++
      if (mode == "dev") dev[pkg]++
    }
    END {
      for (pkg in dep)
        if (dev[pkg]) print pkg
    }
  ' pubspec.yaml)

  if [[ -n "$dep_list" ]]; then
    red "⚠️ 检测到重复依赖（同时出现在 dependencies 与 dev_dependencies）："
    for pkg in $dep_list; do
      red "   - $pkg"
    done
  fi
}
check_duplicate_dependencies

# ========== 用户交互：可选命令 ==========
ask_feature_toggle() {
  local prompt="$1"
  echo ""
  echo "👉 $prompt"
  echo "【按回车跳过，输入 y 后回车以启用】"
  read "input?➤ "
  if [[ "$input" == "y" || "$input" == "Y" ]]; then
    echo "✅ 已启用：$prompt"
    return 0
  else
    echo "⏩ 已跳过：$prompt"
    return 1
  fi
}

if ask_feature_toggle "是否执行 flutter clean？"; then
  fvm flutter clean
fi

if ask_feature_toggle "是否执行 flutter pub get？"; then
  fvm flutter pub get
fi

if ask_feature_toggle "是否执行 flutter doctor？"; then
  fvm flutter doctor
fi

if ask_feature_toggle "是否执行 flutter analyze？"; then
  fvm flutter analyze
fi

# ========== 输出版本信息 ==========
echo ""
FLUTTER_VERSION=$(fvm flutter --version 2>/dev/null)
if [[ -n "$FLUTTER_VERSION" ]]; then
  FLUTTER_SDK_PATH="$HOME/.fvm/versions/$SELECTED_VERSION"
  red "=============================================="
  red "🎉 当前 Flutter 版本：$(echo "$FLUTTER_VERSION" | head -n1)"
  red "🎯 Dart 版本：$(echo "$FLUTTER_VERSION" | grep 'Dart')"
  red "📦 FVM 路径：$(which fvm)"
  red "📁 项目路径：$SCRIPT_DIR"
  red "📂 SDK 安装目录：$FLUTTER_SDK_PATH"
  red "=============================================="
else
  red "❌ 获取 Flutter 版本失败，请检查 FVM 是否正常"
fi
