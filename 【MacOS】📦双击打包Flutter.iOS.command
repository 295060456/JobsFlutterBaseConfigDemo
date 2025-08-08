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
    echo ""
    highlight_echo "🛠️ 本脚本用于将 Xcode 构建出的 .app 包装为 .ipa 文件"
    info_echo "📌 功能概览："
    info_echo "1️⃣ 自动查找 Xcode 项目的 .app 文件"
    info_echo "2️⃣ 自动复制 .app 至 Payload 并打包成 .ipa"
    info_echo "3️⃣ 打包结果输出到 macOS 桌面"
    echo ""
    read "?📎 按回车开始执行，或 Ctrl+C 取消..."
}

# ✅ 项目路径检测与初始化
detect_xcode_project() {
    CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)
    highlight_echo "📂 当前目录: $CURRENT_DIR"

    PROJECT_FILES=($(find "$CURRENT_DIR" -maxdepth 1 -name "*.xcodeproj"))
    if [[ ${#PROJECT_FILES[@]} -eq 0 ]]; then
        error_echo "❌ 未找到 .xcodeproj 文件，请确保在项目目录下运行"
        exit 1
    elif [[ ${#PROJECT_FILES[@]} -gt 1 ]]; then
        error_echo "❌ 检测到多个 .xcodeproj 文件，请确保目录下仅有一个"
        for file in "${PROJECT_FILES[@]}"; do warn_echo "⚠️ $file"; done
        exit 1
    fi

    PROJECT_NAME=$(basename "${PROJECT_FILES[1]}" .xcodeproj)
    success_echo "✅ 发现 Xcode 项目: $PROJECT_NAME"
}

# ✅ 查找 .app 文件路径
find_latest_app() {
    USER_NAME=$(whoami)
    DERIVED_BASE="/Users/$USER_NAME/Library/Developer/Xcode/DerivedData"
    APP_DIR=$(ls -td "$DERIVED_BASE/${PROJECT_NAME}-"*/Build/Products/Debug-iphoneos/*.app 2>/dev/null | head -n 1)

    if [[ ! -d "$APP_DIR" ]]; then
        error_echo "❌ 未找到 .app 文件，请确认 Xcode 已构建成功"
        exit 1
    fi

    success_echo "✅ 找到 .app 文件: $APP_DIR"
}

# ✅ 执行打包
package_to_ipa() {
    DESKTOP_PATH="/Users/$(whoami)/Desktop"
    PAYLOAD_PATH="$DESKTOP_PATH/Payload"
    IPA_PATH="$DESKTOP_PATH/$PROJECT_NAME.ipa"

    [[ -d "$PAYLOAD_PATH" ]] && warn_echo "⚠️ 已存在 Payload 目录，正在删除..." && rm -rf "$PAYLOAD_PATH"

    mkdir -p "$PAYLOAD_PATH"
    success_echo "✅ 创建 Payload 文件夹"

    cp -R "$APP_DIR" "$PAYLOAD_PATH"
    success_echo "✅ 复制 .app 到 Payload"

    cd "$DESKTOP_PATH" || exit 1
    zip -qr "$PROJECT_NAME.ipa" Payload
    rm -rf "$PAYLOAD_PATH"
    success_echo "📦 打包完成：$IPA_PATH"
}

# ✅ 主函数入口
main() {
    print_intro                     # ✅ 自述信息
    detect_xcode_project            # ✅ 检查当前目录是否包含 Xcode 项目
    find_latest_app                 # ✅ 查找 DerivedData 中最新构建的 .app
    package_to_ipa                  # ✅ 执行打包流程并清理临时目录
}

main "$@"
