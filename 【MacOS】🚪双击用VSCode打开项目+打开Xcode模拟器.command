#!/bin/zsh

# ========== 彩色输出 ==========
red()    { echo "\033[1;31m$1\033[0m"; }
green()  { echo "\033[1;32m$1\033[0m"; }
yellow() { echo "\033[1;33m$1\033[0m"; }
blue()   { echo "\033[1;34m$1\033[0m"; }

# ========== 自述 ==========
clear
green "🛠️  Flutter 项目一键启动脚本（VSCode + iOS 模拟器）"
green "===================================================================="
green "📌 脚本功能说明："
green "   ➤ 自动打开 VSCode 并定位到指定的 Flutter 项目或 Dart 启动文件"
green "   ➤ 自动关闭 iOS 模拟器（彻底退出，防止假后台进程）"
green "   ➤ 可选是否重新打开 iOS 模拟器（支持 GUI 方式）"
green ""
green "📂 支持两种拖入路径："
green "   1️⃣ Flutter 项目根目录（必须包含 lib/main.dart 且含 void main）"
green "   2️⃣ 单个 Dart 文件（必须为有效启动文件，含未被注释的 void main）"
green ""
green "🔒 脚本内置多重校验，确保不会误打开无效文件"
green "===================================================================="
echo ""
read "?🟢 按回车继续执行，输入任意字符后回车退出：" user_continue
if [[ -n "$user_continue" ]]; then
    red "❌ 已取消执行"
    exit 0
fi

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

# ========== 打开 VSCode ==========
project_dir=$(dirname "$main_file")
green "🚀 即将使用 VSCode 打开项目：$project_dir"
code "$project_dir"

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
