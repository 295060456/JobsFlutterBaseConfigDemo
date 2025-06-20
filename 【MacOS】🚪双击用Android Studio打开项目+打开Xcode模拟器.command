#!/bin/zsh

###########################
# ☕️ 提前检测并安装 Java（OpenJDK）
###########################

java_home=$(/usr/libexec/java_home 2>/dev/null)

if [[ -z "$java_home" ]]; then
    echo ""
    echo "❌ 未检测到 Java 环境"
    echo "📦 可安装的 OpenJDK 版本如下（Adoptium Temurin）："
    echo "1. temurin@8"
    echo "2. temurin@11"
    echo "3. temurin@17 ✅（默认推荐）"
    echo "4. temurin@21"
    echo ""
    read "jdk_choice?请输入要安装的 JDK 版本（8/11/17/21，回车默认 17）："

    case "$jdk_choice" in
        8)  jdk_version="8" ;;
        11) jdk_version="11" ;;
        17|"") jdk_version="17" ;;  # 默认
        21) jdk_version="21" ;;
        *) echo "⚠️ 无效输入，默认安装 temurin@17" ; jdk_version="17" ;;
    esac

    echo "📥 使用 Homebrew 安装 OpenJDK: temurin@$jdk_version ..."
    brew install --cask "temurin@$jdk_version"

    java_home=$(/usr/libexec/java_home 2>/dev/null)

    if [[ -z "$java_home" ]]; then
        echo "❌ 安装失败或 JAVA_HOME 未识别，请手动检查 Java 安装"
        exit 1
    else
        echo "✅ Java 安装完成：$java_home"
    fi
else
    echo "✅ 已检测到 Java 安装：$java_home"
fi

export JAVA_HOME="$java_home"
echo "☕️ JAVA_HOME 设置为: $JAVA_HOME"

###########################
# 📂 获取项目目录并切换至 android
###########################

current_directory=$(cd "$(dirname "$0")"; pwd)
echo "📂 当前项目目录: $current_directory"
cd "$current_directory/android"

###########################
# 🧹 关闭并重启 iOS 模拟器
###########################

echo "🛑 正在关闭 iOS 模拟器..."
xcrun simctl shutdown all
osascript -e 'quit app "Simulator"' && echo "✅ iOS 模拟器进程已终止"
open -a Simulator

###########################
# 🔧 设置 Android 环境变量（并写入配置）
###########################

SDK_DIR=~/Library/Android/sdk
CMDLINE_TOOLS_DIR="$SDK_DIR/cmdline-tools"
LATEST_DIR="$CMDLINE_TOOLS_DIR/latest"
TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip"

ANDROID_SDK_LINE="export ANDROID_SDK_ROOT=$SDK_DIR"
PATH_LINE="export PATH=\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:\$PATH"
JAVA_LINE='export JAVA_HOME=$(/usr/libexec/java_home)'

CONFIG_FILES=(
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.zshrc"
)

if [[ -n "$ZSH" && -f "$ZSH/oh-my-zsh.sh" ]]; then
    CONFIG_FILES+=("$ZSH/oh-my-zsh.sh")
fi

# 写入环境变量
add_env_if_needed() {
    local file=$1
    echo "📄 检查配置文件: $file"
    touch "$file"

    if ! grep -Fxq "$ANDROID_SDK_LINE" "$file"; then
        echo "$ANDROID_SDK_LINE" >> "$file"
        echo "✅ 添加 ANDROID_SDK_ROOT 到 $file"
    fi

    if ! grep -Fxq "$PATH_LINE" "$file"; then
        echo "$PATH_LINE" >> "$file"
        echo "✅ 添加 PATH 到 $file"
    fi

    if ! grep -Fxq "$JAVA_LINE" "$file"; then
        echo "$JAVA_LINE" >> "$file"
        echo "✅ 添加 JAVA_HOME 到 $file"
    fi
}

echo "🔍 正在检查并写入环境变量..."
for file in "${CONFIG_FILES[@]}"; do
    add_env_if_needed "$file"
done

# 导出当前 shell 环境
export ANDROID_SDK_ROOT="$SDK_DIR"
export PATH="$LATEST_DIR/bin:$PATH"

###########################
# 🛠️ Android SDK 工具链自检
###########################

echo ""
echo "🛠️ Android SDK 工具链自检"
echo "👉 回车跳过，任意输入 + 回车执行修复"
read "user_input?🔍 是否进行 SDK 自检："

if [[ -z "$user_input" ]]; then
    echo "⏭️ 已跳过 SDK 自检"
else
    echo "🔍 检查 cmdline-tools..."

    if [[ -d "$LATEST_DIR" ]]; then
        echo "✅ 已存在 cmdline-tools/latest"
    else
        echo "⬇️ 正在下载 cmdline-tools..."
        mkdir -p "$CMDLINE_TOOLS_DIR"
        curl -L -o "$CMDLINE_TOOLS_DIR/tools.zip" "$TOOLS_URL"
        unzip -o "$CMDLINE_TOOLS_DIR/tools.zip" -d "$CMDLINE_TOOLS_DIR/tmp"
        mv "$CMDLINE_TOOLS_DIR/tmp/cmdline-tools" "$LATEST_DIR"
        rm -rf "$CMDLINE_TOOLS_DIR/tmp" "$CMDLINE_TOOLS_DIR/tools.zip"
        echo "✅ cmdline-tools 安装完成"
    fi

    echo "📋 当前 SDK 工具列表："
    "$LATEST_DIR/bin/sdkmanager" --list
    echo "✅ SDK 自检完成"
fi

###########################
# 🚀 启动 Android Studio
###########################

open -a "Android Studio" "$current_directory"
