#!/bin/zsh

# 清屏
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

# ✅ 先 cd 进入项目目录，之后所有 fvm flutter 才能识别设备！
cd "$project_path" || exit 1

# 启动 iOS 模拟器
echo "📱 正在启动 iOS 模拟器..."
open -a Simulator
sleep 5

# 重新拉一次设备列表，确保 flutter 能识别
echo "🔍 正在获取可用 iOS 模拟器..."
ios_id=$(fvm flutter devices | grep -i "simulator" | head -n 1 | awk -F '•' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

if [[ -z "$ios_id" ]]; then
  echo "❌ 没有找到 iOS 模拟器设备，请确认 Simulator 已打开"
  exit 1
fi

echo "✅ 使用模拟器设备: $ios_id"

# ✅ 再次确保当前目录在项目中，执行 run
echo "🚀 开始运行 Flutter 程序：$dart_file"
fvm flutter run -d "$ios_id" -t "$dart_file"
