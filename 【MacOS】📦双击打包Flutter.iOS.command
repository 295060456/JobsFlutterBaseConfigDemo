#!/bin/zsh

# ✅ 全局变量
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
flutter_cmd=("flutter")

# ✅ 彩色输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ Flutter 项目识别函数
is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ✅ 判断Flutter文件是否是入口
is_dart_entry_file() {
  [[ "$1" == *.dart && -f "$1" ]]
}

# ✅ 转换路径为绝对路径
abs_path() {
  local p="$1"
  [[ -z "$p" ]] && return 1
  p="${p//\"/}"
  [[ "$p" != "/" ]] && p="${p%/}"
  if [[ -d "$p" ]]; then
    (cd "$p" 2>/dev/null && pwd -P)
  elif [[ -f "$p" ]]; then
    (cd "${p:h}" 2>/dev/null && printf "%s/%s\n" "$(pwd -P)" "${p:t}")
  else
    return 1
  fi
}

# ✅ 自述信息
print_self_intro() {
  bold_echo "🛠️ Flutter iOS 打包脚本"
  note_echo "功能说明："
  gray_echo  "  1️⃣ 检查 Xcode 与 CocoaPods 环境（自动安装缺失组件）"
  gray_echo  "  2️⃣ 调用 Flutter 构建 iOS Release 产物"
  gray_echo  "  3️⃣ 构建完成后自动打开 IPA 输出文件夹"
  gray_echo  "  4️⃣ 记录完整日志到：$LOG_FILE"
  note_echo "注意事项："
  gray_echo  "  ⚠ 请提前在 Xcode 中配置好签名证书和 Provisioning Profile"
  echo ""
}

# ✅ 入口检测（支持传参）
detect_entry() {
  local input_path="$1"

  if [[ -n "$input_path" ]]; then
    input_path="${input_path//\"/}"
    input_path="${input_path%/}"
    if is_flutter_project_root "$input_path"; then
      flutter_root=$(abs_path "$input_path")
      entry_file="$flutter_root/lib/main.dart"
      highlight_echo "🎯 使用传入路径作为 Flutter 根目录：$flutter_root"
    else
      error_echo "❌ 参数路径不是有效 Flutter 项目：$input_path"
      exit 1
    fi
  else
    while true; do
      warn_echo "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径（直接回车 = 使用脚本所在目录）："
      read -r user_input
      user_input="${user_input//\"/}"
      user_input="${user_input%/}"

      if [[ -z "$user_input" ]]; then
        if is_flutter_project_root "$SCRIPT_DIR"; then
          flutter_root=$(abs_path "$SCRIPT_DIR")
          entry_file="$flutter_root/lib/main.dart"
          highlight_echo "🎯 脚本所在目录为 Flutter 项目，自动使用：$flutter_root"
          break
        else
          error_echo "❌ 当前目录不是 Flutter 项目，请重新拖入。"
          continue
        fi
      fi

      if [[ -d "$user_input" ]]; then
        if is_flutter_project_root "$user_input"; then
          flutter_root=$(abs_path "$user_input")
          entry_file="$flutter_root/lib/main.dart"
          break
        fi
      elif [[ -f "$user_input" ]]; then
        if is_dart_entry_file "$user_input"; then
          entry_file=$(abs_path "$user_input")
          flutter_root="${entry_file:h}"
          break
        fi
      fi

      error_echo "❌ 无效路径，请重新拖入 Flutter 项目或 Dart 文件。"
    done
  fi

  IPA_OUTPUT_DIR="$flutter_root/build/ios/ipa"
  cd "$flutter_root" || { error_echo "❌ 无法进入项目目录：$flutter_root"; exit 1; }
  success_echo "✅ 项目路径：$flutter_root"
  success_echo "🎯 入口文件：$entry_file"
}

# ✅ 环境检查
check_env() {
  info_echo "检查环境..."
  if ! command -v xcodebuild &>/dev/null; then
    error_echo "未找到 Xcode，请安装后重试。"
    exit 1
  fi
  if ! command -v pod &>/dev/null; then
    error_echo "未找到 CocoaPods，请安装后重试。"
    exit 1
  fi
  success_echo "环境检查通过 ✅"
}

# ✅ 构建 Flutter iOS
flutter_build_ios() {
  cd "$flutter_root" || {
    error_echo "❌ 无法进入项目目录：$flutter_root"
    exit 1
  }
  info_echo "开始构建 Flutter iOS Release 产物..."
  "${flutter_cmd[@]}" clean
  "${flutter_cmd[@]}" pub get
  "${flutter_cmd[@]}" build ipa --release
  success_echo "✔ Flutter 构建完成"
}

# ✅ 验证输出
verify_ipa_output() {
  if [[ -d "$IPA_OUTPUT_DIR" && -n "$(ls "$IPA_OUTPUT_DIR"/*.ipa 2>/dev/null)" ]]; then
    success_echo "📦 成功生成 IPA 文件："
    ls -lh "$IPA_OUTPUT_DIR"/*.ipa | tee -a "$LOG_FILE"
  else
    error_echo "❌ 未找到 IPA 文件，请检查构建日志"
    exit 1
  fi
}

# ✅ 打开目录
open_output_dir() {
  info_echo "📂 打开 IPA 文件夹..."
  open "$IPA_OUTPUT_DIR"
}

# ✅ 耗时统计
print_duration() {
  END_TIME=$(date +%s)
  DURATION=$((END_TIME - START_TIME))
  success_echo "⏱️ 脚本总耗时：${DURATION}s"
}

# ✅ 等待开始
wait_for_user_to_start() {
  echo ""
  read "?👉 按下回车开始执行，或 Ctrl+C 取消..."
  echo ""
}

# ✅ 主函数
main() {
  print_self_intro               # ✅ 💬自述信息
  wait_for_user_to_start         # ✅ 🚀等待开始
  detect_entry "$1"              # ✅ 🚪入口检测（支持传参）
  START_TIME=$(date +%s)         # ✅ 耗时统计：⌛️计时开始
  check_env                      # ✅ ♻️环境检查
  flutter_build_ios              # ✅ 构建 Flutter iOS
  verify_ipa_output              # ✅ 验证输出
  open_output_dir                # ✅ 📁打开目录
  print_duration                 # ✅ 耗时统计：⌛️计时结束
  success_echo "✅ 全部完成 🎉"
}

main "$@"
