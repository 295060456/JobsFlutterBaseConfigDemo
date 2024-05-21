#! /bin/sh

# 格式化打印输出
print() {
    local mainMessage=$1
    local subMessage=$2
    echo "\033[1m${mainMessage}\033[0m"
    echo "\033[31m${subMessage}\033[0m"
}

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory

print "当前系统所使用的FLUTTER_STORAGE_BASE_URL为：" "$FLUTTER_STORAGE_BASE_URL"
print "当前系统所使用的PUB_HOSTED_URL为：" "$PUB_HOSTED_URL"

# 检查 .bash_profile 文件是否存在，如果不存在则创建
if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile
    print ".bash_profile文件" "已创建"
fi

# 函数: 检查并添加行
add_line_if_not_exists() {
    local line=$1
    if ! grep -qF "$line" ~/.bash_profile; then
        echo '' >> ~/.bash_profile # 写入之前，先进行提行
        echo "$line" >> ~/.bash_profile
        print "添加到.bash_profile：" "$line"
    else
        print ".bash_profile中已存在" "$line"
    fi
}

# 添加各行配置到 .bash_profile
# 配置FVM环境
add_line_if_not_exists 'export PATH="$PATH":"$HOME/.pub-cache/bin"'
# 配置VSCode环境
add_line_if_not_exists 'export PATH="$PATH":/usr/local/bin'
add_line_if_not_exists 'export PATH="$PATH":/usr/local/bin/code'

# 添加 Android 环境变量配置
add_line_if_not_exists 'export ANDROID_HOME=/Users/jobs/Library/Android/sdk'
add_line_if_not_exists 'export PATH=${PATH}:${ANDROID_HOME}/platform-tools'
add_line_if_not_exists 'export PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin'

# 添加 Flutter 环境变量配置
add_line_if_not_exists '# 配置Flutter环境'
add_line_if_not_exists '# 这里的路径即为Dart.Flutter.SDK名下的为bin目录（主要取决于你下载的SDK的绝对路径）'
add_line_if_not_exists 'export PATH=/Users/admin/Documents/Github/Flutter.sdk/Flutter.sdk_last/bin:$PATH'
add_line_if_not_exists '#【相关阅读：Flutter切换源】https://juejin.cn/post/7204285137047257148'
add_line_if_not_exists '# 防止域名在中国大陆互联网环境下的被屏蔽'
add_line_if_not_exists '# export PUB_HOSTED_URL=https://pub.flutter-io.cn # 告诉了 Dart.Flutter 和 Dart 的包管理器 pub 在执行 pub get 或 pub upgrade 命令时使用备用仓库而不是默认的官方仓库。'
add_line_if_not_exists '# Flutter官方正版源（温馨提示：海外IP访问大陆源，不开VPN会拉取失败）'
add_line_if_not_exists 'export PUB_HOSTED_URL=https://pub.dartlang.org'
add_line_if_not_exists '# FLUTTER_STORAGE_BASE_URL 告诉了 Dart.Flutter SDK 在需要下载二进制文件或工具时从备用存储库获取，而不是从默认的 Google 存储库获取。'
add_line_if_not_exists '# export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn # Flutter中国（七牛云）'
add_line_if_not_exists 'export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com # Flutter官方的 Google Cloud 存储库地址'
# 配置终端打开的路径
add_line_if_not_exists 'cd ./Desktop'

# 检查并添加 #source ~/.bash_profile 行
if ! grep -qF '#source ~/.bash_profile' ~/.bash_profile; then
    echo '' >> ~/.bash_profile # 写入之前，先进行提行
    echo '#source ~/.bash_profile' >> ~/.bash_profile
    print "添加到.bash_profile：" '#source ~/.bash_profile'
else
    print ".bash_profile中已存在" '#source ~/.bash_profile'
fi

# 打开主目录和 .bash_profile 文件
open ~/
open ~/.bash_profile

# 重新加载 .bash_profile
echo "重新加载 .bash_profile"
source ~/.bash_profile
