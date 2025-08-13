#!/bin/zsh

flutter_cmd="flutter"

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

# ✅ 自述
show_script_intro() {
  cat <<'EOF'
====================================================================
 🛠️  Flutter 开发环境一键初始化脚本（支持 FVM / Homebrew / 自动架构识别）
====================================================================
📌 功能概述：
  1️⃣ 自动检测并安装 Homebrew（ARM64 / x86_64 架构适配）
  2️⃣ 自动安装并配置 FVM（Flutter 版本管理器）
  3️⃣ 初始化最新稳定版 Flutter SDK（stable channel）
  4️⃣ 自动执行 flutter doctor / pub get / precache 等初始化命令
  5️⃣ 自动注入必要环境变量到 shell 配置文件

💡 使用提示：
  - 建议首次运行时保持联网
  - 执行过程中会自动修改 shell 配置文件（如 ~/.zprofile 或 ~/.bash_profile）
  - 如需使用其他 Flutter 版本，可后续手动运行：fvm install <version>

====================================================================
 按下回车键开始执行，或 Ctrl+C 退出
====================================================================
EOF

  read -r  # 等待用户按回车继续
}

# ✅ FVM 监测
detect_flutter_cmd() {
  script_path="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  local fvm_config_path="$script_path/.fvm/fvm_config.json"
  if command -v fvm >/dev/null 2>&1 && [[ -f "$fvm_config_path" ]]; then
    flutter_cmd=("fvm" "flutter")
    info_echo "🧩 检测到 FVM 项目，使用命令：fvm flutter"
  else
    flutter_cmd=("flutter")
    info_echo "📦 使用系统 Flutter 命令：flutter"
  fi
}

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

# ✅ 单行写文件（避免重复写入）
inject_shellenv_block() {
    local id="$1"           # 参数1：环境变量块 ID，如 "homebrew_env"
    local shellenv="$2"     # 参数2：实际要写入的 shellenv 内容，如 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    local header="# >>> ${id} 环境变量 >>>"  # 自动生成注释头

    # 参数校验
    if [[ -z "$id" || -z "$shellenv" ]]; then
    error_echo "❌ 缺少参数：inject_shellenv_block <id> <shellenv>"
    return 1
    fi

    # 若用户未选择该 ID，则跳过写入
    if [[ ! " ${selected_envs[*]} " =~ " $id " ]]; then
    warn_echo "⏭️ 用户未选择写入环境：$id，跳过"
    return 0
    fi

    # 避免重复写入
    if grep -Fq "$header" "$PROFILE_FILE"; then
      info_echo "📌 已存在 header：$header"
    elif grep -Fq "$shellenv" "$PROFILE_FILE"; then
      info_echo "📌 已存在 shellenv：$shellenv"
    else
      echo "" >> "$PROFILE_FILE"
      echo "$header" >> "$PROFILE_FILE"
      echo "$shellenv" >> "$PROFILE_FILE"
      success_echo "✅ 已写入：$header"
    fi

    # 当前 shell 生效
    eval "$shellenv"
    success_echo "🟢 shellenv 已在当前终端生效"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 🍺**`Homebrew`** （自动架构判断，包含环境注入）
install_homebrew() {
  local arch="$(get_cpu_arch)"                   # 获取当前架构（arm64 或 x86_64）
  local shell_path="${SHELL##*/}"                # 获取当前 shell 名称（如 zsh、bash）
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    inject_shellenv_block "$profile_file" "$shellenv_cmd"

  else
    info_echo "🔄 Homebrew 已安装，正在更新..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
  fi
}

# ✅ 安装 FVM（前提是要预先安装Dart环境）
install_fvm() {
  if ! command -v fvm &>/dev/null; then
    note_echo "📦 未检测到 fvm，正在通过 dart pub global 安装..."
    dart pub global activate fvm || { error_echo "❌ fvm 安装失败"; exit 1; }
    success_echo "✅ fvm 安装成功"
  else
    info_echo "🔄 fvm 已安装，正在升级..."
    dart pub global activate fvm
    success_echo "✅ fvm 已是最新版"
  fi
    fvm --version | tee -a "$LOG_FILE"
  # ✅ 自动注入 ~/.pub-cache/bin 到 PATH（用统一结构封装）
  inject_shellenv_block "fvm_env" 'export PATH="$HOME/.pub-cache/bin:$PATH"'
}

# ✅ 初始化 Flutter 版本
init_flutter_sdk() {
  cd "$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  success_echo "🚀 正在使用最新稳定版 Flutter..."
  fvm install stable
  fvm use stable
}

# ✅ 运行 Flutter 初始化命令
run_flutter_commands() {
  "${flutter_cmd[@]}" doctor -v
  "${flutter_cmd[@]}" --version
  "${flutter_cmd[@]}" pub get
  "${flutter_cmd[@]}" precache
}

# ✅ 主函数入口
main() {
  clear
  show_script_intro             # 💬 自述
  install_homebrew              # ✅自检安装 🍺Homebrew（自动架构判断，包含环境注入）
  install_fvm                   # ⚙️ 安装并配置 FVM（如未安装）
  init_flutter_sdk              # 🛠️ 初始化项目使用的 Flutter 版本（stable）
  run_flutter_commands          # ✅ 执行 doctor / pub get / precache 等初始化命令
}

main "$@"
