#!/bin/sh

# ANSI 颜色
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

print_title() {
    echo ""
    echo "${CYAN}🔹 $1${RESET}"
}

print_ok() {
    echo "${GREEN}✅ $1${RESET}"
}

print_warn() {
    echo "${YELLOW}⚠️ $1${RESET}"
}

print_error() {
    echo "${RED}❌ $1${RESET}"
}

print_value() {
    echo "${YELLOW}$1:${RESET} $2"
}

# 进入当前脚本所在目录
current_directory=$(cd "$(dirname "$0")"; pwd)
print_value "📂 当前脚本目录" "$current_directory"
cd "$current_directory" || exit 1

######################################
# 系统信息
######################################

print_title "系统基本信息"
print_value "系统版本" "$(sw_vers | grep ProductVersion | awk '{print $2}')"
print_value "Shell" "$SHELL"
print_value "当前用户" "$USER"

######################################
# Flutter & FVM
######################################

print_title "Flutter / FVM 信息"
if command -v fvm >/dev/null 2>&1; then
    print_ok "检测到 fvm"
    print_value "fvm 路径" "$(which fvm)"
    fvm flutter --version
else
    print_warn "未检测到 fvm，使用系统 flutter"
    flutter --version
fi

######################################
# Dart
######################################

print_title "Dart 信息"
if command -v dart >/dev/null 2>&1; then
    dart --version
else
    print_warn "未检测到 dart 命令"
fi

######################################
# Xcode
######################################

print_title "Xcode 信息"
if command -v xcodebuild >/dev/null 2>&1; then
    print_value "Xcode 版本" "$(xcodebuild -version | head -n 1)"
    print_value "Xcode 路径" "$(xcode-select -p)"
else
    print_error "未检测到 xcodebuild"
fi

######################################
# Java
######################################

print_title "Java 环境"
if command -v java >/dev/null 2>&1; then
    java -version 2>&1 | head -n 1
    print_value "JAVA_HOME" "${JAVA_HOME:-[未设置]}"
else
    print_error "未安装 Java"
fi

######################################
# Android SDK
######################################

print_title "Android SDK"
if [ -n "$ANDROID_SDK_ROOT" ]; then
    print_value "ANDROID_SDK_ROOT" "$ANDROID_SDK_ROOT"
    if [ -d "$ANDROID_SDK_ROOT" ]; then
        print_ok "SDK 目录存在"
        if [ -f "$ANDROID_SDK_ROOT/tools/bin/sdkmanager" ]; then
            "$ANDROID_SDK_ROOT/tools/bin/sdkmanager" --version
        elif [ -f "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" ]; then
            "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --version
        else
            print_warn "未找到 sdkmanager"
        fi
    else
        print_error "ANDROID_SDK_ROOT 路径不存在"
    fi
else
    print_warn "未设置 ANDROID_SDK_ROOT 环境变量"
fi

######################################
# 环境变量（格式化）
######################################

print_title "环境变量"

# 格式化 PATH：每行一个目录
echo "${YELLOW}PATH:${RESET}"
IFS=':' read -ra PATH_PARTS <<< "$PATH"
for p in "${PATH_PARTS[@]}"; do
    echo "  $p"
done

echo "${YELLOW}JAVA_HOME:${RESET}"
echo "  ${JAVA_HOME:-[未设置]}"

echo "${YELLOW}ANDROID_SDK_ROOT:${RESET}"
echo "  ${ANDROID_SDK_ROOT:-[未设置]}"

######################################
# 模拟器 & 设备
######################################

print_title "iOS 模拟器设备（Booted）"
xcrun simctl list devices | grep -E "Booted" || print_warn "暂无运行中的 iOS 模拟器"

print_title "Flutter 可用设备"
flutter devices

######################################
# flutter doctor
######################################

print_title "Flutter Doctor 输出"
if command -v fvm >/dev/null 2>&1; then
    fvm flutter doctor -v
    fvm flutter analyze
else
    flutter doctor -v
    flutter analyze
fi

echo ""
print_ok "🧩 环境检测完成"
