#!/bin/zsh

# ✅ 全局变量配置
SDK_DIR="$HOME/Library/Android/sdk"
CMDLINE_TOOLS_DIR="$SDK_DIR/cmdline-tools/latest"
AVD_NAME="Pixel_5_API_34"
CMDLINE_ZIP_URL="https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip"

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

# ✅ 自述信息
print_banner() {
  clear
  echo ""
  highlight_echo "📦 准备开始自动化安装 Android SDK + 模拟器，请保持网络通畅..."
  echo ""
}

# ✅ 下载并安装 Command-line Tools
install_cmdline_tools() {
  mkdir -p "$CMDLINE_TOOLS_DIR"
  if [[ ! -f "$CMDLINE_TOOLS_DIR/bin/sdkmanager" ]]; then
    info_echo "📥 正在下载 Android Command-line Tools..."
    curl -Lo commandlinetools.zip "$CMDLINE_ZIP_URL"
    unzip -q commandlinetools.zip -d "$CMDLINE_TOOLS_DIR"
    rm commandlinetools.zip
    success_echo "✔ 解压完成：cmdline-tools 已就绪"
  else
    note_echo "➤ 已存在 cmdline-tools，跳过下载"
  fi
}

# ✅ 配置当前环境变量
setup_env() {
  export ANDROID_HOME="$SDK_DIR"
  export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$CMDLINE_TOOLS_DIR/bin:$PATH"
  success_echo "✔ 环境变量已就绪（当前会话）"
}

# ✅ 安装 SDK 必备组件
install_sdk_components() {
  info_echo "🔧 安装 platform-tools、emulator、系统镜像等组件..."
  yes | sdkmanager --sdk_root="$SDK_DIR" \
    "platform-tools" \
    "emulator" \
    "platforms;android-34" \
    "system-images;android-34;google_apis;x86_64" \
    "cmdline-tools;latest"
}

# ✅ 创建 Android 模拟器
create_avd() {
  echo ""
  if ! avdmanager list avd | grep -q "$AVD_NAME"; then
    info_echo "🛠️ 创建模拟器 $AVD_NAME..."
    echo "no" | avdmanager create avd -n "$AVD_NAME" -k "system-images;android-34;google_apis;x86_64" --device "pixel_5"
    success_echo "✔ 模拟器已创建：$AVD_NAME"
  else
    note_echo "➤ 已存在模拟器：$AVD_NAME"
  fi
}

# ✅ 启动模拟器
start_emulator() {
  echo ""
  info_echo "🚀 启动模拟器 $AVD_NAME..."
  nohup emulator -avd "$AVD_NAME" > /dev/null 2>&1 &

  sleep 5
  if pgrep -f "emulator.*$AVD_NAME" > /dev/null; then
    success_echo "🎉 模拟器已启动成功！名称：$AVD_NAME"
  else
    error_echo "❌ 模拟器启动失败，请手动运行：emulator -avd $AVD_NAME"
  fi
}

# ✅ 输出添加环境变量提示
print_env_instructions() {
  echo ""
  note_echo "📌 若要永久使用 emulator 命令，请将以下内容添加到 ~/.zshrc 或 ~/.bash_profile："
  echo "export ANDROID_HOME=\"$SDK_DIR\""
  echo "export PATH=\"\$ANDROID_HOME/emulator:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/cmdline-tools/latest/bin:\$PATH\""
}

# ✅ 主流程入口函数
main() {
  print_banner              # 🎯 自述信息
  install_cmdline_tools     # 📦 下载并解压 cmdline-tools
  setup_env                 # 🧭 设置临时环境变量
  install_sdk_components    # 🔧 安装 SDK 核心组件
  create_avd                # 🛠️ 创建 AVD 模拟器
  start_emulator            # 🚀 启动模拟器并检查状态
  print_env_instructions    # 📎 输出持久化配置路径
}

main "$@"
