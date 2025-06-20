#!/bin/zsh

# 给输出加点颜色
green()  { print "\033[0;32m$1\033[0m"; }
yellow() { print "\033[0;33m$1\033[0m"; }

# 通用函数：检查并添加行到某个配置文件
add_line_if_not_exists() {
    local file=$1
    local line=$2
    [[ -f $file ]] || touch $file
    if ! grep -qF "$line" "$file"; then
        echo '' >> "$file"
        echo "$line" >> "$file"
        green "✅ 添加到 ${file##*/}：$line"
    else
        yellow "⚠️  ${file##*/} 中已存在：$line"
    fi
}

# macOS 不支持 readlink -f，改用以下兼容方式
current_directory=$(cd "$(dirname "$0")"; pwd)
cd "$current_directory"

# 检查 FVM 是否已安装
if ! command -v fvm &> /dev/null; then
    echo "📦 FVM 未安装，开始安装..."

    dart pub global activate fvm

    add_line_if_not_exists ~/.bash_profile 'export PATH="$PATH:$HOME/.pub-cache/bin"'
    add_line_if_not_exists ~/.bashrc 'export PATH="$PATH:$HOME/.pub-cache/bin"'
    add_line_if_not_exists ~/.zshrc 'export PATH="$PATH:$HOME/.pub-cache/bin"'

    [[ -f ~/.bash_profile ]] && source ~/.bash_profile
    [[ -f ~/.bashrc ]] && source ~/.bashrc
    [[ -f ~/.zshrc ]] && source ~/.zshrc

    green "✅ FVM 安装完成"
else
    green "✅ FVM 已安装"
fi

# 安装并使用 flutter SDK
# 下载最新的fvm稳定版
fvm install stable
#fvm install 3.7.12
# 此项目里面用的flutter的SDK版本，固定死就是3.7.12
#fvm use 3.7.12
# 使用最新的fvm稳定版
fvm use stable

# 检查环境
fvm flutter doctor -v
fvm flutter --version
fvm flutter pub get
fvm flutter precache
