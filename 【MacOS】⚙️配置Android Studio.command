#!/bin/zsh

clear
echo ""
echo "📦 准备开始自动化安装 Android SDK + 模拟器，请保持网络通畅..."
echo ""

# ✅ 设置 SDK 安装路径
SDK_DIR="$HOME/Library/Android/sdk"
CMDLINE_TOOLS_DIR="$SDK_DIR/cmdline-tools/latest"
mkdir -p "$CMDLINE_TOOLS_DIR"

# ✅ 下载并安装 Command-line Tools
if [[ ! -f "$CMDLINE_TOOLS_DIR/bin/sdkmanager" ]]; then
  echo "📥 正在下载 Android Command-line Tools..."
  curl -Lo commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip
  unzip -q commandlinetools.zip -d "$CMDLINE_TOOLS_DIR"
  rm commandlinetools.zip
fi

# ✅ 设置环境变量（当前会话）
export ANDROID_HOME="$SDK_DIR"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$CMDLINE_TOOLS_DIR/bin:$PATH"

# ✅ 安装必要组件
echo "🔧 安装 platform-tools、emulator、系统镜像等组件..."
yes | sdkmanager --sdk_root="$SDK_DIR" \
  "platform-tools" \
  "emulator" \
  "platforms;android-34" \
  "system-images;android-34;google_apis;x86_64" \
  "cmdline-tools;latest"

# ✅ 创建 AVD
AVD_NAME="Pixel_5_API_34"
echo ""
if ! avdmanager list avd | grep -q "$AVD_NAME"; then
  echo "🛠️ 创建模拟器 $AVD_NAME..."
  echo "no" | avdmanager create avd -n "$AVD_NAME" -k "system-images;android-34;google_apis;x86_64" --device "pixel_5"
else
  echo "✅ 已存在模拟器 $AVD_NAME"
fi

# ✅ 启动模拟器
echo ""
echo "🚀 启动模拟器 $AVD_NAME..."
nohup emulator -avd "$AVD_NAME" > /dev/null 2>&1 &

sleep 5
if pgrep -f "emulator.*$AVD_NAME" > /dev/null; then
  echo "🎉 模拟器已启动成功！名称：$AVD_NAME"
else
  echo "❌ 模拟器启动失败，请手动运行：emulator -avd $AVD_NAME"
fi

# ✅ 提示添加环境变量
echo ""
echo "📌 若要永久使用 emulator 命令，请将以下内容添加到 ~/.zshrc 或 ~/.bash_profile："
echo "export ANDROID_HOME=\"$SDK_DIR\""
echo "export PATH=\"\$ANDROID_HOME/emulator:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/cmdline-tools/latest/bin:\$PATH\""
