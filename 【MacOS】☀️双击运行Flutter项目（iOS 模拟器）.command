#!/bin/zsh

# ✅ 功能说明
echo "🛠️ 本脚本用于将 Dart 文件运行到 iOS 模拟器"
echo ""
echo "👉 支持拖入 .dart 文件 或 Flutter 项目目录（含 lib/main.dart）"
echo "👉 支持 FVM / 自动识别入口文件 / 启动 iOS 模拟器并运行"
echo ""
echo "📦 以下为可选操作：输入空格 + 回车 执行，直接回车跳过"
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

# ✅ 获取可用模拟器列表（不依赖 Simulator 是否已打开）
echo "🔍 正在获取 iOS 模拟器设备..."
device_list=$($flutter_cmd devices | grep -i "simulator")

if [[ -z "$device_list" ]]; then
  echo "❌ 未找到任何 iOS 模拟器，请确保你已安装模拟器或 Xcode"
  exit 1
fi

# ✅ 提取设备
formatted_devices=()
while IFS= read -r line; do
  name=$(echo "$line" | awk -F '•' '{print $1}' | xargs)
  id=$(echo "$line" | awk -F '•' '{print $2}' | xargs)
  formatted_devices+=("$name（$id）")
done <<< "$device_list"

# ✅ 选择设备
if [[ ${#formatted_devices[@]} -eq 1 ]]; then
  selected_entry="${formatted_devices[1]}"
else
  if ! command -v fzf &>/dev/null; then
    echo "⚠️ 多个模拟器设备："
    printf " • %s\n" "${formatted_devices[@]}"
    echo "❌ 建议安装 fzf 以支持选择：brew install fzf"
    exit 1
  fi
  echo "📋 多个模拟器可用，请选择："
  selected_entry=$(printf "%s\n" "${formatted_devices[@]}" | fzf --height=10 --prompt="👉 选择模拟器 > ")
  [[ -z "$selected_entry" ]] && echo "⚠️ 未选择任何设备，退出" && exit 1
fi

# ✅ 拆分出 ID
selected_name="${selected_entry%%（*}"
selected_id="${selected_entry##*（}"
selected_id="${selected_id%）}"

# ✅ 检查是否已运行模拟器
pgrep -f "Simulator" &>/dev/null
if [[ $? -ne 0 ]]; then
  echo "📱 正在启动 Simulator..."
  open -a Simulator
  sleep 5
else
  echo "✅ Simulator 已在运行"
fi

# ✅ 运行程序
echo ""
echo "🚀 正在运行程序到模拟器：$selected_name ($selected_id)"
echo "📄 执行命令：$flutter_cmd run -d $selected_id -t $dart_entry_file"
$flutter_cmd run -d "$selected_id" -t "$dart_entry_file"
