#!/bin/zsh

# ========== 彩色输出 ==========
red()    { echo "\033[1;31m$1\033[0m"; }
green()  { echo "\033[1;32m$1\033[0m"; }
yellow() { echo "\033[1;33m$1\033[0m"; }

# ========== 📜 脚本说明 ==========
echo ""
echo "📦 本脚本将帮助你初始化 Flutter 项目环境（使用 FVM 管理）"
echo "🔍 自动检测工具 / 升级依赖 / 配置版本 / 安装 Flutter"
echo "📁 当前目录将被视为 Flutter 项目根目录"
echo ""

# ========== 获取 Flutter 项目目录 ==========
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

# ========== 获取工具全称 ==========
get_tool_name() {
    case "$1" in
        brew) echo "Homebrew" ;;
        fzf) echo "fzf (模糊查找器)" ;;
        jq) echo "jq (JSON 解析工具)" ;;
        dart) echo "Dart SDK" ;;
        *) echo "$1" ;;
    esac
}

# ========== 检查/安装/升级 工具 ==========
check_install_tool() {
    local tool=$1
    local toolName=$(get_tool_name "$tool")
    local brewTool=$tool
    [[ "$tool" == "dart" ]] && brewTool="dart-sdk"

    if ! command -v $tool &>/dev/null; then
        yellow "🔧 未检测到 $toolName，准备安装..."

        if [[ "$brewTool" == "brew" ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            brew install "$brewTool"
        fi

        if ! command -v $tool &>/dev/null; then
            red "❌ $toolName 安装失败，请手动处理"
            exit 1
        fi
        green "✅ $toolName 安装完成"
    else
        if [[ "$tool" == "brew" ]]; then
            green "✅ 已安装 $toolName，正在执行更新流程..."
            brew update && brew upgrade && brew cleanup
            green "✅ $toolName 更新完成"
        else
            green "✅ 已安装 $toolName，正在尝试升级..."
            if brew list --formula | grep -q "^$brewTool\$"; then
                brew upgrade "$brewTool"
                green "✅ $toolName 升级完成"
            else
                yellow "⚠️ 检测到 $toolName 非 brew 安装，跳过升级"
            fi
        fi
    fi
}

# ========== 自检依赖 ==========
check_install_tool brew
check_install_tool fzf
check_install_tool jq
check_install_tool dart

# ========== 安装 FVM ==========
export PATH="$HOME/.pub-cache/bin:$PATH"
yellow "📦 安装/升级 FVM..."
dart pub global activate fvm

# ========== 读取配置版本 ==========
mkdir -p .fvm
CONFIG_FILE=".fvm/fvm_config.json"
CONFIGURED_VERSION=""
if [[ -f $CONFIG_FILE ]]; then
    CONFIGURED_VERSION=$(jq -r '.flutterSdkVersion // empty' $CONFIG_FILE)
    [[ -n $CONFIGURED_VERSION ]] && green "📄 当前配置版本：$CONFIGURED_VERSION"
fi

# ========== 获取 flutter 稳定版本 ==========
VERSIONS=$(fvm releases 2>/dev/null | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' | awk -F'│' '
/stable/ && $2 ~ /[0-9]+\.[0-9]+\.[0-9]+/ {
    gsub(/ /, "", $2);
    gsub(/^v/, "", $2);
    print $2
}' | sort -V | uniq | tac)

if [[ -n $CONFIGURED_VERSION ]]; then
    echo ""
    green "📄 当前配置版本：$CONFIGURED_VERSION"
    echo "⬇️ 请选择要使用的 Flutter 版本（当前版本已标记 ✅，回车保持当前）"
    CHOICES=$(echo "$VERSIONS" | sed "s/^$CONFIGURED_VERSION$/✅ $CONFIGURED_VERSION/")
else
    echo ""
    echo "⬇️ 可用 Flutter 稳定版本如下（回车默认选择最新）"
    CHOICES="$VERSIONS"
fi

# ========== 版本选择 ==========
RAW_SELECTED_LINE=$(echo "$CHOICES" | \
  fzf --prompt="🎯 选择要使用的 Flutter 版本：" \
      --height=50% \
      --border \
      --ansi)

SELECTED_VERSION=$(echo "$RAW_SELECTED_LINE" | sed 's/^✅ //' | grep -Eo '^[0-9]+\.[0-9]+\.[0-9]+$')

# ========== fallback ==========
if [[ -z "$SELECTED_VERSION" ]]; then
    if [[ -n $CONFIGURED_VERSION && "$CONFIGURED_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        SELECTED_VERSION=$CONFIGURED_VERSION
        yellow "📎 保持使用当前版本：$SELECTED_VERSION"
    else
        SELECTED_VERSION=$(echo "$VERSIONS" | head -n1)
        yellow "📎 未选择，默认使用最新版本：$SELECTED_VERSION"
    fi
fi

# ========== 写入配置 ==========
echo "{\"flutterSdkVersion\": \"$SELECTED_VERSION\"}" > "$CONFIG_FILE"
green "📝 已写入配置：$CONFIG_FILE"

# ========== 安装并切换版本 ==========
fvm install "$SELECTED_VERSION"
fvm use "$SELECTED_VERSION"

# ========== flutter 命令别名 ==========
if ! grep -q 'flutter()' ~/.zshrc; then
    echo '' >> ~/.zshrc
    echo 'flutter() { fvm flutter "$@"; }' >> ~/.zshrc
    green "✅ flutter 命令别名已写入 ~/.zshrc"
fi

# ========== 检查 flutter 项目关键文件 ==========
echo ""
if [[ -f .packages ]]; then
    green "📁 已检测到 .packages 文件"
else
    yellow "⚠️ 未检测到 .packages 文件"
fi

if [[ -d .dart_tool ]]; then
    green "📁 已检测到 .dart_tool 目录"
else
    yellow "⚠️ 未检测到 .dart_tool 目录"
fi

# ========== 用户交互开关函数 ==========
ask_feature_toggle() {
    local prompt="$1"
    echo ""
    echo "👉 $prompt"
    echo "【按回车跳过，或按 空格 再回车 以启用】"
    read -r -s -n1 key
    if [[ "$key" == " " ]]; then
        echo "✅ 已启用：$prompt"
        return 0
    else
        echo "⏩ 已跳过：$prompt"
        return 1
    fi
}

# ========== 可选执行命令 ==========
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

# ========== 版本输出 ==========
echo ""
red "=============================================="
red "🎉 当前 Flutter 版本：$(cd "$SCRIPT_DIR" && fvm flutter --version | head -n1)"
red "🎯 Dart 版本：$(cd "$SCRIPT_DIR" && fvm flutter --version | grep 'Dart')"
red "📦 FVM 路径：$(which fvm)"
red "📁 项目路径：$SCRIPT_DIR"
red "=============================================="
