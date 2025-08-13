#!/bin/zsh

export PATH="$HOME/.pub-cache/bin:$PATH"

# ✅ 全局变量定义
typeset -g SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"  # 当前脚本路径
typeset -g CURRENT_VERSION=""       # 当前 .fvmrc 配置版本
typeset -g VERSIONS=""              # Flutter 可用稳定版本列表
typeset -g SELECTED_VERSION=""      # 用户选择的 Flutter 版本

# ✅ 彩色输出函数封装
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

# ✅ 单行 shellenv 写入函数
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

# ✅ 自述信息
print_description() {
  echo ""
  bold_echo "🛠 Flutter SDK 安装助手（支持官方 / brew / fvm）"
  gray_echo "------------------------------------------------------"
  note_echo "1️⃣ 安装或升级 Homebrew / fzf"
  note_echo "2️⃣ 提供三种 Flutter 安装方式（fzf选择）"
  note_echo "3️⃣ 自动写入环境变量到 ~/.bash_profile"
  gray_echo "------------------------------------------------------"
}

# ✅ 项目路径检测
check_flutter_project_path() {
  cd "$SCRIPT_DIR"
  if [[ ! -f "pubspec.yaml" || ! -d "lib" ]]; then
    error_echo "❌ 当前路径不是 Flutter 项目（缺 pubspec.yaml 或 lib/）"
    exit 1
  fi
  success_echo "📂 当前目录符合 Flutter 项目规范"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 Homebrew（芯片架构兼容、含环境注入）
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

# ✅  自检安装 Homebrew.jq
install_jq() {
  if ! command -v jq &>/dev/null; then
    note_echo "📦 未检测到 jq，正在通过 Homebrew 安装..."
    brew install jq || { error_echo "❌ jq 安装失败"; exit 1; }
    success_echo "✅ jq 安装成功"
  else
    info_echo "🔄 jq 已安装，升级中..."
    brew upgrade jq
    success_echo "✅ jq 已是最新版"
  fi
}

# ✅ 自检安装 Homebrew.dart
install_dart() {
  if ! command -v dart &>/dev/null; then
    note_echo "📦 未检测到 dart，正在通过 Homebrew 安装..."
    brew tap dart-lang/dart || warn_echo "⚠️ tap dart-lang/dart 失败（已存在或网络异常）"
    brew install dart || { error_echo "❌ dart 安装失败"; exit 1; }
    success_echo "✅ dart 安装成功"
  else
    info_echo "🔄 dart 已安装，路径为：$(which dart)"
    brew tap dart-lang/dart || warn_echo "⚠️ tap dart-lang/dart 失败（可能已存在）"

    if brew outdated | grep -q "^dart\$"; then
      highlight_echo "⬆️ 检测到 dart 有更新，正在升级..."
      if brew upgrade dart; then
        success_echo "✅ dart 升级成功"
      else
        error_echo "❌ dart 升级失败"
      fi
    else
      success_echo "✅ dart 已是最新版（无需升级）"
    fi
  fi
}

# ✅ 自检安装 Homebrew.fvm（虽然安装fvm的大前提是预先安装dart环境，但是通过Homebrew安装fvm会帮你安装dart环境：来自 dart-lang/dart tap）
install_fvm() {
  if ! command -v fvm &>/dev/null; then
    note_echo "📦 未检测到 fvm，正在通过 dart pub global 安装..."
    dart pub global deactivate fvm                                             # 卸载 fvm
    dart pub global activate fvm || { error_echo "❌ fvm 安装失败"; exit 1; }   # 安装或更新 fvm
    success_echo "✅ fvm 安装成功"
  else
    info_echo "🔄 fvm 已安装，正在升级..."
    dart pub global activate fvm                                               # 安装或更新 fvm
    success_echo "✅ fvm 已是最新版"
  fi

  # ✅ 自动注入 ~/.pub-cache/bin 到 PATH（用统一结构封装）
  inject_shellenv_block "fvm_env" 'export PATH="$HOME/.pub-cache/bin:$PATH"'
}

# ✅ 获取当前版本配置
get_current_configured_version() {
  if [[ -f .fvmrc ]]; then
    jq -r '.flutterSdkVersion // empty' .fvmrc 2>/dev/null
  elif [[ -f .fvm/fvm_config.json ]]; then
    jq -r '.flutterSdkVersion // empty' .fvm/fvm_config.json 2>/dev/null
  fi
}

# ✅ 获取 Flutter 稳定版本列表
fetch_stable_versions() {
  curl -s https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json |
    jq -r '.releases[] | select(.channel=="stable") | .version' |
    sort -V | uniq | tac
}

# ✅ 选择 Flutter 版本（fzf）
select_flutter_version() {
  local current="$1"
  local versions="$2"

  local choices=""
  if [[ -n "$current" ]]; then
    choices=$(echo "$versions" | awk -v current="$current" '{ if ($0 == current) print "✅ " $0; else print $0 }')
  else
    choices="$versions"
  fi

  local raw=$(echo "$choices" | fzf --prompt="🎯 选择 Flutter 版本：" --height=50% --border --ansi)
  echo "$raw" | sed 's/^✅ //' | grep -Eo '^[0-9]+\.[0-9]+\.[0-9]+$'
}

# ✅ 准备版本信息（设置全局变量）
prepare_flutter_versions() {
  CURRENT_VERSION=$(get_current_configured_version)
  VERSIONS=$(fetch_stable_versions)
  [[ -z "$VERSIONS" ]] && error_echo "❌ 无法获取 Flutter 版本列表" && exit 1
  SELECTED_VERSION=$(select_flutter_version "$CURRENT_VERSION" "$VERSIONS")
  [[ -z "$SELECTED_VERSION" ]] && SELECTED_VERSION=$(echo "$VERSIONS" | head -n1)
}

# ✅ 写入 FVM 配置文件
write_fvm_config() {
  local version="$1"
  echo "{\"flutterSdkVersion\": \"$version\"}" > .fvmrc
  success_echo "✔ 写入 .fvmrc：$version"

  mkdir -p .fvm
  echo "{\"flutterSdkVersion\": \"$version\"}" > .fvm/fvm_config.json
  note_echo "➤ 写入 .fvm/fvm_config.json"
}

# ✅ 安装并切换 Flutter 版本
install_flutter_version() {
  local version="$1"
  fvm install "$version"
  fvm use "$version"
}

# ✅ 写 flutter 别名函数
write_flutter_alias() {
  if ! grep -q 'flutter()' ~/.zshrc; then
    echo '' >> ~/.zshrc
    echo 'flutter() { fvm flutter "$@"; }' >> ~/.zshrc
    success_echo "✔ 写入 flutter 函数别名 ~/.zshrc"
  fi
}

# ✅ 检查项目状态文件
check_flutter_state_files() {
  [[ -f .packages ]] && note_echo "📦 检测到 .packages" || warn_echo "⚠️ 缺 .packages"
  [[ -f .flutter-plugins ]] && note_echo "📦 检测到 .flutter-plugins" || warn_echo "⚠️ 缺 .flutter-plugins"
  [[ -f .metadata ]] && note_echo "📦 检测到 .metadata" || warn_echo "⚠️ 缺 .metadata"
  [[ -d .dart_tool ]] && note_echo "📁 检测到 .dart_tool" || warn_echo "⚠️ 缺 .dart_tool"
}

# ✅ 检查重复依赖
check_duplicate_dependencies() {
  local list=$(awk '
    $1=="dependencies:" {mode="dep"; next}
    $1=="dev_dependencies:" {mode="dev"; next}
    /^[a-zA-Z0-9_]+:/ {
      pkg=$1; sub(":", "", pkg)
      if (mode == "dep") dep[pkg]++
      if (mode == "dev") dev[pkg]++
    }
    END {
      for (pkg in dep)
        if (dev[pkg]) print pkg
    }
  ' pubspec.yaml)

  if [[ -n "$list" ]]; then
    error_echo "⚠️ 同时出现在 dependencies 与 dev_dependencies："
    for pkg in $list; do
      err_echo "  - $pkg"
    done
  fi
}

# ✅ 可选命令交互执行
ask_feature_toggle() {
  echo ""
  note_echo "👉 $1"
  gray_echo "【回车跳过，y 回车启用】"
  read "input?➤ "
  [[ "$input" == "y" || "$input" == "Y" ]]
}

run_optional_commands() {
  ask_feature_toggle "是否执行 flutter clean？" && fvm flutter clean
  ask_feature_toggle "是否执行 flutter pub get？" && fvm flutter pub get
  ask_feature_toggle "是否执行 flutter doctor？" && fvm flutter doctor
  ask_feature_toggle "是否执行 flutter analyze？" && fvm flutter analyze
}

# ✅ 最终信息展示
show_final_summary() {
  local version="$1"
  local sdk_path="$HOME/.fvm/versions/$version"

  echo ""
  highlight_echo "🎉 Flutter 环境配置完成"
  gray_echo "------------------------------------------"
  info_echo "Flutter 版本：$version"
  info_echo "FVM 路径：$(which fvm)"
  info_echo "项目路径：$SCRIPT_DIR"
  info_echo "SDK 路径：$sdk_path"
  gray_echo "------------------------------------------"
}

# ✅ 主执行入口
main() {
    clear
    print_description                           # 🖨 自述信息
    check_flutter_project_path "$SCRIPT_DIR"    # 📁 检查项目路径
    install_homebrew                            # 🔧 安装必要工具 Homebrew
    install_jq                                  # 🔧 安装必要工具 Homebrew.jq
    install_dart                                # 🔧 安装必要工具 Homebrew.dart
    install_fvm                                 # 🔧 安装必要工具 Homebrew.fvm
    prepare_flutter_versions                    # 🎯 获取和选择 Flutter 版本
    write_fvm_config "$SELECTED_VERSION"        # 📝 写入版本配置
    install_flutter_version "$SELECTED_VERSION" # ⬇️ 安装并切换版本
    write_flutter_alias                         # 🔁 写 flutter 别名
    check_flutter_state_files                   # 📄 检查状态文件
    check_duplicate_dependencies                # 🔍 检查重复依赖
    run_optional_commands                       # 🔘 执行额外命令
    show_final_summary "$SELECTED_VERSION"      # ✅ 展示总结信息
}

main "$@"
