#!/bin/sh

# 设置绿色打印函数
print_green() {
    echo "\033[1;32m$1\033[0m"
}

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
print_green "当前脚本目录：$current_directory"
cd "$current_directory"

# 关闭所有 iOS 模拟器（使用 simctl）
xcrun simctl shutdown all
print_green "已关闭所有正在运行的 iOS 模拟器"

# 检查是否存在 iOS 模拟器进程（使用 pkill 结束）
if pgrep -f 'Simulator' >/dev/null; then
    pkill -f 'Simulator'
    print_green "iOS 模拟器进程已终止"
else
    print_green "没有检测到 iOS 模拟器进程"
fi

# 启动 Xcode 模拟器
open -a Simulator
print_green "已启动 Xcode 模拟器"

# 打开 VS Code，如果找不到命令行工具则尝试自动配置
if command -v code >/dev/null 2>&1; then
    print_green "正在打开 VS Code..."
    code .
else
    echo "\033[1;33m⚠️ 未检测到 VS Code 的命令行工具（code）...\033[0m"
    insert_line='export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"'
    if grep -q 'source ~/.bash_profile' ~/.bash_profile; then
        sed -i '' "/source ~/.bash_profile/i\\
$insert_line
" ~/.bash_profile
    else
        echo "$insert_line" >> ~/.bash_profile
    fi
    source ~/.bash_profile
    print_green "VS Code 命令行工具路径已添加，请重新执行脚本"
fi

# === 脚本知识注释 ===
# xcrun simctl shutdown all：
#   关闭所有 iOS 模拟器。simctl 是 Apple 提供的模拟器管理工具。
# pkill -f 'Simulator'：
#   强制杀死所有包含 "Simulator" 字符串的进程，确保模拟器彻底关闭。

# === 在桌面创建此脚本的软链接 ===
desktop_path=~/Desktop
script_name=$(basename "$0")
link_path="$desktop_path/$script_name"

# 如果链接已存在则先删除
[ -L "$link_path" ] && rm "$link_path"

ln -s "$current_directory/$script_name" "$link_path" && print_green "✅ 已在桌面创建脚本快捷方式：$link_path"
