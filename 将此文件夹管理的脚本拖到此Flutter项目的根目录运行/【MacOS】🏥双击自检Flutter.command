#!/bin/zsh

# ✅ 日志与输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
show_intro() {
  bold_echo ""
  highlight_echo "🧾 本脚本用于一键检测 Flutter 开发环境"

  note_echo "
✔ 检查内容包括：
  • 系统版本 / 用户信息
  • Flutter / FVM / Dart / Java / Xcode / Android SDK
  • 环境变量（PATH、JAVA_HOME、ANDROID_SDK_ROOT）
  • 当前 iOS 模拟器与可用设备
  • flutter doctor -v 和 flutter analyze 输出
  "

  read "?👉 按回车开始执行环境检测，或输入任意字符退出： " go
  if [[ -n "$go" ]]; then
    error_echo "✖ 用户取消执行，已退出。"
    exit 0
  fi
}

# ✅ 工作目录初始化 📂
init_directory() {
  WORK_DIR=$(cd "$(dirname "$0")" && pwd)
  gray_echo "📂 当前脚本路径：$WORK_DIR"
  cd "$WORK_DIR" || exit 1
}

# ✅ 检测 Flutter 命令 🧩
detect_flutter_command() {
  flutter_root="$PWD"
  if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    warn_echo "🧩 检测到 FVM，将使用 fvm flutter"
    flutter_cmd=(fvm flutter)
  else
    info_echo "📦 使用系统 Flutter"
    flutter_cmd=(flutter)
  fi
}

# ✅ 系统基本信息 🧠
print_system_info() {
  highlight_echo "🧠 系统基本信息"
  info_echo "系统版本：$(sw_vers | grep ProductVersion | awk '{print $2}')"
  info_echo "Shell：$SHELL"
  info_echo "当前用户：$USER"
}

# ✅ Flutter & FVM 🐦
print_flutter_info() {
  highlight_echo "📦 Flutter / FVM 信息"
  if [[ "${flutter_cmd[*]}" == "fvm flutter" ]]; then
    success_echo "检测到 FVM：使用 fvm flutter"
    info_echo "fvm 路径：$(command -v fvm)"
  else
    info_echo "使用系统 Flutter"
  fi
  "${flutter_cmd[@]}" --version
}

# ✅ Dart 信息 🎯
print_dart_info() {
  highlight_echo "🎯 Dart 信息"
  if command -v dart >/dev/null 2>&1; then
    dart --version
  else
    warn_echo "未检测到 dart 命令"
  fi
}

# ✅ Xcode 信息 🍏
print_xcode_info() {
  highlight_echo "🍏 Xcode 信息"
  if command -v xcodebuild >/dev/null 2>&1; then
    info_echo "Xcode 版本：$(xcodebuild -version | head -n 1)"
    info_echo "Xcode 路径：$(xcode-select -p)"
  else
    error_echo "未检测到 xcodebuild"
  fi
}

# ✅ Java 信息 ☕
print_java_info() {
  highlight_echo "☕ Java 环境"
  if command -v java >/dev/null 2>&1; then
    java -version 2>&1 | head -n 1
    info_echo "JAVA_HOME：${JAVA_HOME:-[未设置]}"
  else
    error_echo "未安装 Java"
  fi
}

# ✅ Android SDK 🤖
print_android_sdk_info() {
  highlight_echo "🤖 Android SDK"
  if [[ -n "$ANDROID_SDK_ROOT" ]]; then
    info_echo "ANDROID_SDK_ROOT：$ANDROID_SDK_ROOT"
    if [[ -d "$ANDROID_SDK_ROOT" ]]; then
      success_echo "SDK 目录存在"
      if [[ -f "$ANDROID_SDK_ROOT/tools/bin/sdkmanager" ]]; then
        "$ANDROID_SDK_ROOT/tools/bin/sdkmanager" --version
      elif [[ -f "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" ]]; then
        "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --version
      else
        warn_echo "未找到 sdkmanager"
      fi
    else
      error_echo "ANDROID_SDK_ROOT 路径不存在"
    fi
  else
    warn_echo "未设置 ANDROID_SDK_ROOT 环境变量"
  fi
}

# ✅ 环境变量格式化 🌐
print_env_variables() {
  highlight_echo "🌐 环境变量"
  echo -e "\033[1;33mPATH:\033[0m"
  IFS=':' read -rA paths <<< "$PATH"
  for p in "${paths[@]}"; do echo "  $p"; done
  echo -e "\033[1;33mJAVA_HOME:\033[0m\n  ${JAVA_HOME:-[未设置]}"
  echo -e "\033[1;33mANDROID_SDK_ROOT:\033[0m\n  ${ANDROID_SDK_ROOT:-[未设置]}"
}

# ✅ 模拟器与设备 📱
print_devices() {
  highlight_echo "📱 iOS 模拟器设备（Booted）"
  xcrun simctl list devices | grep -E "Booted" || warn_echo "暂无运行中的 iOS 模拟器"

  highlight_echo "🧩 Flutter 可用设备"
  "${flutter_cmd[@]}" devices
}

# ✅ flutter doctor 🩺
run_flutter_doctor() {
  highlight_echo "🩺 flutter doctor"
  "${flutter_cmd[@]}" doctor -v
  "${flutter_cmd[@]}" analyze
}

# ✅ 主函数入口 🚀
main() {
    show_intro                        # 🖨️ 自述信息
    init_directory                    # ✅ 切换到当前脚本所在目录
    detect_flutter_command            # ✅ 判断是否为 FVM 项目并设置 flutter_cmd

    print_system_info                 # 🧠 显示 macOS 系统基本信息（版本、shell、用户）
    print_flutter_info                # 📦 显示 Flutter 与 FVM 安装状态及版本
    print_dart_info                   # 🎯 显示 Dart SDK 安装状态及版本
    print_xcode_info                  # 🍏 显示 Xcode 版本与路径
    print_java_info                   # ☕ 显示 Java 环境与 JAVA_HOME 设置
    print_android_sdk_info            # 🤖 显示 Android SDK 状态、版本与 sdkmanager 检测
    print_env_variables               # 🌐 格式化输出 PATH、JAVA_HOME、ANDROID_SDK_ROOT 等环境变量

    print_devices                     # 📱 列出运行中的 iOS 模拟器与 Flutter 可用设备
    run_flutter_doctor                # 🩺 执行 flutter doctor -v 以及 flutter analyze 分析项目环境

    echo ""
    success_echo "🧩 环境检测完成"      # ✅ 输出最终成功提示
}

main "$@"
