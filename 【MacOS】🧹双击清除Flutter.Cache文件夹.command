#!/bin/bash

# 格式化打印输出
print() {
    local mainMessage=$1
    local subMessage=$2
    echo -e "\033[1m${mainMessage}\033[0m"
    echo -e "\033[31m${subMessage}\033[0m"
}

# 获取当前用户的主目录
USER_HOME=$HOME

# 获取cache文件夹路径并打开
Flutter_Cache_Path=$USER_HOME/Documents/GitHub/Flutter.SDK/flutter/bin/cache
print "Flutter.cache路径为：" "$Flutter_Cache_Path"
open $Flutter_Cache_Path

# 提示用户按回车键继续删除
read -r -p "按回车键继续删除，输入其他内容退出..."

# 检查用户输入是否为空（回车键）
if [[ ! $REPLY ]]; then
    # 删除 cache 文件夹下的所有文件
    rm -rf $Flutter_Cache_Path/*
    echo "删除成功！"
else
    echo "未删除任何文件。"
fi
