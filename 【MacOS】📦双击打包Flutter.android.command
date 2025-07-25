#!/bin/zsh

# ✅ 临时添加 Android command line tools 到 PATH（仅当前脚本会话）
export PATH="/opt/homebrew/share/android-commandlinetools/cmdline-tools/latest/bin:$PATH"

# ✅ 手动初始化 jenv，保证脚本中也能用
if [[ -d "$HOME/.jenv" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

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

# ------------------------ 修复 jenv 未注册的 JDK ------------------------
_fix_jenv_java_version() {
  local jdk_path="/opt/homebrew/opt/openjdk@17"
  if command -v jenv >/dev/null 2>&1 && [[ -d "$jdk_path" ]]; then
    jenv_versions=$(jenv versions --bare | grep "^17")
    if [[ -z "$jenv_versions" ]]; then
      _color_echo yellow "📦 openjdk@17 未注册到 jenv，尝试添加..."
      jenv add "$jdk_path"
    fi
  fi
}

# ------------------------ 检查 Homebrew 和 fzf ------------------------
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

# ------------------------ 获取绝对路径 ------------------------
_abs_path() {
  local input="$1"
  [[ -z "$input" ]] && return
  if [[ -d "$input" ]]; then
    cd "$input" && pwd -P
  else
    cd "$(dirname "$input")" && echo "$(pwd -P)/$(basename "$input")"
  fi
}

# ------------------------ 判断是否为 Flutter 项目根目录 ------------------------
_is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ------------------------ 查找 Flutter 项目根路径 ------------------------
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
    abs=$(_abs_path "$input_path")
    if _is_flutter_project_root "$abs"; then
      cd "$abs"
      flutter_root="$abs"
      _color_echo cyan "📌 成功识别 Flutter 项目路径：$flutter_root"
      return
    fi
    _color_echo red "❌ 无效路径，请重试"
  done
}

# ------------------------ fvm 检测 ------------------------
_detect_flutter_cmd() {
  if command -v fvm >/dev/null && [[ -f ".fvm/fvm_config.json" ]]; then
    flutter_cmd=("fvm" "flutter")
    _color_echo cyan "✅ 检测到使用 FVM：fvm flutter"
  else
    flutter_cmd=("flutter")
    _color_echo cyan "✅ 使用系统 flutter：flutter"
  fi
}

# ------------------------ 选择构建目标 ------------------------
_select_build_target() {
  _color_echo yellow "📦 请选择构建类型："
  local options=("只构建 APK" "只构建 AAB" "同时构建 APK 和 AAB")
  local selected=$(printf '%s\n' "${options[@]}" | fzf)
  case "$selected" in
    "只构建 APK") build_target="apk" ;;
    "只构建 AAB") build_target="appbundle" ;;  # 改为 Flutter 实际用的关键词
    "同时构建 APK 和 AAB") build_target="all" ;;
    *) build_target="apk" ;;
  esac

  _color_echo green "✅ 已选择构建类型：$selected"
}

# ------------------------ 选择 flavor 和模式 ------------------------
_prompt_flavor_and_mode() {
  read "flavor_name?📎 请输入构建的 flavor（可留空）: "
  _color_echo yellow "📦 请选择构建模式："
  local modes=("release" "debug" "profile")
  build_mode=$(printf '%s\n' "${modes[@]}" | fzf)

  _color_echo green "✅ 已选择构建模式：$build_mode"
  [[ -n "$flavor_name" ]] && _color_echo green "✅ 使用 flavor：$flavor_name" || _color_echo cyan "📎 未使用 flavor"
}

