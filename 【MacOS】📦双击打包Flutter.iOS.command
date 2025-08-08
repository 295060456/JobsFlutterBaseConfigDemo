#!/bin/zsh

# ================================== 全局变量 ==================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
flutter_cmd=("flutter")
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

# ================================== 彩色输出函数 ==================================
log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
warm_echo()      { log "\033[1;33m$1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
err_echo()       { log "\033[1;31m$1\033[0m"; }
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }
underline_echo() { log "\033[4m$1\033[0m"; }

# ================================== 项目信息输出 ==================================
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

# ================================== Flutter 项目路径判断 ==================================
is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

is_dart_entry_file() {
  [[ "$1" == *.dart && -f "$1" ]]
}

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

# ================================== 入口检测（更新 flutter_root） ==================================
detect_entry() {
  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径（直接回车 = 使用脚本所在目录）："
    read -r user_input
    user_input="${user_input//\"/}"
    user_input="${user_input%/}"

    if [[ -z "$user_input" ]]; then
      if is_flutter_project_root "$SCRIPT_DIR"; then
        flutter_root=$(abs_path "$SCRIPT_DIR")
        entry_file="$flutter_root/lib/main.dart"
        highlight_echo "🎯 检测到脚本目录为 Flutter 根目录，自动使用。"
        break
      else
        error_echo "❌ 脚本所在目录不是 Flutter 项目根目录，请拖入有效路径。"
        continue
      fi
    fi

    if [[ -d "$user_input" ]]; then
      if is_flutter_project_root "$user_input"; then
        flutter_root=$(abs_path "$user_input")
        entry_file="$flutter_root/lib/main.dart"
        highlight_echo "📂 已识别 Flutter 项目路径：$flutter_root"
        break
      else
        error_echo "❌ 该目录不是 Flutter 项目根目录，请重新拖入。"
        continue
      fi
    elif [[ -f "$user_input" ]]; then
      if is_dart_entry_file "$user_input"; then
        entry_file=$(abs_path "$user_input")
        flutter_root="${entry_file:h}"
        highlight_echo "📄 已识别 Dart 文件：$entry_file"
        break
      else
        error_echo "❌ 非 Dart 入口文件，请重新拖入。"
        continue
      fi
    fi

    error_echo "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
  done

  IPA_OUTPUT_DIR="$flutter_root/build/ios/ipa"
  cd "$flutter_root" || { error_echo "❌ 无法进入项目目录：$flutter_root"; exit 1; }
  success_echo "✅ 项目路径：$flutter_root"
  success_echo "🎯 入口文件：$entry_file"
}

# ================================== 环境检查 ==================================
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

# ================================== 执行 Flutter 构建 ==================================
flutter_build_ios() {
  cd "$flutter_root" || {
    error_echo "❌ 无法进入项目目录：$flutter_root"
    exit 1
  }

  info_echo "开始构建 Flutter iOS Release 产物..."
  "${flutter_cmd[@]}" clean
  "${flutter_cmd[@]}" pub get
  "${flutter_cmd[@]}" build ipa --release
  success_echo "Flutter 构建完成 ✅"
}

# ================================== 验证构建输出 ==================================
verify_ipa_output() {
  if [[ -d "$IPA_OUTPUT_DIR" && -n "$(ls "$IPA_OUTPUT_DIR"/*.ipa 2>/dev/null)" ]]; then
    success_echo "📦 成功生成 IPA 文件："
    ls -lh "$IPA_OUTPUT_DIR"/*.ipa | tee -a "$LOG_FILE"
  else
    error_echo "❌ 未找到 IPA 文件，请检查构建日志"
    exit 1
  fi
}

# ================================== 打开输出目录 ==================================
open_output_dir() {
  info_echo "打开 IPA 文件夹..."
  open "$IPA_OUTPUT_DIR"
}

# ================================== 耗时统计 ==================================
print_duration() {
  END_TIME=$(date +%s)
  DURATION=$((END_TIME - START_TIME))
  success_echo "⚙️ 脚本总耗时：${DURATION}s"
}

# ================================== 主流程 ==================================
main() {
  print_self_intro
  wait_for_user_to_start
  detect_entry
  START_TIME=$(date +%s)
  check_env
  flutter_build_ios
  verify_ipa_output
  open_output_dir
  print_duration
  success_echo "全部完成 🎉"
}

wait_for_user_to_start() {
  echo ""
  read "?👉 按下回车开始执行，或 Ctrl+C 取消..."
  echo ""
}

main "$@"
