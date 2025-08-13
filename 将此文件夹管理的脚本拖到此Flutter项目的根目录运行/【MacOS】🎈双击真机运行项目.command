#!/bin/zsh

# ✅ 日志与输出函数
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

# ✅ 判断函数模块
_is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

_is_dart_entry_file() {
  grep -q "void main(" "$1" 2>/dev/null
}

_abs_path() {
  cd "$1" &>/dev/null && pwd -P
}

# ✅ 获取工作路径 📂
resolve_project_path() {
  SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd -P)"
  SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"

  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径："
    read -r user_input
    user_input="${user_input//\"/}"
    user_input="${user_input%/}"

    if [[ -z "$user_input" ]]; then
      if _is_flutter_project_root "$SCRIPT_DIR"; then
        flutter_root=$(_abs_path "$SCRIPT_DIR")
        entry_file="$flutter_root/lib/main.dart"
        highlight_echo "🎯 检测到脚本所在目录即 Flutter 根目录，自动使用。"
        break
      else
        error_echo "❌ 脚本目录不是 Flutter 项目根目录，请重新输入。"
        continue
      fi
    fi

    if [[ -d "$user_input" && _is_flutter_project_root "$user_input" ]]; then
      flutter_root=$(_abs_path "$user_input")
      entry_file="$flutter_root/lib/main.dart"
      break
    elif [[ -f "$user_input" && _is_dart_entry_file "$user_input" ]]; then
      entry_file=$(_abs_path "$user_input")
      flutter_root="${entry_file:h}"
      break
    fi

    error_echo "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
  done

  cd "$flutter_root" || {
    error_echo "无法进入项目目录：$flutter_root"
    exit 1
  }

  success_echo "✅ 项目路径：$flutter_root"
  success_echo "🎯 入口文件：$entry_file"
}

# ✅ 检测 Flutter 命令 🧩
detect_flutter_command() {
  if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    warn_echo "🧩 检测到 FVM，将使用 fvm flutter"
    flutter_cmd=(fvm flutter)
  else
    info_echo "📦 使用系统 Flutter"
    flutter_cmd=(flutter)
  fi
}

# ✅ 真机运行项目 🚀
run_flutter_on_device() {
  "${flutter_cmd[@]}" run --release
}

# ✅ 主函数入口 🧠
main() {
  resolve_project_path          # ✅ 获取 flutter_root 与 entry_file
  detect_flutter_command        # ✅ 判断是否为 FVM 项目
  run_flutter_on_device         # ✅ 执行真机运行
}

main "$@"
