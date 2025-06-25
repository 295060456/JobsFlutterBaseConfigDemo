#!/bin/zsh

# ✅ 打印 Logo
echo ""
echo "||===========================================================||"
echo "||   JJJJJJJ   oooooo   bb     ssssss      DDDD    aaa   rrr ||"
echo "||     JJ     oo    oo  bb    ss    ss    DD  DD  aa aa  rr  ||"
echo "||     JJ     oo    oo  bbbbbb  ssssss    DD  DD aa  aa rrr  ||"
echo "|| JJ  JJ     oo    oo  bb          ss    DD  DD aaaaaa rr   ||"
echo "||  JJJJ       oooooo   bb    ssssss      DDDD   aa  aa rr   ||"
echo "||===========================================================||"
echo ""

# ✅ 功能说明
echo "🛠️ 脚本功能说明："
echo "1️⃣ 拖入你要运行的 Dart 文件（.dart）"
echo "2️⃣ 自动识别 Flutter 项目路径"
echo "3️⃣ 自动启动 iOS 模拟器并检测设备"
echo "4️⃣ 如果有多个模拟器，将使用 fzf 供你选择"
echo "5️⃣ 使用 fvm flutter 在你选择的模拟器上运行该 Dart 程序"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 清屏
clear

echo "📂 请将你要调试的 Dart 文件拖入终端后回车（支持中文路径）："
read -r dart_file

# 去掉拖入路径自带的引号
dart_file=${dart_file//\"/}

# 校验 Dart 文件合法性
if [[ ! -f "$dart_file" || "${dart_file:e}" != "dart" ]]; then
  echo "❌ 错误：请拖入一个有效的 .dart 文件"
  exit 1
fi

echo "📄 目标 Dart 文件: $dart_file"

# 向上查找 pubspec.yaml 所在的项目目录
project_path="$dart_file"
while [[ "$project_path" != "/" && ! -f "$project_path/pubspec.yaml" ]]; do
  project_path=$(dirname "$project_path")
done

if [[ ! -f "$project_path/pubspec.yaml" ]]; then
  echo "❌ 错误：未能找到 Flutter 项目目录（pubspec.yaml）"
  exit 1
fi

if [[ ! -d "$project_path/.fvm" ]]; then
  echo "❌ 错误：该项目未使用 FVM 进行配置（缺少 .fvm 目录）"
  exit 1
fi

echo "📦 Flutter 项目目录: $project_path"

cd "$project_path" || exit 1

# 启动模拟器
echo "📱 正在启动 iOS 模拟器..."
open -a Simulator
sleep 5

# 获取可用的 iOS 模拟器设备列表
echo "🔍 正在获取可用的 iOS 模拟器设备..."
device_list=$(fvm flutter devices | grep -i "simulator")

if [[ -z "$device_list" ]]; then
  echo "❌ 没有找到可用的 iOS 模拟器设备，请检查 Simulator 是否打开"
  exit 1
fi

# 处理设备行，格式化为 "iPhone 14（657212A3-XXXX）" 样式供选择
formatted_devices=()
while IFS= read -r line; do
  name=$(echo "$line" | awk -F '•' '{print $1}' | xargs)
  id=$(echo "$line" | awk -F '•' '{print $2}' | xargs)
  formatted_devices+=("$name（$id）")
done <<< "$device_list"

# 根据数量决定选择方式
if [[ ${#formatted_devices[@]} -eq 1 ]]; then
  selected_entry="${formatted_devices[1]}"
else
  if ! command -v fzf &>/dev/null; then
    echo "⚠️ 当前检测到多个 iOS 模拟器设备："
    printf "   • %s\n" "${formatted_devices[@]}"
    echo ""
    echo "❌ 需要安装 fzf 才能选择模拟器"
    echo "💡 安装命令：brew install fzf"
    exit 1
  fi

  echo "📋 多个模拟器可用，请选择要使用的设备："
  selected_entry=$(printf "%s\n" "${formatted_devices[@]}" | fzf --height=10 --prompt="👉 选择模拟器设备 > ")
  if [[ -z "$selected_entry" ]]; then
    echo "⚠️ 未选择任何设备，已取消操作"
    exit 1
  fi
fi

# 拆解出名称与 ID
selected_name="${selected_entry%%（*}"
selected_id="${selected_entry##*（}"
selected_id="${selected_id%）}"

echo "✅ 选择的设备: $selected_name"
echo "🚀 开始运行 Flutter 程序：$dart_file"

# 执行 flutter run
fvm flutter run -d "$selected_id" -t "$dart_file"
