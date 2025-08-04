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

# ✅ 添加环境变量路径
add_line_if_not_exists() {
  local file=$1
  local line=$2
  [[ -f "$file" ]] || touch "$file"
  if ! grep -qF "$line" "$file"; then
    echo "" >> "$file"
    echo "$line" >> "$file"
    success_echo "已添加到 ${file##*/}：$line"
  else
    warn_echo "${file##*/} 中已存在该配置：$line"
  fi
}

# ✅ 安装 FVM（前提是要预先安装Dart环境）
install_fvm() {
  if ! command -v fvm &>/dev/null; then
    echo ""
    success_echo "📦 未检测到 FVM，开始安装..."
    dart pub global activate fvm

    # 添加到各终端 profile
    local export_line='export PATH="$PATH:$HOME/.pub-cache/bin"'
    add_line_if_not_exists ~/.bash_profile "$export_line"
    add_line_if_not_exists ~/.bashrc "$export_line"
    add_line_if_not_exists ~/.zshrc "$export_line"

    # 立即生效
    [[ -f ~/.bash_profile ]] && source ~/.bash_profile
    [[ -f ~/.bashrc ]] && source ~/.bashrc
    [[ -f ~/.zshrc ]] && source ~/.zshrc

    success_echo "✅ FVM 安装完成并已配置环境变量"
  else
    success_echo "✅ FVM 已安装"
  fi
}

# ✅ 初始化 Flutter 版本
init_flutter_sdk() {
  cd "$(cd "$(dirname "$0")" && pwd)"
  success_echo "🚀 正在使用最新稳定版 Flutter..."
  fvm install stable
  fvm use stable
}

# ✅ 运行 Flutter 初始化命令
run_flutter_commands() {
  fvm flutter doctor -v
  fvm flutter --version
  fvm flutter pub get
  fvm flutter precache
}

# ✅ 主函数入口
main() {
  install_fvm                   # ⚙️ 安装并配置 FVM（如未安装）
  init_flutter_sdk              # 🛠️ 初始化项目使用的 Flutter 版本（stable）
  run_flutter_commands          # ✅ 执行 doctor / pub get / precache 等初始化命令
}

main "$@"
