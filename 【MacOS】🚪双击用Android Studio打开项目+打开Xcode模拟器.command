#!/bin/zsh

# ✅ 全局变量与日志
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
print_intro_and_wait() {
    clear
    success_echo "📦 脚本功能：打开 Android Studio 项目并重启 iOS 模拟器"
    echo ""
    info_echo "1️⃣ 支持拖入 Flutter 项目根目录（需包含 lib/main.dart 且有 void main）"
    info_echo "2️⃣ 支持拖入 Dart 启动文件（需包含 void main）"
    echo ""
    read "?🟢 按回车继续，任意键退出：" user_continue
    [[ -n "$user_continue" ]] && error_echo "❌ 已取消执行" && exit 0
}

# ✅ 输入路径处理逻辑
resolve_target_path() {
    local path="$1"
    while [[ ! -e "$path" ]]; do
        echo ""
        warn_echo "📂 未检测到有效路径，请拖入 Flutter 项目根目录或 Dart 启动文件："
        read "path?👉 拖入路径："
        path="${path/#\~/$HOME}"
        path="${path%"${path##*[![:space:]]}"}"
        path="${path//\\/}"
    done
    echo "$path"
}

# ✅ 判断 main 函数文件路径
detect_main_file() {
    local target="$1"
    if [[ -f "$target" ]]; then
        if grep -q "void main" "$target"; then
          echo "$target"
        else
          error_echo "❌ 文件中不包含 void main"
          exit 1
        fi
    elif [[ -d "$target" ]]; then
        local main_file="$target/lib/main.dart"
        if [[ -f "$main_file" ]] && grep -q "void main" "$main_file"; then
          echo "$main_file"
        else
          error_echo "❌ 项目中未找到 lib/main.dart 或文件中无 void main"
          exit 1
        fi
    else
        error_echo "❌ 无效路径"
        exit 1
    fi
}

# ✅ 打开 Android Studio
open_android_studio() {
    local main_file="$1"
    local project_dir
    project_dir=$(dirname "$main_file")
    success_echo "🚀 即将打开 Android Studio 项目：$project_dir"
    open -a "Android Studio" "$project_dir"
}

# ✅ 关闭 iOS 模拟器
close_ios_simulator() {
    warn_echo "🛑 正在关闭所有 iOS 模拟器..."
    xcrun simctl shutdown all >/dev/null 2>&1
    osascript -e 'quit app "Simulator"' >/dev/null 2>&1
    sleep 1

    if pgrep -f Simulator >/dev/null; then
        pkill -f Simulator
        sleep 1
        success_echo "✅ iOS 模拟器已彻底终止（包含假后台）"
    else
        success_echo "✅ iOS 模拟器进程已正常关闭"
    fi
}

# ✅ 打开 iOS 模拟器（可跳过）
reopen_ios_simulator() {
    echo ""
    read "?📱 按回车重新打开 iOS 模拟器，输入任意内容后回车跳过：" sim_input
    if [[ -z "$sim_input" ]]; then
        open -a Simulator
        success_echo "✅ iOS 模拟器已重新打开"
    else
        warn_echo "⏭️ 已跳过打开模拟器"
    fi
}

# ✅ 主函数入口
main() {
    # ==== 自述信息 ====
    print_intro_and_wait

    # ==== 解析路径 ====
    local target_path="$1"
    target_path=$(resolve_target_path "$target_path")
    local main_file
    main_file=$(detect_main_file "$target_path")

    # ==== 打开 Android Studio ====
    open_android_studio "$main_file"

    # ==== 重启 iOS 模拟器 ====
    echo ""
    close_ios_simulator
    echo ""
    reopen_ios_simulator
}

main "$@"

# xcrun simctl shutdown all：
# 这是一个由苹果提供的命令行工具，用于与模拟器进行交互。
# simctl是用于管理iOS模拟器的工具，可以执行各种操作，如启动、关闭、安装应用等。
# shutdown all参数会关闭所有当前正在运行的iOS模拟器。

# pkill -f 'Simulator'：
# 这是一个通用的Unix/Linux命令，用于根据进程名终止进程。
# pkill会根据提供的模式（这里是'Simulator'）终止匹配的进程。
# 这个命令会终止包含"Simulator"字符串的所有进程，无论它们是何种进程（包括但不限于iOS模拟器）。
