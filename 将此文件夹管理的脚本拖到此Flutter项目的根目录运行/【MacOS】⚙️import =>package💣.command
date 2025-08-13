#!/bin/zsh

# ✅ 日志与彩色输出
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
print_intro() {
  clear
  success_echo "══════════════════════════════════════════════════════════════════════"
  success_echo "📦 Flutter 项目 import 修复工具"
  success_echo "══════════════════════════════════════════════════════════════════════"
  info_echo "🎯 将所有相对路径 import 替换为 package:xxx/... 的格式"
  info_echo "   示例："
  info_echo "     import '../../../../TestBase/JobsMaterialRunner.dart'"
  info_echo "     👉 import 'package:项目名/TestBase/JobsMaterialRunner.dart';"
  success_echo "══════════════════════════════════════════════════════════════════════"
  echo ""
}

# ✅ 检查 Flutter 项目路径
detect_flutter_project_path() {
  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录（含 pubspec.yaml 和 lib/），或直接回车使用当前目录："
    read -r user_input

    if [[ -z "$user_input" ]]; then
      raw_path="."
    else
      raw_path="${user_input//\"/}"
    fi

    abs_path=$(cd "$raw_path" 2>/dev/null && pwd)
    info_echo "🔍 正在检测路径：$abs_path"

    if [[ -f "$abs_path/pubspec.yaml" && -d "$abs_path/lib" ]]; then
      PROJECT_PATH="$abs_path"
      break
    else
      error_echo "❌ 无效路径：未找到 pubspec.yaml 或 lib/ 文件夹"
      echo ""
    fi
  done
}

# ✅ 获取项目名
get_package_name() {
  PACKAGE_NAME=$(grep "^name:" "$PROJECT_PATH/pubspec.yaml" | awk '{print $2}')
  if [[ -z "$PACKAGE_NAME" ]]; then
    error_echo "❌ 无法从 pubspec.yaml 中获取项目名"
    exit 1
  fi
  success_echo "✅ 项目路径：$PROJECT_PATH"
  success_echo "✅ 项目包名：$PACKAGE_NAME"
}

# ✅ 替换 import 路径
replace_imports() {
  warn_echo "🚀 按回车开始将所有相对 import 替换为 package:$PACKAGE_NAME/..."
  read
  info_echo "🔍 正在查找 Dart 文件并执行替换..."

  find "$PROJECT_PATH" -name "*.dart" | while read -r dart_file; do
    sed -i '' -E "s#import\s+['\"](\.\.\/)+lib\/(.*)['\"]#import 'package:$PACKAGE_NAME/\2'#g" "$dart_file"
    sed -i '' -E "s#import\s+['\"](\.\.\/)+([^'\"]*)['\"]#import 'package:$PACKAGE_NAME\/\2'#g" "$dart_file"
  done

  success_echo "🎉 所有 import 路径已成功替换为 package:$PACKAGE_NAME/... 格式"
}

# ✅ 主函数入口
main() {
  cd "$(dirname "$0")"           # ✅ 始终跳转到脚本所在目录
  print_intro                    # 🖨️ 自述信息
  detect_flutter_project_path    # 📁 判断有效项目目录（含 pubspec.yaml 和 lib/）
  get_package_name               # 📦 读取 package 名称
  replace_imports                # 🛠️ 执行路径替换为 package: 格式
}

main "$@"
