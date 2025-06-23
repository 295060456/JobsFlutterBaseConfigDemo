#!/bin/zsh

# 自动切换为 zsh 执行自身（防止在 bash 中出错）
if [[ -z "$ZSH_VERSION" ]]; then
    echo "🔄 正在切换为 zsh 重新执行脚本..."
    exec zsh "$0" "$@"
    exit
fi

# 彩色输出
green()  { echo "$(tput setaf 2)$1$(tput sgr0)"; }
yellow() { echo "$(tput setaf 3)$1$(tput sgr0)"; }
red()    { echo "$(tput setaf 1)$1$(tput sgr0)"; }

# 添加内容到 shell 配置
add_line_if_not_exists() {
    local file=$1
    local line=$2
    [[ -f "$file" ]] || touch "$file"
    if ! grep -qF "$line" "$file"; then
        echo '' >> "$file"
        echo "$line" >> "$file"
        green "✅ 添加到 $file：$line"
    else
        yellow "⚠️  $file 已存在：$line"
    fi
}

# 安装 Homebrew
install_brew_if_needed() {
    if ! command -v brew &>/dev/null; then
        yellow "🔧 未检测到 Homebrew，开始安装..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        if ! command -v brew &>/dev/null; then
            red "❌ Homebrew 安装失败，请手动安装 https://brew.sh"
            exit 1
        fi
        green "✅ Homebrew 安装完成"
    else
        green "✅ 已安装 Homebrew"
    fi
}

# 安装 Dart
install_dart() {
    if ! command -v dart &>/dev/null; then
        install_brew_if_needed
        yellow "🔧 开始通过 Homebrew 安装 Dart..."
        brew tap dart-lang/dart
        brew install dart
        if ! command -v dart &>/dev/null; then
            red "❌ Dart 安装失败"
            exit 1
        fi
        green "✅ Dart 安装完成"
    else
        green "✅ Dart 已安装"
    fi
}

# 安装 jq
install_jq_if_needed() {
    if ! command -v jq &>/dev/null; then
        install_brew_if_needed
        yellow "🔧 安装 jq..."
        brew install jq
        if ! command -v jq &>/dev/null; then
            red "❌ jq 安装失败"
            exit 1
        fi
        green "✅ jq 安装完成"
    else
        green "✅ jq 已安装"
    fi
}

# 安装 FVM
install_fvm() {
    dart pub global deactivate fvm &>/dev/null
    dart pub global activate fvm
}

# 添加 PATH 到 shell 文件
add_env_config() {
    add_path_if_not_commented_or_absent() {
        local file=$1
        local desc="# 配置 FVM 环境变量"
        local target='export PATH="$HOME/.pub-cache/bin:$PATH"'
        # 检查是否存在未被注释的这一行
        if ! grep -qE '^[^#]*export PATH="\$HOME/.pub-cache/bin:\$PATH"' "$file"; then
            echo "" >> "$file"
            echo "$desc" >> "$file"
            echo "$target" >> "$file"
            green "✅ 添加到 $file：$target"
        else
            yellow "⚠️  $file 中已存在有效 PATH 设置"
        fi
    }

    # 添加 PATH 环境变量（优先）
    add_path_if_not_commented_or_absent ~/.bash_profile
    add_path_if_not_commented_or_absent ~/.bashrc
    add_path_if_not_commented_or_absent ~/.zshrc

    # 添加 flutter 函数（保留原 add_line_if_not_exists 判断）
    add_line_if_not_exists ~/.zshrc 'flutter() { fvm flutter "$@"; }'

    # 立即影响当前 shell
    export PATH="$HOME/.pub-cache/bin:$PATH"

    # 不再 source，建议用户下次终端重启
    yellow "📎 环境变量已写入配置文件，重启终端后自动生效"
}

# 当前路径
cd "$(dirname "$0")"

# 环境初始化
install_dart
install_jq_if_needed

# 安装 FVM
if ! command -v fvm &> /dev/null; then
    yellow "📦 未检测到 FVM，开始安装..."
    install_fvm
    export PATH="$HOME/.pub-cache/bin:$PATH"
    green "✅ FVM 安装完成"
else
    red "⚠️  FVM 已安装"
    echo "按【空格】重新安装，按【回车】跳过：\c"
    while IFS= read -rsn1 key; do
        if [[ "$key" == " " ]]; then
            echo "\n🔄 重新安装 FVM..."
            install_fvm
            export PATH="$HOME/.pub-cache/bin:$PATH"
            green "✅ FVM 重新安装完成"
            break
        elif [[ "$key" == "" ]]; then
            echo "\n⏭️  跳过重新安装"
            break
        fi
    done
fi

# 确保 fvm 可用
export PATH="$HOME/.pub-cache/bin:$PATH"
green "🔢 当前 FVM 版本：$(fvm --version)"

# 获取最新稳定版 Flutter
green "🌐 正在获取 Flutter 最新稳定版本..."
FLUTTER_VERSION=$(fvm releases | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' \
  | awk -F'│' '/stable/ && $2 ~ /[0-9]+\.[0-9]+\.[0-9]+/ {gsub(/ /, "", $2); gsub(/^v/, "", $2); print $2}' \
  | grep -v hotfix \
  | sort -V \
  | tail -n 1)

if [[ -z "$FLUTTER_VERSION" ]]; then
    red "❌ 获取 Flutter 稳定版失败，请检查网络或 FVM 状态"
    exit 1
fi

green "📢 最新稳定版 Flutter：$FLUTTER_VERSION"

# 安装 Flutter
if ! fvm list | grep -q "$FLUTTER_VERSION"; then
    green "📥 安装 Flutter $FLUTTER_VERSION..."
    fvm install "$FLUTTER_VERSION"
else
    yellow "⚠️  Flutter $FLUTTER_VERSION 已存在，跳过安装"
fi

# 切换版本
green "🚀 切换使用 Flutter $FLUTTER_VERSION"
fvm use "$FLUTTER_VERSION" || {
    red "❌ Flutter 版本切换失败"
    exit 1
}

# 环境写入
add_env_config

# 输出信息
green "📁 Flutter SDK 路径："
which fvm

echo "$(tput smul).fvm$(tput sgr0) 目录存放本项目独立 Flutter SDK"

green "📦 当前 Flutter 版本："
fvm flutter --version

green "✅ FVM 全部配置完成，可直接使用 fvm flutter 命令或运行项目了！"