# ------------------------ compileSdk / targetSdk / minSdk 检测增强 ------------------------
_print_sdk_versions() {
  local compile_sdk=""
  local target_sdk=""
  local min_sdk=""

  local build_files=("android/app/build.gradle" "android/app/build.gradle.kts")
  for file in "${build_files[@]}"; do
    [[ -f "$file" ]] || continue

    compile_sdk=$(grep -E "^\s*compileSdk\s*=\s*([0-9]+|[a-zA-Z.]+)" "$file" | head -n1 | awk -F= '{print $2}' | xargs)
    target_sdk=$(grep -E "^\s*targetSdk\s*=\s*([0-9]+|[a-zA-Z.]+)" "$file" | head -n1 | awk -F= '{print $2}' | xargs)
    min_sdk=$(grep -E "^\s*minSdk\s*=\s*([0-9]+|[a-zA-Z.]+)" "$file" | head -n1 | awk -F= '{print $2}' | xargs)

    [[ -n "$compile_sdk" ]] && break
  done

  [[ -n "$compile_sdk" ]] && _color_echo green "📦 当前使用 compileSdk 版本：$compile_sdk" || _color_echo red "📦 未检测到 compileSdk"
  [[ -n "$target_sdk" ]]  && _color_echo green "📦 当前使用 targetSdk 版本：$target_sdk"  || _color_echo red "📦 未检测到 targetSdk"
  [[ -n "$min_sdk" ]]     && _color_echo green "📦 当前使用 minSdk 版本：$min_sdk"       || _color_echo red "📦 未检测到 minSdk"
}

# ------------------------ AGP 版本检测 ------------------------
_print_agp_version() {
  local agp_version=""
  if [[ -f android/settings.gradle ]]; then
    agp_version=$(grep -oE "com\\.android\\.application['\"]?\\s+version\\s+['\"]?[0-9.]+" android/settings.gradle |
      head -n1 |
      grep -oE "[0-9]+\\.[0-9]+(\\.[0-9]+)?")
  fi
  if [[ -z "$agp_version" && -f android/build.gradle ]]; then
    agp_version=$(grep -oE "com\\.android\\.tools\\.build:gradle:[0-9.]+" android/build.gradle |
      head -n1 |
      cut -d: -f3)
  fi
  [[ -n "$agp_version" ]] && _color_echo green "📦 当前使用 AGP（Android Gradle Plugin）版本：$agp_version" || \
    _color_echo red "📦 未检测到 AGP 版本"
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

  _fix_jenv_java_version

  _color_echo blue "🩺 运行 flutter doctor -v 检查环境..."
  "${flutter_cmd[@]}" doctor -v | tee -a "$log_file"

  _color_echo blue "📦 当前使用 JDK 版本："
  java -version 2>&1 | tee -a "$log_file"

  _color_echo blue "📦 当前使用 Gradle 版本："
  ./android/gradlew -v | tee -a "$log_file"

  _color_echo blue "📦 当前使用 AGP（Android Gradle Plugin）版本："
  _print_agp_version | tee -a "$log_file"

  _print_sdk_versions | tee -a "$log_file"

  _color_echo blue "📦 当前使用 sdkmanager 版本："
  sdkmanager --list > /dev/null 2>&1 && sdkmanager --version | tee -a "$log_file" || _color_echo red "❌ sdkmanager 执行失败"

  _color_echo blue "📦 sdkmanager 来源路径："
  which sdkmanager | tee -a "$log_file"

  _color_echo green "🚀 构建命令：${flutter_cmd[*]} build $build_target ${flavor_name:+--flavor $flavor_name} --$build_mode"
  "${flutter_cmd[@]}" build $build_target ${flavor_name:+--flavor $flavor_name} --$build_mode | tee -a "$log_file"
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

# ------------------------ 主流程入口 ------------------------
cd "$(cd "$(dirname "$0")" && pwd -P)"

_check_homebrew_and_fzf
_resolve_flutter_project_path
_select_build_target

# 设置构建产物目录打开条件
case "$build_target" in
  apk)
    BUILD_APK=true
    ;;
  appbundle)
    BUILD_AAB=true
    ;;
  all)
    BUILD_APK=true
    BUILD_AAB=true
    ;;
esac

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
