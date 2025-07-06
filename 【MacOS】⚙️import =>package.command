#!/bin/zsh

# 设置颜色函数
function echo_red()   { echo "\033[31m$1\033[0m" }
function echo_green() { echo "\033[32m$1\033[0m" }
function echo_yellow(){ echo "\033[33m$1\033[0m" }

clear
echo "📦 本脚本用于自动将 Flutter 项目中所有相对路径 import 改为 package: 形式"
echo "🌟 示例：import '../../../../TestBase/JobsMaterialRunner.dart'"
echo "     👉 import 'package:xxx/TestBase/JobsMaterialRunner.dart';"
echo ""

# 🌀 无限循环，直到找到有效路径
while true; do
  echo_yellow "⏳ 请将 Flutter 项目目录拖入终端后回车："
  read -r PROJECT_PATH

  # 去掉路径中的引号和末尾空格
  PROJECT_PATH="${PROJECT_PATH%\"}"
  PROJECT_PATH="${PROJECT_PATH#\"}"
  PROJECT_PATH="${PROJECT_PATH:A}" # zsh 的绝对路径解析（无需 realpath）

  if [[ -f "$PROJECT_PATH/pubspec.yaml" ]]; then
    break
  else
    echo_red "❌ 错误：路径无效，未找到 pubspec.yaml，请重新拖入 Flutter 项目根目录"
    echo ""
  fi
done

# 自动获取包名
PACKAGE_NAME=$(grep "^name:" "$PROJECT_PATH/pubspec.yaml" | awk '{print $2}')

if [[ -z "$PACKAGE_NAME" ]]; then
  echo_red "❌ 无法从 pubspec.yaml 中提取项目名"
  exit 1
fi

echo_green "✅ 项目路径：$PROJECT_PATH"
echo_green "✅ 项目包名：$PACKAGE_NAME"
echo ""
echo_yellow "🚀 按下回车开始替换所有相对 import 为 package:$PACKAGE_NAME/... 格式"
read

echo "📁 开始处理 Dart 文件..."

# 查找并处理 dart 文件
find "$PROJECT_PATH" -name "*.dart" | while read -r dart_file; do
  sed -i '' -E "s#import\s+['\"](\.\.\/)+lib\/(.*)['\"]#import 'package:$PACKAGE_NAME/\2'#g" "$dart_file"
  sed -i '' -E "s#import\s+['\"](\.\.\/)+([^'\"]*)['\"]#import 'package:$PACKAGE_NAME\/\2'#g" "$dart_file"
done

echo_green "🎉 所有 import 路径已成功替换为 package:$PACKAGE_NAME/..."
