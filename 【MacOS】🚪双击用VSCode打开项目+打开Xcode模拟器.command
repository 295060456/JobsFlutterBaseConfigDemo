#!/bin/zsh

# ========== 彩色输出 ==========
_color_echo() {
  local color="$1"
  local text="$2"
  case "$color" in
    green) echo "\033[32m$text\033[0m" ;;
    red) echo "\033[31m$text\033[0m" ;;
    yellow) echo "\033[33m$text\033[0m" ;;
    blue) echo "\033[34m$text\033[0m" ;;
    cyan) echo "\033[36m$text\033[0m" ;;
    *) echo "$text" ;;
  esac
}

# ========== 自述 ==========
clear
_color_echo green "🛠️  Flutter 项目一键启动脚本（VSCode + iOS 模拟器）"
_color_echo green "===================================================================="
_color_echo green "📌 脚本功能说明："
_color_echo green "   ➤ 自动打开 VSCode 并定位到指定的 Flutter 项目或 Dart 启动文件"
_color_echo green "   ➤ 自动关闭 iOS 模拟器（彻底退出，防止假后台进程）"
_color_echo green "   ➤ 可选是否重新打开 iOS 模拟器（支持 GUI 方式）"
_color_echo green ""
_color_echo green "📂 支持两种拖入路径："
_color_echo green "   1️⃣ Flutter 项目根目录（必须包含 lib/main.dart 且含 void main）"
_color_echo green "   2️⃣ 单个 Dart 文件（必须为有效启动文件，含未被注释的 void main）"
_color_echo green ""
_color_echo green "🔒 脚本内置多重校验，确保不会误打开无效文件"
_color_echo green "===================================================================="
echo ""
read "?🟢 按回车继续执行，输入任意字符后回车退出：" user_continue
if [[ -n "$user_continue" ]]; then
    _color_echo red "❌ 已取消执行"
    exit 0
fi

# ========== 检测路径 ==========
script_path="$0"
script_dir="$(cd "$(dirname "$0")" && pwd)"
_color_echo blue "📁 当前检测路径：$script_dir"

is_flutter_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

flutter_root="$script_dir"
cd "$flutter_root" || exit 1

while ! is_flutter_root "$flutter_root"; do
  _color_echo yellow "⚠️ 当前目录不是 Flutter 项目根目录"
  echo "📂 请拖入 Flutter 项目根目录（必须包含 pubspec.yaml 和 lib/）："
  read -r user_input
  user_input=${user_input//\"/}
  flutter_root="$user_input"
done

cd "$flutter_root" || exit 1
_color_echo green "✅ 已识别 Flutter 项目根目录：$flutter_root"

# ✅ main.dart 检查
entry_file="$flutter_root/lib/main.dart"
[[ ! -f "$entry_file" ]] && _color_echo red "❌ 缺少 lib/main.dart" && exit 1

if ! grep -E '^\s*void\s+main\s*\(\s*\)' "$entry_file" | grep -v '^\s*//' >/dev/null; then
  _color_echo red "❌ lib/main.dart 中未检测到未被注释的 void main()"
  exit 1
fi

# ========== 检查是否含有效 void main() ==========
if ! grep -qE '^\s*void\s+main\s*\(\s*\)' "$entry_file"; then
    _color_echo red "❌ 文件中未找到未被注释的 void main()，不是有效启动文件"
    exit 1
fi

# ========== 打开 VSCode ==========
_color_echo green "🚀 即将使用 VSCode 打开 Flutter 项目根目录：$flutter_root"
code "$flutter_root"

# ========== 模拟器关闭函数 ==========
close_simulator_safely() {
    _color_echo yellow "🛑 正在关闭所有 iOS 模拟器..."
    xcrun simctl shutdown all >/dev/null 2>&1
    osascript -e 'quit app "Simulator"' >/dev/null 2>&1
    sleep 1

    if pgrep -f Simulator >/dev/null; then
        pkill -f Simulator
        sleep 1
        _color_echo green "✅ iOS 模拟器已彻底终止（包含假后台）"
    else
        _color_echo green "✅ iOS 模拟器进程已正常关闭"
    fi
}

# ========== 启动 iOS 模拟器 ==========
echo ""
close_simulator_safely

echo ""
read "?📱 按回车重新打开 iOS 模拟器，输入任意内容后回车跳过：" sim_input
if [[ -z "$sim_input" ]]; then
    open -a Simulator
    _color_echo green "✅ iOS 模拟器已重新打开"
else
    _color_echo yellow "⏭️ 已跳过打开模拟器"
fi
