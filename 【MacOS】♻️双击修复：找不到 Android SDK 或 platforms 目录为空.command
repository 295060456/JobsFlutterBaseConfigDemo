#!/bin/zsh

set -e

# ✅ 彩色输出
green()  { echo "\033[1;32m$1\033[0m"; }
red()    { echo "\033[1;31m$1\033[0m"; }
yellow() { echo "\033[1;33m$1\033[0m"; }

echo ""
green "🛠️ 开始修复 Android SDK 缺失或 platform 目录为空的问题..."

# ✅ 默认 SDK 安装目录
DEFAULT_SDK="$HOME/Library/Android/sdk"

# ✅ 检查 Android SDK 路径
if [[ -d "$DEFAULT_SDK" ]]; then
  green "✅ Android SDK 路径存在：$DEFAULT_SDK"
else
  yellow "⚠️ 未检测到 Android SDK，正在创建目录：$DEFAULT_SDK"
  mkdir -p "$DEFAULT_SDK"
fi

# ✅ 创建 cmdline-tools 目录结构
CMDLINE_DIR="$DEFAULT_SDK/cmdline-tools/latest"
if [[ ! -d "$CMDLINE_DIR" ]]; then
  green "📦 正在下载 cmdline-tools 最新版..."
  mkdir -p "$DEFAULT_SDK/cmdline-tools"
  cd "$DEFAULT_SDK/cmdline-tools"
  
  curl -LO https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip
  unzip -q commandlinetools-mac-*.zip
  rm commandlinetools-mac-*.zip
  mv cmdline-tools latest
  green "✅ cmdline-tools 安装成功"
else
  green "✅ cmdline-tools 已存在"
fi

# ✅ 设置环境变量临时可用
export ANDROID_SDK_ROOT="$DEFAULT_SDK"
export PATH="$DEFAULT_SDK/cmdline-tools/latest/bin:$DEFAULT_SDK/platform-tools:$PATH"

# ✅ 接受所有许可协议
yes | sdkmanager --licenses > /dev/null

# ✅ 安装基本组件
green "📦 正在安装 platform-tools、platforms;android-34、build-tools..."
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# ✅ 设置 flutter 的 SDK 路径
flutter config --android-sdk "$DEFAULT_SDK"

# ✅ 验证修复结果
echo ""
flutter doctor --android-licenses
flutter doctor

green "✅ Android SDK 修复完成！请重新运行项目或继续开发。"
