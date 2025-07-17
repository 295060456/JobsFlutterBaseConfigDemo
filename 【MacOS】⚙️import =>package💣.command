#!/bin/zsh

# ✅ 始终跳转到脚本所在目录
cd "$(dirname "$0")"

# ✅ 彩色输出函数
_color_echo() {
  local color="$1"
  local text="$2"
  case "$color" in
    red) echo "\033[31m$text\033[0m" ;;
    green) echo "\033[32m$text\033[0m" ;;
    yellow) echo "\033[33m$text\033[0m" ;;
    blue) echo "\033[34m$text\033[0m" ;;
    cyan) echo "\033[36m$text\033[0m" ;;
    *) echo "$text" ;;
  esac
}

# ✅ 自述信息（绿色）
clear
_color_echo green "══════════════════════════════════════════════════════════════════════"
_color_echo green "📦 Flutter 项目 import 修复工具"
_color_echo green "══════════════════════════════════════════════════════════════════════"
_color_echo green "🎯 将所有相对路径 import 替换为 package:xxx/... 的格式"
_color_echo green "   示例："
_color_echo green "     import '../../../../TestBase/JobsMaterialRunner.dart'"
_color_echo green "     👉 import 'package:项目名/TestBase/JobsMaterialRunner.dart';"
_color_echo green "══════════════════════════════════════════════════════════════════════"
echo ""

# ✅ 获取当前目录（脚本执行路径）
default_path="${PWD:A}"

# ✅ 拖入路径并判断
while true; do
  _color_echo yellow "📂 请拖入 Flutter 项目根目录（含 pubspec.yaml 和 lib/），或直接回车使用当前目录："
  read -r user_input

  if [[ -z "$user_input" ]]; then
    raw_path="."  # 回车代表当前目录
  else
    raw_path="${user_input//\"/}"  # 去除双引号
  fi

  abs_path=$(cd "$raw_path" 2>/dev/null && pwd)

  _color_echo blue "🔍 正在检测路径：$abs_path"

  if [[ -f "$abs_path/pubspec.yaml" && -d "$abs_path/lib" ]]; then
    PROJECT_PATH="$abs_path"
    break
  else
    _color_echo red "❌ 无效路径：未找到 pubspec.yaml 或 lib/ 文件夹，请重新拖入"
    echo ""
  fi
done

# ✅ 读取项目名
PACKAGE_NAME=$(grep "^name:" "$PROJECT_PATH/pubspec.yaml" | awk '{print $2}')
if [[ -z "$PACKAGE_NAME" ]]; then
  _color_echo red "❌ 无法从 pubspec.yaml 中获取项目名"
  exit 1
fi

_color_echo green "✅ 项目路径：$PROJECT_PATH"
_color_echo green "✅ 项目包名：$PACKAGE_NAME"
echo ""

_color_echo yellow "🚀 按回车开始将所有相对 import 替换为 package:$PACKAGE_NAME/..."
read

_color_echo blue "🔍 正在查找 Dart 文件并执行替换..."

find "$PROJECT_PATH" -name "*.dart" | while read -r dart_file; do
  sed -i '' -E "s#import\s+['\"](\.\.\/)+lib\/(.*)['\"]#import 'package:$PACKAGE_NAME/\2'#g" "$dart_file"
  sed -i '' -E "s#import\s+['\"](\.\.\/)+([^'\"]*)['\"]#import 'package:$PACKAGE_NAME\/\2'#g" "$dart_file"
done

_color_echo green "🎉 所有 import 路径已成功替换为 package:$PACKAGE_NAME/... 格式"
