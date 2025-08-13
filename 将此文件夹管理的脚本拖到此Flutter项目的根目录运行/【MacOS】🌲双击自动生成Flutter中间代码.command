#!/bin/zsh

# ✅ 日志输出配置
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

# ✅ 设置 flutter 命令
detect_flutter_command() {
  flutter_root="$(cd "$(dirname "$0")" && pwd)"
  if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    warn_echo "🧩 检测到 FVM，将使用 fvm flutter。"
    flutter_cmd=(fvm flutter)
  else
    flutter_cmd=(flutter)
  fi
}

# ✅ 自述信息
print_intro() {
  success_echo "📦 Flutter 构建助手"
  echo "===================================================================="
  info_echo "➤ 自动进入 android 目录"
  info_echo "➤ 可选择执行 flutter packages upgrade / clean / pub get"
  info_echo "➤ 自动执行 build_runner build"
  echo "===================================================================="
  echo ""
}

# ✅ 可选执行 upgrade/clean/pub get
maybe_run_upgrade_clean_get() {
  echo ""
  read "?🔁 是否执行 flutter packages upgrade / clean / pub get？（按任意键执行，回车跳过）" user_input
  if [[ -n "$user_input" ]]; then
    "${flutter_cmd[@]}" packages upgrade
    "${flutter_cmd[@]}" clean
    "${flutter_cmd[@]}" pub get --no-example
  else
    warn_echo "⏭️ 跳过 upgrade / clean / pub get"
  fi
}

# ✅ 切换至 android 目录并显示路径
enter_android_directory() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  cd "$script_dir/android" || {
    error_echo "❌ 无法进入 android 目录：$script_dir/android"
    exit 1
  }
  gray_echo "📂 当前路径：$PWD"
}

# ✅ 执行 build_runner build
run_build_runner() {
  info_echo "🚧 执行 build_runner build..."
  "${flutter_cmd[@]}" pub run build_runner build
  success_echo "🎉 build_runner 执行完成"
}

# ✅ 主函数入口
main() {
  print_intro                          # ✅ 自述信息
  detect_flutter_command               # ✅ 自动识别 flutter 命令（是否使用 FVM）
  enter_android_directory              # ✅ 切换到 android 目录并输出路径
  maybe_run_upgrade_clean_get          # ✅ 可选执行依赖相关命令
  run_build_runner                     # ✅ 执行代码生成
}

main "$@"
