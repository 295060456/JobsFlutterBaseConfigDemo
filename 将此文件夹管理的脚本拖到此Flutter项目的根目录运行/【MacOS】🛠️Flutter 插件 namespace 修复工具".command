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
print_intro_and_confirm() {
    clear
    highlight_echo "🛠️ Flutter 插件 namespace 修复工具"
    echo ""
    note_echo "📌 功能说明："
    info_echo "➤ 自动查找 .pub-cache 中缺失 namespace 的 build.gradle / build.gradle.kts 插件"
    info_echo "➤ 依据 AndroidManifest.xml 中的 package 字段自动注入 namespace"
    info_echo "➤ 插入位置位于 android { ... } 块中，支持 Groovy 与 Kotlin DSL"
    echo ""
    read "?📎 按回车开始修复（或输入任意内容 + 回车退出）：" confirm
    if [[ -n "$confirm" ]]; then
    error_echo "❌ 已取消执行"
    exit 0
    fi
}

# ✅ 插件 namespace 修复主逻辑
fix_plugin_namespaces() {
    local gradle_file manifest_file package_name
    note_echo "🔍 正在扫描 .pub-cache 插件目录..."

    find "$HOME/.pub-cache/hosted" -type f \( -name "build.gradle" -o -name "build.gradle.kts" \) | while read -r gradle_file; do
    # 已存在 namespace 的跳过
    if grep -q "namespace" "$gradle_file"; then
      gray_echo "⏩ 已含 namespace，跳过：$gradle_file"
      continue
    fi

    manifest_file="$(dirname "$gradle_file")/src/main/AndroidManifest.xml"
    [[ ! -f "$manifest_file" ]] && gray_echo "⛔ 缺失 AndroidManifest.xml，跳过：$gradle_file" && continue

    package_name=$(grep "package=" "$manifest_file" | head -n 1 | sed -E 's/.*package="([^"]+)".*/\1/')
    [[ -z "$package_name" ]] && warn_echo "⚠️ 未提取到 package 字段，跳过：$manifest_file" && continue

    note_echo "🛠️ 修复插件：$gradle_file"
    if [[ "$gradle_file" == *.kts ]]; then
      # Kotlin DSL 插入
      sed -i '' "/android[[:space:]]*{/a\\
        namespace = \"$package_name\"
        " "$gradle_file"
    else
      # Groovy 插入
      sed -i '' "/android[[:space:]]*{/a\\
        namespace '$package_name'
        " "$gradle_file"
    fi
        success_echo "✅ 插入 namespace：$package_name"
    done
}

# ✅ 主函数入口
main() {
    print_intro_and_confirm                       # 自述信息
    fix_plugin_namespaces                         # 插件 namespace 修复主逻辑
    echo ""
    success_echo "🎉 插件修复完成，请重新执行打包命令"
}

main "$@"
