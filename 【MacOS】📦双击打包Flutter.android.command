#!/bin/zsh

# ------------------------ 彩色输出工具函数 ------------------------
_color_echo() {
  local color="$1"; shift
  local text="$*"
  case "$color" in
    green)  printf "\033[32m%s\033[0m\n" "$text" ;;
    red)    printf "\033[31m%s\033[0m\n" "$text" ;;
    yellow) printf "\033[33m%s\033[0m\n" "$text" ;;
    blue)   printf "\033[34m%s\033[0m\n" "$text" ;;
    cyan)   printf "\033[36m%s\033[0m\n" "$text" ;;
    *)      printf "%s\n" "$text" ;;
  esac
}

# ------------------------ 路径判断函数 ------------------------
_abs_path() {
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

_is_flutter_project_root() {
  local p="$1"
  local abs=$(_abs_path "$p") || return 1

  echo "🔍 检查路径：$abs"
  echo "📎 检查 pubspec.yaml 是否存在: $abs/pubspec.yaml"
  echo "📎 检查 lib/ 目录是否存在:     $abs/lib"

  [[ -f "$abs/pubspec.yaml" && -d "$abs/lib" ]]
}

# ------------------------ Homebrew / fzf 检查 ------------------------
_check_homebrew_and_fzf() {
  if ! command -v brew >/dev/null 2>&1; then
    _color_echo red "❌ 未安装 Homebrew，将尝试自动安装..."
    _color_echo yellow "🌀 正在下载 Homebrew 安装脚本，请稍候..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
  fi

  if ! command -v brew >/dev/null 2>&1; then
    _color_echo red "❌ Homebrew 安装失败，请手动安装：https://brew.sh/"
    exit 1
  else
    _color_echo green "✅ Homebrew 已可用"
  fi

  if ! command -v fzf >/dev/null 2>&1; then
    _color_echo yellow "📦 未安装 fzf，正在通过 brew 安装..."
    brew install fzf
    _color_echo green "✅ fzf 安装完成"
  else
    _color_echo cyan "🔄 尝试升级 fzf ..."
    brew upgrade fzf || true
    _color_echo green "✅ fzf 准备就绪"
  fi
}

# ------------------------ Flutter 项目路径识别 ------------------------
_resolve_flutter_project_path() {
  local script_path=$(_abs_path "$0")
  local script_dir="${script_path:h}"
  local current_pwd="$(pwd -P)"

  # 1. 脚本所在目录判断
  if _is_flutter_project_root "$script_dir"; then
    cd "$script_dir"
    flutter_root="$script_dir"
    _color_echo cyan "📌 当前使用脚本所在目录作为项目根目录：$flutter_root"
    return
  fi

  # 2. 当前目录判断
  if _is_flutter_project_root "$current_pwd"; then
    cd "$current_pwd"
    flutter_root="$current_pwd"
    _color_echo cyan "📌 当前工作目录作为项目根目录：$flutter_root"
    return
  fi

  # 3. 用户交互：拖入路径
  while true; do
    _color_echo yellow "📂 请拖入 Flutter 项目根目录（包含 pubspec.yaml + lib/）："
    read -r input_path
    input_path="${input_path//\"/}"
    abs=$(_abs_path "$input_path") || { _color_echo red "❌ 无效路径"; continue }

    if _is_flutter_project_root "$abs"; then
      cd "$abs" || exit 1
      flutter_root="$abs"
      _color_echo green "✅ 已定位 Flutter 项目：$flutter_root"
      break
    else
      _color_echo red "❌ 无效 Flutter 项目，请重新拖入"
    fi
  done
}


# ------------------------ 选择打包类型 ------------------------
_select_build_target() {
  local choice=$(echo -e "🧃 同时打 APK + AAB（默认）\n📦 只打 APK（flutter build apk）\n📦 只打 AAB（flutter build appbundle）" \
    | fzf --prompt="📦 请选择打包方式（回车默认全部）: " --height=40% --border)

  if [[ -z "$choice" || "$choice" == *"同时"* ]]; then
    BUILD_APK=true
    BUILD_AAB=true
  elif [[ "$choice" == *"APK"* ]]; then
    BUILD_APK=true
    BUILD_AAB=false
  else
    BUILD_APK=false
    BUILD_AAB=true
  fi
}

# ------------------------ 构建参数收集 ------------------------
_prompt_flavor_and_mode() {
  _color_echo blue "🌶️ 请输入 flavor 名称（可空）:"
  read -r flavor
  if [[ -n "$flavor" ]]; then
    flavor_args=(--flavor "$flavor")
  else
    flavor_args=()
  fi

  _color_echo blue "🚧 请选择构建模式："
  build_mode=$(printf "release\ndebug\nprofile" | fzf --prompt="👉 选择模式 > " --height=40%)
  build_mode="${build_mode:-release}"
  _color_echo green "✅ 构建模式：$build_mode"
}

# ------------------------ FVM 检测 ------------------------
_detect_flutter_cmd() {
  if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    _color_echo yellow "🧩 检测到 FVM，使用 fvm flutter"
    flutter_cmd=(fvm flutter)
  else
    flutter_cmd=(flutter)
  fi
}

# ------------------------ 打包执行 ------------------------
_run_flutter_build() {
  log_file="/tmp/flutter_build_log.txt"
  rm -f "$log_file"

  if [[ $BUILD_APK == true ]]; then
    _color_echo cyan "🚀 执行 flutter build apk --$build_mode ..."
    "${flutter_cmd[@]}" build apk --$build_mode "${flavor_args[@]}" | tee -a "$log_file"
  fi

  if [[ $BUILD_AAB == true ]]; then
    _color_echo cyan "🚀 执行 flutter build appbundle --$build_mode ..."
    "${flutter_cmd[@]}" build appbundle --$build_mode "${flavor_args[@]}" | tee -a "$log_file"
  fi
}

# ------------------------ 交互确认函数 ------------------------
_confirm_step() {
  local label="$1"
  _color_echo blue "👉 是否执行 $label？回车 = 执行 / 任意键 + 回车 = 跳过"
  read -r choice
  [[ -z "$choice" ]] && return 0 || return 1
}

# ------------------------ 打开输出目录 ------------------------
_open_output_folder() {
  local base="build/app/outputs"
  if [[ $BUILD_AAB == true ]]; then
    open "$base/bundle/$build_mode" 2>/dev/null
  elif [[ $BUILD_APK == true ]]; then
    open "$base/flutter-apk" 2>/dev/null
  fi
}

# ------------------------ 自述 & 主流程入口 ------------------------
clear
_color_echo cyan  "███████╗██╗     ██╗   ██╗████████╗████████╗███████╗██████╗"
_color_echo cyan  "██╔════╝██║     ██║   ██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗"
_color_echo cyan  "█████╗  ██║     ██║   ██║   ██║      ██║   █████╗  ██████╔╝"
_color_echo cyan  "██╔══╝  ██║     ██║   ██║   ██║      ██║   ██╔══╝  ██╔══██╗"
_color_echo cyan  "███████╗███████╗╚██████╔╝   ██║      ██║   ███████╗██║  ██║"
_color_echo cyan  "╚══════╝╚══════╝ ╚═════╝    ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝"
echo ""
_color_echo green "🛠️ Flutter Android 打包脚本（支持 FVM / flavor / fzf）"
_color_echo yellow "📦 回车 = 执行默认，任意键 + 回车 = 跳过（统一交互）"
_color_echo blue   "----------------------------------------------------------"
_color_echo blue   "🧩 自动检测 flutter/fvm"
_color_echo blue   "📂 自动识别项目路径（支持拖入）"
_color_echo blue   "📦 fzf 选择打包方式（apk / aab）"
_color_echo blue   "🛠️ 支持 flavor 和 build mode 参数"
_color_echo blue   "📄 构建日志保存至 /tmp/flutter_build_log.txt"
_color_echo blue   "📂 打开打包产物目录"
echo ""
_color_echo cyan "📎 按回车开始执行..."
read

# 强制切换到脚本所在目录（解决双击默认目录是桌面的问题）
cd "$(cd "$(dirname "$0")" && pwd -P)"
_check_homebrew_and_fzf
_resolve_flutter_project_path
_select_build_target
_prompt_flavor_and_mode
_detect_flutter_cmd

if _confirm_step "flutter clean"; then
  "${flutter_cmd[@]}" clean
fi

if _confirm_step "flutter pub get"; then
  "${flutter_cmd[@]}" pub get
fi

_run_flutter_build
_open_output_folder
