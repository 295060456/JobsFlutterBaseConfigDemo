#!/bin/zsh

# ========== 彩色输出 ==========
red()    { echo "\033[1;31m$1\033[0m"; }
green()  { echo "\033[1;32m$1\033[0m"; }
yellow() { echo "\033[1;33m$1\033[0m"; }
blue()   { echo "\033[1;34m$1\033[0m"; }

# ========== 自述 ==========
clear
green "📦 本脚本用于打开 Android Studio 并定位到 Flutter 项目或 Dart 启动文件"
green "===================================================================="
green "👉 支持："
green "   1. 拖入 Flutter 项目根目录（需包含 lib/main.dart 且有 void main）"
green "   2. 拖入单个 Dart 文件（需包含 void main）"
green "===================================================================="
echo ""
read "?🟢 按回车继续，任意键退出：" user_continue
if [[ -n "$user_continue" ]]; then
    red "❌ 已取消执行"
    exit 0
fi

# ========== 判断输入路径 ==========
target_path="$1"

while [[ ! -e "$target_path" ]]; do
    echo ""
    yellow "📂 当前目录不是 Flutter 项目，请拖入 Flutter 项目根目录或 Dart 启动文件："
    read "target_path?👉 拖入路径："
    target_path="${target_path/#\~/$HOME}"  # 展开 ~
    target_path="${target_path%"${target_path##*[![:space:]]}"}" # 去尾部空格
    target_path="${target_path//\\/}" # 移除反斜线
done

# ========== 判断 main.dart 或单文件 ==========
if [[ -d "$target_path" ]]; then
    # 是目录，尝试找 lib/main.dart
    main_file="$target_path/lib/main.dart"
    if [[ ! -f "$main_file" ]]; then
        red "❌ 未找到 lib/main.dart，无法继续"
        exit 1
    fi
else
    # 是文件
    main_file="$target_path"
fi

# ========== 检查是否含 void main ==========
if ! grep -qE '^\s*void\s+main\s*\(\s*\)' "$main_file"; then
    red "❌ 文件中未找到未被注释的 void main()，不是有效启动文件"
    exit 1
fi

# ========== 打开 Android Studio ==========
project_dir=$(dirname "$main_file")
green "🚀 即将打开 Android Studio 项目：$project_dir"
open -a "Android Studio" "$project_dir"

# ========== 关闭 iOS 模拟器：彻底退出，防止假后台 ==========
close_simulator_safely() {
    yellow "🛑 正在关闭所有 iOS 模拟器..."
    xcrun simctl shutdown all >/dev/null 2>&1
    osascript -e 'quit app "Simulator"' >/dev/null 2>&1
    sleep 1

    if pgrep -f Simulator >/dev/null; then
        pkill -f Simulator
        sleep 1
        green "✅ iOS 模拟器已彻底终止（包含假后台）"
    else
        green "✅ iOS 模拟器进程已正常关闭"
    fi
}

# ========== 启动 iOS 模拟器 ==========
echo ""
close_simulator_safely

echo ""
read "?📱 按回车重新打开 iOS 模拟器，输入任意内容后回车跳过：" sim_input
if [[ -z "$sim_input" ]]; then
    open -a Simulator
    green "✅ iOS 模拟器已重新打开"
else
    yellow "⏭️ 已跳过打开模拟器"
fi

#xcrun simctl shutdown all：
#这是一个由苹果提供的命令行工具，用于与模拟器进行交互。
#simctl是用于管理iOS模拟器的工具，可以执行各种操作，如启动、关闭、安装应用等。
#shutdown all参数会关闭所有当前正在运行的iOS模拟器。

#pkill -f 'Simulator'：
#这是一个通用的Unix/Linux命令，用于根据进程名终止进程。
#pkill会根据提供的模式（这里是'Simulator'）终止匹配的进程。
#这个命令会终止包含"Simulator"字符串的所有进程，无论它们是何种进程（包括但不限于iOS模拟器）。
