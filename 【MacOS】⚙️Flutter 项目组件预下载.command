#!/bin/zsh

# ✅ 日志与彩色输出
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')     # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                    # 日志输出路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }           # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }         # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }         # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }         # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }           # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }         # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }         # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }           # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }        # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }        # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }           # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }              # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }              # 🔗 下划线

# ✅ 自述信息
print_intro() {
  clear
  success_echo "📦 Flutter 项目组件预下载脚本"
  bold_echo "==================================================================="
  success_echo "该脚本将帮助你一次性或分类预下载 Flutter 的所有支持平台工具"
  success_echo "包括：Android 所有架构、iOS、macOS、Windows、Linux、Web、Dart SDK"
  success_echo "支持离线缓存功能，预备无法联网时直接恢复"
  success_echo "请在 Flutter 项目根目录（含 pubspec.yaml 和 lib/）中运行此脚本"
  bold_echo "==================================================================="
  read "?📎 按回车继续（或 Ctrl+C 退出）："
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

# ✅ 判断芯片架构
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 Homebrew
install_homebrew() {
  local arch="$(get_cpu_arch)"                    # 获取当前架构（arm64 或 x86_64）
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

# ✅ 自检安装 Homebrew.coreutils
install_coreutils() {
  if ! command -v realpath &>/dev/null; then
    info_echo "🔍 安装 coreutils（提供 realpath）"
    brew install coreutils
  else
    info_echo "🔄 coreutils 已安装，正在升级..."
    brew upgrade coreutils || true
    success_echo "✅ coreutils 可用"
  fi
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
}

# ✅ 自检安装 Homebrew.fzf
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    success_echo "📦 未安装 fzf，正在通过 Homebrew 安装..."
    brew install fzf
  else
    info_echo "🔄 fzf 已安装，正在升级..."
    brew upgrade fzf || true
    success_echo "✅ fzf 可用"
  fi
}

# ✅ 验证 Flutter 项目根目录
ensure_flutter_project_root() {
  script_dir="$(cd "$(dirname "${(%):-%x}")" && pwd)"
  cd "$script_dir"
  while [[ ! -f "pubspec.yaml" || ! -d "lib" ]]; do
    error_echo "当前目录不是 Flutter 项目根目录（缺少 pubspec.yaml 或 lib/）"
    info_echo "📁 当前目录为：$(pwd)"
    read "?📂 请拖入项目根目录后回车：" project_path
    project_path="${project_path/#\"/}"; project_path="${project_path/%\"/}"
    [[ -z "$project_path" ]] && continue
    [[ ! -e "$project_path" ]] && error_echo "❌ 路径不存在" && continue
    cd "$(realpath "$project_path")"
  done
}

# ✅ 检测 Flutter 环境变量
detect_flutter_env() {
  if [[ -d ".fvm" ]]; then
    success_echo "✅ 检测到 FVM 管理项目"
    CMD_PREFIX="fvm "
    FLUTTER_BIN="$(realpath .fvm/flutter_sdk/bin/flutter)"
  else
    info_echo "ℹ️ 使用全局 Flutter"
    CMD_PREFIX=""
    FLUTTER_BIN="$(command -v flutter)"
  fi

  FLUTTER_SDK="$(dirname "$(dirname "$FLUTTER_BIN")")"
  CACHE_DIR="$FLUTTER_SDK/bin/cache"
  BACKUP_DIR="$HOME/.flutter_cache_backups/$(basename "$PWD")"
}

# ✅ 离线缓存备份
backup_flutter_cache() {
  mkdir -p "$BACKUP_DIR"
  warn_echo "📁 正在备份缓存至：$BACKUP_DIR"
  rsync -a --delete "$CACHE_DIR/" "$BACKUP_DIR/"
}

# ✅ 执行平台工具下载
run_precache() {
  echo ""
  success_echo "请选择下载方式："
  echo "1. 下载全部平台工具（推荐）"
  echo "2. 分类选择平台（fzf 多选）"
  read "?👉 请输入 1 或 2：" mode

  if [[ "$mode" == "1" ]]; then
    info_echo "🚀 下载全部平台工具..."
    eval "${CMD_PREFIX}flutter precache --universal"
  else
    while true; do
      success_echo "✅ 请选择需要下载的平台（空格多选，回车确认）"
      platforms=$(echo "
--ios
--android-arm-profile
--android-arm-release
--android-arm64-profile
--android-arm64-release
--android-x64-profile
--android-x64-release
--web
--macos
--linux
--windows
--force
" | fzf --multi)

      if [[ -z "$platforms" ]]; then
        warn_echo "⚠️ 未选择平台，请重新选择"
      else
        break
      fi
    done

    info_echo "🚀 下载所选平台工具：$platforms"
    eval "${CMD_PREFIX}flutter precache $platforms"
  fi
}

# ✅ 下载完成提示
show_result() {
  if [[ -d "$CACHE_DIR" ]]; then
    success_echo "✅ 所有下载任务已完成！"
    note_echo "📁 缓存目录如下："
    echo "$CACHE_DIR"
    read "?📎 按回车打开该目录（或 Ctrl+C 退出）：" _
    open "$CACHE_DIR"
  else
    error_echo "❌ 缓存目录不存在：$CACHE_DIR"
    exit 1
  fi
}

# ✅ 主函数入口
main() {
  print_intro                  # 🖨️ 自述信息
  install_homebrew             # 🍺 自检安装 Homebrew
  install_coreutils            # 🔧 自检安装 Homebrew.coreutils（提供 realpath）
  install_fzf                  # 🔍 自检安装 Homebrew.fzf 工具
  ensure_flutter_project_root  # 📁 验证 Flutter 项目根目录
  detect_flutter_env           # 🧭 检测是否为 FVM 管理的 Flutter 项目，并设置缓存路径
  backup_flutter_cache         # 💾 备份现有缓存目录
  run_precache                 # 🚀 下载 Flutter 平台工具（全选或 fzf 多选）
  show_result                  # 📂 展示缓存目录并提示打开
}

main "$@"
