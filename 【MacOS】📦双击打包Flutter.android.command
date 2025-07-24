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
  [[ -f "$abs/pubspec.yaml" && -d "$abs/lib" ]]
}

# ------------------------ FVM / brew / fzf 检查 ------------------------
_check_homebrew_and_fzf() {
  if ! command -v brew >/dev/null 2>&1; then
    _color_echo red "❌ 未安装 Homebrew，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
  fi
  if ! command -v fzf >/dev/null 2>&1; then
    brew install fzf
  else
    brew upgrade fzf || true
  fi
}

# ------------------------ Flutter 项目路径识别 ------------------------
_resolve_flutter_project_path() {
  local script_path=$(_abs_path "$0")
  local script_dir="${script_path:h}"
  local current_pwd="$(pwd -P)"
  if _is_flutter_project_root "$script_dir"; then
    cd "$script_dir"
    flutter_root="$script_dir"
    return
  fi
  if _is_flutter_project_root "$current_pwd"; then
    cd "$current_pwd"
    flutter_root="$current_pwd"
    return
  fi
  while true; do
    _color_echo yellow "📂 请拖入 Flutter 项目根目录（包含 pubspec.yaml + lib/）："
    read -r input_path
    input_path="${input_path//\"/}"
    abs=$(_abs_path "$input_path") || { _color_echo red "❌ 无效路径"; continue }
    if _is_flutter_project_root "$abs"; then
      cd "$abs" || exit 1
      flutter_root="$abs"
      break
    else
      _color_echo red "❌ 不是合法 Flutter 项目"
    fi
  done
}

