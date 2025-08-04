#!/bin/zsh

# ✅ 彩色输出函数（含日志）
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
    highlight_echo "🛠️  Flutter 项目一键启动脚本（VSCode + iOS 模拟器）"
    echo ""
    note_echo "📌 脚本功能说明："
    info_echo "➤ 自动打开 VSCode 并定位到指定 Flutter 项目或 Dart 启动文件"
    info_echo "➤ 自动关闭 iOS 模拟器（彻底退出，防止假后台进程）"
    info_echo "➤ 可选是否重新打开 iOS 模拟器（GUI 启动）"
    echo ""
    note_echo "📂 支持两种拖入路径："
    info_echo "1️⃣ Flutter 项目根目录（必须包含 lib/main.dart 且含 void main）"
    info_echo "2️⃣ 单个 Dart 启动文件（必须为含 void main 的文件）"
    echo ""
    read "?🟢 按回车继续执行，输入任意字符后回车退出：" user_continue
    if [[ -n "$user_continue" ]]; then
    error_echo "❌ 已取消执行"
    exit 0
    fi
}

# ✅ Flutter 项目检测
is_flutter_root() {
    [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

resolve_flutter_path() {
    local path="$1"
    while [[ ! -e "$path" || (! -d "$path" && ! -f "$path") ]]; do
        warn_echo "📂 路径无效，请拖入 Flutter 项目根目录或 Dart 文件路径："
        read -r path
        path=${path/#\~/$HOME}
        path=${path//\\/}
        path=${path%"${path##*[![:space:]]}"}  # 去尾空格
    done
    echo "$path"
}

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
          error_echo "❌ 项目中未找到 lib/main.dart 或其中无 void main"
          exit 1
        fi
    else
        error_echo "❌ 路径无效"
        exit 1
    fi
}

# ✅ 打开 VSCode 项目
open_vscode_project() {
    local main_file="$1"
    local project_dir
    project_dir=$(dirname "$main_file")
    success_echo "🚀 正在使用 VSCode 打开项目目录：$project_dir"
    code "$project_dir"
}

# ✅ 确保模拟器已关闭（自动检测真假后台）
ensure_simulator_closed() {
    _color_echo yellow "🕵️ 检测模拟器是否处于假后台..."

    booted_check=$(xcrun simctl list devices | grep "(Booted)")
    simulator_running=$(pgrep -f Simulator)

    if [[ -z "$booted_check" && -n "$simulator_running" ]]; then
      _color_echo red "❗️ 模拟器处于假后台状态，正在强制关闭..."
      xcrun simctl shutdown all >/dev/null 2>&1
      osascript -e 'quit app "Simulator"' >/dev/null 2>&1
      pkill -f Simulator >/dev/null 2>&1
      _color_echo green "✅ 已强制关闭假后台模拟器。"
    else
      _color_echo green "✅ 模拟器状态正常，无需关闭。"
    fi
}

# ✅ 重新打开 iOS 模拟器（可跳过）
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

    # ==== 获取路径 ====
    local initial_path="$1"
    local resolved_path main_file

    resolved_path=$(resolve_flutter_path "$initial_path")
    main_file=$(detect_main_file "$resolved_path")

    # ==== 打开 VSCode 项目 ====
    open_vscode_project "$main_file"

    # ==== 关闭 iOS 模拟器（含假后台判断） ====
    echo ""
    ensure_simulator_closed

    # ==== 询问是否重启 ====
    echo ""
    reopen_ios_simulator
}

main "$@"
