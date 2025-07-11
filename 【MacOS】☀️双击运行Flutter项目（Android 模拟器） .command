#!/bin/zsh

# ✅ 主功能说明
echo "🛠️ 本脚本用于将 Dart 文件运行到 Android 模拟器"
echo ""
echo "👉 支持拖入 .dart 文件 或 Flutter 项目目录（含 lib/main.dart）"
echo "👉 支持 FVM / 自动识别入口文件 / 启动 Android 模拟器并运行"
echo ""
echo "📦 下面是可选的辅助步骤：输入空格 + 回车 执行，直接回车跳过"
echo ""

# ✅ 可选：安装 brew + fzf
read "?🍺 是否检查并安装 Homebrew 与 fzf？[空格+回车=执行, 回车=跳过] " install_tools
if [[ "$install_tools" =~ " " ]]; then
  if ! command -v brew &>/dev/null; then
    echo "🔧 安装 Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    [[ "$(uname -m)" == "arm64" ]] && echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile && eval "$(/opt/homebrew/bin/brew shellenv)"
    [[ "$(uname -m)" != "arm64" ]] && echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.bash_profile && eval "$(/usr/local/bin/brew shellenv)"
  fi
  echo "✅ Homebrew 就绪，更新中..."
  brew update && brew upgrade

  if ! command -v fzf &>/dev/null; then
    echo "🔧 安装 fzf..."
    brew install fzf || exit 1
  else
    brew upgrade fzf || echo "⚠️ fzf 升级失败，跳过"
  fi
fi

# ✅ 设置 ANDROID_HOME
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# ✅ 可选：检查 Android SDK 工具完整性
read "?🧰 是否检查 emulator/sdkmanager 工具完整性？[空格+回车=执行, 回车=跳过] " check_sdk
if [[ "$check_sdk" =~ " " ]]; then
  if [[ ! -x "$ANDROID_HOME/emulator/emulator" || ! -x "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" ]]; then
    echo "❌ 缺少 emulator 或 sdkmanager"
    echo "👉 请参考官方文档：https://developer.android.com/studio#cmdline"
    exit 1
  fi
  echo "✅ Android SDK 工具完整"
fi

# ✅ 拖入文件或目录
while true; do
  echo "📂 请拖入 Dart 文件或 Flutter 项目目录（lib/main.dart）"
  read -r user_input
  user_input=${user_input//\"/}
  user_input=${user_input%/}

  if [[ -f "$user_input" && "${user_input:e}" == "dart" ]]; then
    dart_entry_file="$user_input"
    flutter_project_dir=$(dirname "$dart_entry_file")
    break
  elif [[ -d "$user_input" && -f "$user_input/lib/main.dart" ]]; then
    dart_entry_file="$user_input/lib/main.dart"
    flutter_project_dir="$user_input"
    break
  else
    echo "❌ 输入无效，请重新拖入"
  fi
done

# ✅ 查找 pubspec.yaml 向上查找
find_flutter_project() {
  local path="$1"
  while [[ "$path" != "/" && ! -f "$path/pubspec.yaml" ]]; do
    path=$(dirname "$path")
  done
  [[ -f "$path/pubspec.yaml" ]] && echo "$path" || echo ""
}

flutter_project_root=$(find_flutter_project "$flutter_project_dir")
[[ -z "$flutter_project_root" ]] && echo "❌ 未找到 pubspec.yaml，非 Flutter 项目" && exit 1

cd "$flutter_project_root" || exit 1
echo "✅ 项目目录：$flutter_project_root"
echo "✅ 入口文件：$dart_entry_file"

# ✅ 可选：flutter pub get
read "?📦 是否执行 flutter pub get？[空格+回车=执行, 回车=跳过] " pubget
flutter_cmd="flutter"
[[ -f "$flutter_project_root/.fvm/fvm_config.json" ]] && flutter_cmd="fvm flutter" && echo "🧩 使用 FVM"

if [[ "$pubget" =~ " " ]]; then
  echo "📦 正在执行依赖获取..."
  $flutter_cmd pub get
fi

# ✅ 检查是否已有模拟器在运行
pgrep -f "emulator" | grep -q "qemu-system"
if [[ $? -eq 0 ]]; then
  echo "✅ 检测到已有 Android 模拟器运行，跳过启动"
else
  # 列出可用模拟器
  avds=($(emulator -list-avds))
  if [[ ${#avds[@]} -eq 0 ]]; then
    echo "❌ 未找到模拟器，请先创建 AVD"
    exit 1
  fi

  echo "📱 可用模拟器如下，请选择："
  selected=$(printf "%s\n" "${avds[@]}" | fzf --prompt="👉 选择模拟器 > ")
  [[ -z "$selected" ]] && echo "❌ 未选择模拟器，退出" && exit 1

  echo "🚀 启动模拟器：$selected"
  emulator -avd "$selected" & disown
  sleep 5
fi

# ✅ 获取模拟器设备 ID
device_id=$($flutter_cmd devices | grep -i "android" | awk -F '•' '{print $2}' | head -n1 | xargs)
[[ -z "$device_id" ]] && echo "❌ 未找到 Android 模拟器设备" && exit 1

# ✅ 最终执行 flutter run
echo ""
echo "🚀 正在运行程序到模拟器：$device_id"
echo "📄 执行命令：$flutter_cmd run -d $device_id -t $dart_entry_file"
$flutter_cmd run -d "$device_id" -t "$dart_entry_file"
