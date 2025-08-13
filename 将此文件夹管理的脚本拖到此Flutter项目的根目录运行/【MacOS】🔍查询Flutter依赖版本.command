#!/bin/zsh

# ✅ 日志与输出函数
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
print_intro() {
    clear
    highlight_echo "📦 本脚本用于查询 Flutter 项目依赖的实际版本（来源：pubspec.lock）"
    info_echo "1️⃣ 自动识别当前目录是否为 Flutter 项目"
    info_echo "2️⃣ 如果不是，则提示拖入项目路径"
    info_echo "3️⃣ 支持一次输入多个依赖名（用空格分隔）"
    info_echo "4️⃣ 查询结果自动格式化显示"
    info_echo "5️⃣ 查询成功后延迟 2 秒关闭终端窗口"
    echo ""
}

# ✅ 项目路径获取
detect_flutter_project_dir() {
    local dir="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
    if [[ -f "$dir/pubspec.lock" && -f "$dir/pubspec.yaml" ]]; then
        flutter_project_dir="$dir"
        success_echo "✅ 已自动识别 Flutter 项目目录：$flutter_project_dir"
    else
        warn_echo "⚠️ 未检测到 Flutter 项目，请拖入包含 pubspec.lock 的项目目录："
        read -r user_input
        user_input="${user_input//\"/}"

        if [[ ! -d "$user_input" ]]; then
            error_echo "❌ 无效路径：$user_input"
            exit 1
        fi

        if [[ ! -f "$user_input/pubspec.lock" || ! -f "$user_input/pubspec.yaml" ]]; then
            error_echo "❌ 非有效 Flutter 项目根目录（缺 pubspec.lock 或 pubspec.yaml）"
            exit 1
        fi

        flutter_project_dir="$user_input"
        success_echo "✅ 项目路径已识别：$flutter_project_dir"
    fi

    cd "$flutter_project_dir" || exit 1
    gray_echo "📂 当前目录：$flutter_project_dir"
}

# ✅ 查询依赖版本（持续循环）
query_dependencies_loop() {
  while true; do
    echo ""
    read "?📦 请输入依赖包名（多个空格分隔，输入 exit 退出）： " package_line

    # 用户输入 exit 或 quit 才退出
    if [[ "$package_line" == "exit" || "$package_line" == "quit" ]]; then
      close_terminal
    fi

    # 如果用户直接回车，不退出，而是提醒重新输入
    if [[ -z "$package_line" ]]; then
      warn_echo "⚠️ 请输入至少一个依赖名（或输入 exit 退出）"
      continue
    fi

    local package_list=(${(z)package_line})
    local all_not_found=true

    echo ""
    highlight_echo "🔍 查询结果："
    echo "──────────────────────────────────────────────"

    for pkg in $package_list; do
        version=$(awk "/$pkg:/{found=1} found && /version: /{print \$2; exit}" pubspec.lock)
        if [[ -n "$version" ]]; then
            printf "\033[1;32m✔ %-25s 版本：%s\033[0m\n" "$pkg" "$version" | tee -a "$LOG_FILE"
            all_not_found=false
        else
            printf "\033[1;31m✖ %-25s 未找到或未集成\033[0m\n" "$pkg" | tee -a "$LOG_FILE"
        fi
    done

    echo "──────────────────────────────────────────────"

    if [[ "$all_not_found" == true ]]; then
        warn_echo "⚠️ 没有任何有效依赖，请重新输入"
        continue
    fi

    success_echo "✅ 查询完成，可继续输入新的依赖名（或输入 exit 退出）"
  done
}

# ✅ 关闭终端窗口
close_terminal() {
    info_echo "👋 退出脚本"
    sleep 1
    osascript <<EOF
tell application "Terminal"
  if front window exists then close front window
end tell
EOF
    exit 0
}

# ✅ 主函数入口
main() {
    print_intro                         # ✅ 自述信息
    detect_flutter_project_dir          # ✅ 自动识别或用户拖入 Flutter 项目路径
    query_dependencies_loop             # ✅ 开始依赖查询循环
}

main "$@"
