#!/bin/sh

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory
cd $current_directory/android

# 打开Android Studio
open -a "Android Studio" $current_directory/android

# 在桌面创建软链接（快捷方式）
desktop_link="$HOME/Desktop/启动AndroidStudio.sh"

# 如果已经存在同名链接则先删除
[ -L "$desktop_link" ] && rm "$desktop_link"

# 创建软链接
ln -s "$0" "$desktop_link"
echo "\033[1;32m已在桌面创建快捷方式：$desktop_link\033[0m"
