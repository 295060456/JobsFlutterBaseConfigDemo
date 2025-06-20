#!/bin/bash

# 获取 pub 缓存路径
Pub_Cache_Path="$HOME/.pub-cache"

# 格式化打印
print() {
    local title=$1
    local content=$2
    echo -e "\033[1m$title\033[0m"
    echo -e "\033[33m$content\033[0m"
}

# 显示路径
print "📦 Pub 缓存路径：" "$Pub_Cache_Path"

# 打开缓存文件夹
open "$Pub_Cache_Path"

# 提示确认
read -r -p "🧹 按回车键清空 .pub-cache 内容，输入其他内容退出..."

if [[ ! $REPLY ]]; then
    rm -rf "$Pub_Cache_Path"/*
    echo -e "✅ \033[32m.pub-cache 清理完成！\033[0m"
else
    echo -e "❎ \033[31m取消清理。\033[0m"
fi
