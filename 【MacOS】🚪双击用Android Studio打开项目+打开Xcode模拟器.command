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
