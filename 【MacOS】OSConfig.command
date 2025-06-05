#!/bin/sh

# 格式化打印输出为绿色
print() {
    local mainMessage=$1
    local subMessage=$2
    echo "\033[1;32m${mainMessage}\033[0m"
    echo "\033[32m${subMessage}\033[0m"
}

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory

print "当前系统所使用的FLUTTER_STORAGE_BASE_URL为：" "$FLUTTER_STORAGE_BASE_URL"
print "当前系统所使用的PUB_HOSTED_URL为：" "$PUB_HOSTED_URL"

# 检查 ~/.bash_profile 文件是否存在，如果不存在则创建
if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile
    print "~/.bash_profile 文件" "已创建"
fi

# 向 ~/.bash_profile 添加配置（无空行 + 带中文注释）
add_line_if_not_exists_bash_profile() {
    local line="$1"
    if ! grep -Fxq "$line" ~/.bash_profile; then
        echo "$line" >> ~/.bash_profile
        print "添加到 ~/.bash_profile：" "$line"
    else
        print "~/.bash_profile 中已存在" "$line"
    fi
}

# 向 ~/.zshrc 添加配置（无空行 + 带中文注释）
add_line_if_not_exists_zshrc() {
    local line="$1"
    if ! grep -Fxq "$line" ~/.zshrc; then
        echo "$line" >> ~/.zshrc
        print "添加到 ~/.zshrc：" "$line"
    else
        print "~/.zshrc 中已存在" "$line"
    fi
}

# 添加带注释的环境变量配置
add_line_if_not_exists_bash_profile 'export PATH="$PATH":"$HOME/.pub-cache/bin" # Dart pub 工具路径，安装 dart/flutter 包时用'
add_line_if_not_exists_bash_profile 'export PATH="$PATH":/usr/local/bin # 常用工具路径，Homebrew 默认路径'
add_line_if_not_exists_bash_profile 'export PATH="$PATH":/usr/local/bin/code # VSCode 的 code 命令（如果手动放入该路径）'

add_line_if_not_exists_bash_profile 'export ANDROID_HOME=/Users/jobs/Library/Android/sdk # Android SDK 路径，Flutter 构建 Android 应用必须配置'
add_line_if_not_exists_bash_profile 'export PATH=${PATH}:${ANDROID_HOME}/platform-tools # Android adb 工具路径'
add_line_if_not_exists_bash_profile 'export PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin # Android 命令行工具路径'

add_line_if_not_exists_bash_profile 'export PATH="$PATH:`pwd`/flutter/bin" # 当前目录下 Flutter SDK 的 bin 路径，便于 flutter 命令调用'
add_line_if_not_exists_bash_profile 'export PATH=/Users/admin/Documents/Github/Flutter.sdk/Flutter.sdk_last/bin:$PATH # 自定义 Flutter SDK 路径'
add_line_if_not_exists_bash_profile 'export PUB_HOSTED_URL=https://pub.dartlang.org # Dart/Flutter 官方 pub 包源地址'
add_line_if_not_exists_bash_profile 'export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com # Flutter 官方 Google Cloud 存储源'
add_line_if_not_exists_bash_profile 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # 配置 VSCode 的 code 命令'
add_line_if_not_exists_bash_profile 'cd ./Desktop # 启动终端时进入桌面目录'
add_line_if_not_exists_bash_profile '#source ~/.bash_profile # 如果需要自动加载配置，可以取消注释此行'

# 可选：向 ~/.zshrc 添加内容（如有）
# 示例：
# add_line_if_not_exists_zshrc 'export PATH="$PATH:/some/zsh/path" # 示例注释'

# 打开主目录和 .bash_profile 文件
open ~/
open ~/.bash_profile

# 重新加载 ~/.bash_profile
echo "重新加载 ~/.bash_profile"
source ~/.bash_profile
