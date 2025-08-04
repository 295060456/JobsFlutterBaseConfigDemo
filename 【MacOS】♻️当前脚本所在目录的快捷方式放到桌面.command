#!/bin/zsh
clear
# ✅ 获取当前脚本所在目录 🌟
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"

# ✅ 获取桌面路径 🖥️
DESKTOP_PATH=~/Desktop

# ✅ 提取目录名作为别名名称 📁
ALIAS_NAME="$(basename "$SCRIPT_PATH")"

# ✅ 别名完整路径 🎯
ALIAS_PATH="$DESKTOP_PATH/${ALIAS_NAME}.alias"

# ✅ 使用 AppleScript 创建 Finder 别名 🍎
echo "📦 正在将「$SCRIPT_PATH」的别名发送到桌面..."
osascript <<EOF
tell application "Finder"
    make alias file to POSIX file "$SCRIPT_PATH" at POSIX file "$DESKTOP_PATH"
end tell
EOF

echo "✅ 别名创建完成：$ALIAS_NAME（位于桌面）"
