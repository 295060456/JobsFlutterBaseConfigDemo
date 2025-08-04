#!/bin/zsh

# ✅ 配置参数
DEFAULT_SDK="$HOME/Library/Android/sdk"
CMDLINE_DIR="$DEFAULT_SDK/cmdline-tools/latest"
flutter_root=$(pwd)
flutter_cmd=(flutter)  # 默认使用 flutter 命令

# ✅ 彩色输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }        # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }      # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }      # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }      # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }        # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }      # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }      # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }        # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }     # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }     # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }        # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }           # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }           # 🔗 下划线

# ✅ 初始化 flutter 命令
init_flutter_command() {
  if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    warn_echo "🧩 检测到 FVM，将使用 fvm flutter。"
    flutter_cmd=(fvm flutter)
  fi
}

# ✅ 检查 Android SDK 路径
prepare_android_sdk() {
  info_echo "🛠️ 开始修复 Android SDK 缺失或 platform 目录为空的问题..."

  if [[ -d "$DEFAULT_SDK" ]]; then
    success_echo "✔ Android SDK 路径存在：$DEFAULT_SDK"
  else
    warn_echo "⚠️ 未检测到 Android SDK，正在创建目录：$DEFAULT_SDK"
    mkdir -p "$DEFAULT_SDK"
  fi
}

# ✅ 安装 cmdline-tools
install_cmdline_tools() {
  if [[ ! -d "$CMDLINE_DIR" ]]; then
    info_echo "📦 正在下载 cmdline-tools 最新版..."
    mkdir -p "$DEFAULT_SDK/cmdline-tools"
    cd "$DEFAULT_SDK/cmdline-tools"

    curl -LO https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip
    unzip -q commandlinetools-mac-*.zip
    rm commandlinetools-mac-*.zip
    mv cmdline-tools latest

    success_echo "✔ cmdline-tools 安装成功"
  else
    success_echo "✔ cmdline-tools 已存在"
  fi
}

# ✅ 安装 SDK 组件
install_sdk_components() {
  export ANDROID_SDK_ROOT="$DEFAULT_SDK"
  export PATH="$DEFAULT_SDK/cmdline-tools/latest/bin:$DEFAULT_SDK/platform-tools:$PATH"

  yes | sdkmanager --licenses > /dev/null

  info_echo "📦 安装 platform-tools、platforms;android-34、build-tools..."
  sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"
}

# ✅ 配置 Flutter 使用 SDK 路径
configure_flutter_sdk() {
  "${flutter_cmd[@]}" config --android-sdk "$DEFAULT_SDK"
}

# ✅ 检查 Flutter 环境状态
run_flutter_doctor() {
  echo ""
  "${flutter_cmd[@]}" doctor --android-licenses
  "${flutter_cmd[@]}" doctor
}

# ✅ 询问是否执行 pub get
maybe_run_pub_get() {
  echo ""
  read '?📦 执行 flutter pub get？(回车=执行 / 任意键=跳过) ' run_get
  if [[ -z "$run_get" ]]; then
    "${flutter_cmd[@]}" pub get
  else
    warn_echo "⏭️ 跳过 pub get。"
  fi
}

# ✅ 主执行函数
main() {
  clear
  init_flutter_command                                         # 检查是否使用 fvm，并设置 flutter 命令
  prepare_android_sdk                                          # 确保 Android SDK 路径存在
  install_cmdline_tools                                        # 安装 Android 命令行工具（cmdline-tools）
  install_sdk_components                                       # 安装 platform-tools 和构建工具等组件
  configure_flutter_sdk                                        # 配置 flutter 的 android-sdk 路径
  run_flutter_doctor                                           # 执行 flutter doctor 检查环境
  maybe_run_pub_get                                            # 可选执行 flutter pub get
  success_echo "✅ Android SDK 修复完成！请重新运行项目或继续开发。"  # 结束提示
}

main "$@"                                                      # 🔥 启动脚本入口，传入所有参数
