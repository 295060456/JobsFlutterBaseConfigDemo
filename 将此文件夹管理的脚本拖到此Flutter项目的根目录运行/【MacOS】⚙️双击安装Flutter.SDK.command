#!/bin/zsh

# ✅ 彩色输出函数
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

# ✅ CPU 架构检测（arm64 or x86）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
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

# ✅ 安装 Homebrew（芯片架构兼容、含环境注入）
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

# ✅ 安装 fzf（fzf-select）
fzf_select() {
  printf "%s\n" "$@" | fzf --prompt="👉 请选择：" --height=15 --reverse
}

install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf ;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
        ;;
      *) error_echo "❌ 取消安装 fzf";;
    esac
  else
    info_echo "🔄 fzf 已安装，升级中..."
    brew upgrade fzf
    success_echo "✅ fzf 已是最新版"
  fi
}

# ✅ 选择安装方式
select_flutter_install_method() {
  echo ""
  info_echo "📦 请选择安装 Flutter SDK 的方式（↑↓选择，回车确认）："
  sleep 0.3
  local options=(
    "1️⃣ 官方解压安装"
    "2️⃣ Homebrew 安装/升级"
    "3️⃣ FVM 安装（推荐）"
  )
  printf "%s\n" "${options[@]}" | fzf --prompt="👉 安装方式：" --height=15 --reverse
}

# ✅ 官方解压安装
install_official() {
  echo ""
  note_echo "📂 请拖入你希望安装 Flutter 的目标文件夹（如 ~/development）："
  read -r target_dir
  target_dir="${target_dir/#\~/$HOME}"
  mkdir -p "$target_dir"
  cd "$target_dir"

  info_echo "🌐 下载 Flutter SDK 中..."
  curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_latest-stable.zip

  info_echo "📦 解压..."
  unzip -q flutter_macos_latest-stable.zip
  rm flutter_macos_latest-stable.zip

  success_echo "✅ Flutter SDK 解压完成"
  open "$target_dir/flutter"
}

# ✅ Brew 安装 Flutter
install_brew() {
  if command -v flutter >/dev/null 2>&1; then
    info_echo "🔄 已检测到 Flutter，尝试升级..."
    brew upgrade flutter || true
  else
    info_echo "📦 开始安装 Flutter..."
    brew install flutter
  fi
  success_echo "✅ 安装完成，执行 flutter doctor 检查配置"
  flutter doctor
}

# ✅ FVM 安装 Flutter（项目根目录）
install_fvm() {
  function is_flutter_project() {
    [[ -f "pubspec.yaml" && -d "lib" ]]
  }

  until is_flutter_project; do
    echo ""
    warn_echo "❌ 当前目录 $(pwd) 不是有效的 Flutter 项目"
    echo "👉 请拖入 Flutter 项目根目录（包含 pubspec.yaml 和 lib/）"
    read -r flutter_project_dir
    flutter_project_dir="${flutter_project_dir/#\~/$HOME}"
    cd "$flutter_project_dir"
  done

  success_echo "✅ 已确认是 Flutter 项目：$(pwd)"
  info_echo "📦 开始安装 fvm..."
  brew install fvm

  info_echo "🔍 可用 Flutter 版本（↑↓选择，回车确认，默认 stable）..."
  version=$(fvm releases | awk '/^stable|beta|dev|master/ {print $1}' | fzf --prompt="选择 Flutter 版本：" || echo "stable")

  highlight_echo "⬇️ 安装 Flutter $version ..."
  fvm install "$version"
  fvm use "$version"

  success_echo "✅ 安装完成，执行 flutter doctor 检查配置"
  fvm flutter doctor
}

# ✅ 写入环境变量到 .bash_profile
write_env_to_profile() {
  local target_file="$HOME/.bash_profile"
  [[ -f "$target_file" ]] || touch "$target_file"

  echo ""
  info_echo "📄 即将写入环境变量配置到：$target_file"
  echo ""
  warn_echo "以下内容将在确认后追加写入（若未存在）："
  echo "------------------------------------------------------"
  cat <<'EOF' | tee /dev/stderr
# 配置 Flutter 环境变量
if ! command -v fvm &>/dev/null; then
  if [[ -d "/opt/homebrew/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/opt/homebrew/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "/usr/local/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/usr/local/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "$HOME/flutter/bin" ]]; then
    export PATH="$HOME/flutter/bin:$PATH"
  fi
fi
export PUB_HOSTED_URL=https://pub.dartlang.org
export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com

# 配置 FVM
export PATH="$HOME/.pub-cache/bin:$PATH"
if command -v fvm &>/dev/null; then
  flutter() { fvm flutter "$@"; }
fi
EOF
  echo "------------------------------------------------------"
  echo ""

  read "?🎯 按回车键写入以上内容，或输入任意内容 + 回车跳过： " confirm
  if [[ -z "$confirm" ]]; then
    if ! grep -q "# 配置 Flutter 环境变量" "$target_file"; then
      cat <<'EOL' >> "$target_file"

# 配置 Flutter 环境变量
if ! command -v fvm &>/dev/null; then
  if [[ -d "/opt/homebrew/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/opt/homebrew/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "/usr/local/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/usr/local/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "$HOME/flutter/bin" ]]; then
    export PATH="$HOME/flutter/bin:$PATH"
  fi
fi
export PUB_HOSTED_URL=https://pub.dartlang.org
export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com

# 配置 FVM
export PATH="$HOME/.pub-cache/bin:$PATH"
if command -v fvm &>/dev/null; then
  flutter() { fvm flutter "$@"; }
fi
EOL
      success_echo "✅ 写入完成，请执行：source $target_file"
    else
      info_echo "✅ 检测到配置已存在，未重复写入"
    fi
  else
    warn_echo "⛔️ 已取消写入 .bash_profile"
  fi
}

# ✅ 根据选择执行安装方式
handle_flutter_install_selection() {
  local method
  method=$(select_flutter_install_method)

    case "$method" in
      *"官方解压安装"*)       install_official ;;
      *"Homebrew 安装"*)     install_brew ;;
      *"FVM 安装"*)           install_fvm ;;
      *) error_echo "❌ 未知选择：$method，脚本中止"; exit 1 ;;
    esac
}

# ✅ 自述信息
print_intro() {
  clear
  echo ""
  bold_echo "🛠 Flutter SDK 安装助手（支持官方 / brew / fvm）"
  gray_echo "------------------------------------------------------"
  note_echo "1️⃣ 安装或升级 Homebrew / fzf"
  note_echo "2️⃣ 提供三种 Flutter 安装方式（fzf选择）"
  note_echo "3️⃣ 自动写入环境变量到 ~/.bash_profile"
  gray_echo "------------------------------------------------------"
}

# ✅ 主函数入口
main() {
  print_intro                         # ✅ 自述信息
  install_homebrew                    # ✅ 检查并安装 Homebrew（自动识别架构）
  install_fzf                         # ✅ 安装或升级 fzf，用于交互选择安装方式
  handle_flutter_install_selection    # ✅ fzf 选择安装方式并执行对应逻辑
  write_env_to_profile                # ✅ 检查并追加环境变量配置（避免重复）

  success_echo "🎉 Flutter 安装流程已完成！"
}

main "$@"