# ------------------------ 打包参数选择 ------------------------
_select_build_target() {
  local choice=$(echo -e "📦 只打 AAB\n📦 只打 APK\n📦 同时打 APK + AAB（默认）" \
    | fzf --prompt="📦 请选择打包方式：" --height=40% --border)
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

_prompt_flavor_and_mode() {
  _color_echo blue "🌶️ 请输入 flavor 名称（可空）:"
  read -r flavor
  if [[ -n "$flavor" ]]; then
    flavor_args=(--flavor "$flavor")
  else
    flavor_args=()
  fi
  build_mode=$(printf "release\ndebug\nprofile" | fzf --prompt="👉 选择构建模式 > " --height=40%)
  build_mode="${build_mode:-release}"
}

_detect_flutter_cmd() {
  if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    flutter_cmd=(fvm flutter)
  else
    flutter_cmd=(flutter)
  fi
}

# ------------------------ AGP 版本输出 ------------------------
_print_agp_version() {
  local build_file="./android/build.gradle"
  if [[ -f "$build_file" ]]; then
    local agp_version=$(grep -oE "com.android.tools.build:gradle:[0-9.]+" "$build_file" | head -n1 | cut -d: -f3)
    if [[ -n "$agp_version" ]]; then
      echo "$agp_version"
    else
      echo "未检测到 AGP 版本"
    fi
  else
    echo "未找到 build.gradle 文件"
  fi
}

# ------------------------ Java 环境配置 ------------------------
_configure_java_env() {
  cd "$flutter_root" || exit 1
  local record_file="$flutter_root/.java-version"
  local last_used=""
  [[ -f "$record_file" ]] && last_used=$(cat "$record_file")
  local available_versions=$(brew search openjdk@ | grep -E '^openjdk@\d+$' | sort -Vr)
  if [[ -z "$available_versions" ]]; then
    _color_echo red "❌ 未找到任何 openjdk 版本"
    exit 1
  fi
  if [[ -n "$last_used" && "$available_versions" == *"$last_used"* ]]; then
    _color_echo green "📦 上次使用的 JDK：$last_used"
    _color_echo blue "👉 是否继续使用？回车 = 是 / 任意键 + 回车 = 重新选择"
    read -r confirm
    [[ -z "$confirm" ]] && selected="$last_used"
  fi
  if [[ -z "$selected" ]]; then
    selected=$(echo "$available_versions" | fzf --prompt="☑️ 选择 openjdk 版本：" --height=40%)
    [[ -z "$selected" ]] && _color_echo red "❌ 未选择 JDK" && exit 1
  fi
  local version_number="${selected#*@}"
  brew list --formula | grep -q "^$selected$" || brew install "$selected"
  sudo ln -sfn "/opt/homebrew/opt/$selected/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/${selected}.jdk" 2>/dev/null
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version_number")
  export PATH="$JAVA_HOME/bin:$PATH"
  echo "$selected" > "$record_file"
}

# ------------------------ flutter build 执行 ------------------------
_run_flutter_build() {
  local log_file="/tmp/flutter_build_log.txt"
  rm -f "$log_file"
  local java_env_cmd=(env JAVA_HOME="$JAVA_HOME" PATH="$JAVA_HOME/bin:$PATH")

  _color_echo blue "📦 当前使用 JDK 版本："
  "${java_env_cmd[@]}" java -version
  _color_echo blue "📦 当前使用 Gradle 版本："
  "${java_env_cmd[@]}" ./android/gradlew -v
  _color_echo blue "📦 当前使用 AGP（Android Gradle Plugin）版本："
  _print_agp_version

  if [[ $BUILD_APK == true ]]; then
    _color_echo cyan "🚀 flutter build apk --$build_mode"
    "${java_env_cmd[@]}" "${flutter_cmd[@]}" build apk --$build_mode "${flavor_args[@]}" | tee -a "$log_file"
  fi
  if [[ $BUILD_AAB == true ]]; then
    _color_echo cyan "🚀 flutter build appbundle --$build_mode"
    "${java_env_cmd[@]}" "${flutter_cmd[@]}" build appbundle --$build_mode "${flavor_args[@]}" | tee -a "$log_file"
  fi
}

_confirm_step() {
  local label="$1"
  _color_echo blue "👉 是否执行 $label？回车 = 执行 / 任意键 + 回车 = 跳过"
  read -r choice
  [[ -z "$choice" ]] && return 0 || return 1
}

_open_output_folder() {
  local base="build/app/outputs"
  if [[ $BUILD_AAB == true ]]; then
    open "$base/bundle/$build_mode" 2>/dev/null
  elif [[ $BUILD_APK == true ]]; then
    open "$base/flutter-apk" 2>/dev/null
  fi
}

# ------------------------ 自述区块 ------------------------
clear
_color_echo cyan  "🛠️ Flutter Android 打包脚本（支持 FVM / fzf / flavor / JDK 选择）"
echo ""
_color_echo green "📌 功能说明："
_color_echo green "1️⃣ 自动识别当前 Flutter 项目路径（或拖入路径）"
_color_echo green "2️⃣ 自动检测是否使用 FVM，并用 fvm flutter 构建"
_color_echo green "3️⃣ 支持选择构建类型（仅 APK、仅 AAB、同时构建）"
_color_echo green "4️⃣ 支持 flavor 参数和构建模式（release/debug/profile）"
_color_echo green "5️⃣ 自动检测并配置 Java（openjdk），可选择版本"
_color_echo green "6️⃣ 自动记忆上次使用的 JDK（保存在 .java-version）"
_color_echo green "7️⃣ 构建前输出 📦 JDK / 📦 Gradle / 📦 AGP 三个版本信息"
_color_echo green "8️⃣ 构建后自动打开输出产物目录"
_color_echo green "9️⃣ 所有命令均统一交互：回车 = 执行，任意键 + 回车 = 跳过"
_color_echo green "🔟 构建日志自动保存到 /tmp/flutter_build_log.txt"
echo ""
_color_echo yellow "👉 回车 = 执行默认 / 任意键 + 回车 = 跳过（统一交互）"
echo ""
read "?📎 按回车开始："

# ------------------------ 主流程 ------------------------
cd "$(cd "$(dirname "$0")" && pwd -P)"
_check_homebrew_and_fzf
_resolve_flutter_project_path
_select_build_target
_prompt_flavor_and_mode
_detect_flutter_cmd
_configure_java_env

if _confirm_step "flutter clean"; then
  "${flutter_cmd[@]}" clean
fi

if _confirm_step "flutter pub get"; then
  "${flutter_cmd[@]}" pub get
fi

_run_flutter_build
_open_output_folder
