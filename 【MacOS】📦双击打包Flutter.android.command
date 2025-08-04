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

# ✅ 自述信息
show_intro() {
  clear
  color_echo "🛠️ Flutter Android 打包脚本（支持 FVM / fzf / flavor / JDK 选择）"
  echo ""
  note_echo "📌 功能说明："
  note_echo "1️⃣ 自动识别当前 Flutter 项目路径（或拖入路径）"
  note_echo "2️⃣ 自动检测是否使用 FVM，并用 fvm flutter 构建"
  note_echo "3️⃣ 支持选择构建类型（仅 APK、仅 AAB、同时构建）"
  note_echo "4️⃣ 支持 flavor 参数和构建模式（release/debug/profile）"
  note_echo "5️⃣ 自动检测并配置 Java（openjdk），可选择版本"
  note_echo "6️⃣ 自动记忆上次使用的 JDK（保存在 .java-version）"
  note_echo "7️⃣ 构建前输出 📦 JDK / 📦 Gradle / 📦 AGP 三个版本信息"
  note_echo "8️⃣ 构建后自动打开输出产物目录"
  note_echo "9️⃣ 所有命令均统一交互：回车 = 执行，任意键 + 回车 = 跳过"
  note_echo "🔟 构建日志自动保存到 /tmp/flutter_build_log.txt"
  echo ""
  warm_echo "👉 回车 = 执行默认 / 任意键 + 回车 = 跳过（统一交互）"
  echo ""
  read "?📎 按回车开始："
}

# ✅ 初始化路径与工具
init_environment() {
  cd "$(cd "$(dirname "$0")" && pwd -P)" || exit 1

  # 添加 sdkmanager 路径
  export PATH="/opt/homebrew/share/android-commandlinetools/cmdline-tools/latest/bin:$PATH"

  # jenv 初始化
  if [[ -d "$HOME/.jenv" ]]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
  fi
}
 
# ✅ 判断芯片架构（ ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检 Homebrew
install_homebrew() {
  arch=$(get_cpu_arch)
  if ! command -v brew &>/dev/null; then
    _color_echo yellow "🧩 未检测到 Homebrew，正在安装 ($arch)..."
    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败"
        exit 1
      }
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
    fi
    _color_echo green "✅ Homebrew 安装成功"
  else
    _color_echo blue "🔄 Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup
    _color_echo green "✅ Homebrew 已更新"
  fi
}

# ============================== 自检 Homebrew.fzf ==============================
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
        ;;
      *) err "❌ 取消安装 fzf";;
    esac
  else
    _color_echo blue "🔄 fzf 已安装，升级中..."
    brew upgrade fzf
    _color_echo green "✅ fzf 已是最新版"
  fi
}

# ✅ 转换路径为绝对路径
_abs_path() {
  local input="$1"
  [[ -z "$input" ]] && return
  if [[ -d "$input" ]]; then
    cd "$input" && pwd -P
  else
    cd "$(dirname "$input")" && echo "$(pwd -P)/$(basename "$input")"
  fi
}

# ✅ 是否为 Flutter 项目的根目录
_is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ✅ Flutter 项目路径识别
resolve_flutter_root() {
  local script_path="$(_abs_path "$0")"
  local script_dir="${script_path:h}"
  local current_pwd="$(pwd -P)"

  if _is_flutter_project_root "$script_dir"; then
    flutter_root="$script_dir"
    cd "$flutter_root"
    highlight_echo "📌 使用脚本所在目录作为 Flutter 项目根目录"
    return
  fi

  if _is_flutter_project_root "$current_pwd"; then
    flutter_root="$current_pwd"
    cd "$flutter_root"
    highlight_echo "📌 使用当前工作目录作为 Flutter 项目根目录"
    return
  fi

  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录（包含 pubspec.yaml 和 lib/）："
    read -r input_path
    input_path="${input_path//\"/}"
    abs=$(_abs_path "$input_path")
    if _is_flutter_project_root "$abs"; then
      flutter_root="$abs"
      cd "$flutter_root"
      success_echo "✅ 识别成功：$flutter_root"
      return
    fi
    error_echo "❌ 无效路径，请重试"
  done
}

# ✅  构建参数选择
select_build_target() {
  warn_echo "📦 请选择构建类型："
  local options=("只构建 APK" "只构建 AAB" "同时构建 APK 和 AAB")
  local selected=$(printf '%s\n' "${options[@]}" | fzf)
  case "$selected" in
    "只构建 APK") build_target="apk" ;;
    "只构建 AAB") build_target="appbundle" ;;
    "同时构建 APK 和 AAB") build_target="all" ;;
    *) build_target="apk" ;;
  esac
  success_echo "✅ 构建类型：$selected"
}
  
# ✅ 选择 flavor 和构建模式（release/debug/profile）
prompt_flavor_and_mode() {
  read "flavor_name?📎 请输入 flavor（可留空）: "
  local modes=("release" "debug" "profile")
  warn_echo "⚙️ 请选择构建模式："
  build_mode=$(printf '%s\n' "${modes[@]}" | fzf)
  success_echo "✅ 模式：$build_mode"
  [[ -n "$flavor_name" ]] && success_echo "✅ 使用 flavor：$flavor_name" || info_echo "📎 未指定 flavor"
}

# ✅ FVM 检测与 Flutter 命令
detect_flutter_command() {
  if command -v fvm >/dev/null && [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    flutter_cmd=("fvm" "flutter")
    warn_echo "🧩 检测到 FVM：使用 fvm flutter"
  else
    flutter_cmd=("flutter")
    info_echo "📦 使用系统 flutter"
  fi
}

# ✅ Java 环境配置
fix_jenv_java_version() {
  local jdk_path="/opt/homebrew/opt/openjdk@17"
  if command -v jenv >/dev/null 2>&1 && [[ -d "$jdk_path" ]]; then
    if ! jenv versions --bare | grep -q "^17"; then
      warn_echo "📦 openjdk@17 未注册到 jenv，尝试添加..."
      jenv add "$jdk_path"
    fi
  fi
}
# ✅ 配置 Java 环境（支持记忆）
configure_java_env() {
  local record_file="$flutter_root/.java-version"
  local selected=""
  local last_used=""
  [[ -f "$record_file" ]] && last_used=$(cat "$record_file")

  local available_versions=$(brew search openjdk@ | grep -E '^openjdk@\d+$' | sort -Vr)
  if [[ -z "$available_versions" ]]; then
    error_echo "❌ 未找到可用的 openjdk"
    exit 1
  fi

  if [[ -n "$last_used" && "$available_versions" == *"$last_used"* ]]; then
    success_echo "📦 上次使用的 JDK：$last_used"
    read "?👉 是否继续使用？回车=是 / 任意键+回车=重新选择: "
    [[ -z "$REPLY" ]] && selected="$last_used"
  fi

  if [[ -z "$selected" ]]; then
    selected=$(echo "$available_versions" | fzf --prompt="☑️ 选择 openjdk 版本：" --height=40%)
    [[ -z "$selected" ]] && error_echo "❌ 未选择 JDK" && exit 1
  fi

  local version_number="${selected#*@}"
  brew list --formula | grep -q "^$selected$" || brew install "$selected"
  sudo ln -sfn "/opt/homebrew/opt/$selected/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/${selected}.jdk" 2>/dev/null
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version_number")
  export PATH="$JAVA_HOME/bin:$PATH"
  echo "$selected" > "$record_file"
  success_echo "✅ JAVA_HOME 已设置为：$JAVA_HOME"
}

# ✅ 构建信息打印
print_agp_version() {
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
  [[ -n "$agp_version" ]] && success_echo "📦 当前使用 AGP 版本：$agp_version" || warn_echo "📦 未检测到 AGP 版本"
}

print_sdk_versions() {
  local file=""
  for file in android/app/build.gradle android/app/build.gradle.kts; do
    [[ -f "$file" ]] || continue
    local compile_sdk=$(grep -E "compileSdk\s*[:=]\s*['\"]?[0-9]+['\"]?" "$file" | head -n1 | grep -oE "[0-9]+")
    local target_sdk=$(grep -E "targetSdk\s*[:=]\s*['\"]?[0-9]+['\"]?" "$file" | head -n1 | grep -oE "[0-9]+")
    local min_sdk=$(grep -E "minSdk\s*[:=]\s*['\"]?[0-9]+['\"]?" "$file" | head -n1 | grep -oE "[0-9]+")
    [[ -n "$compile_sdk" ]] && info_echo "compileSdk：$compile_sdk" || warn_echo "未检测到 compileSdk"
    [[ -n "$target_sdk" ]] && info_echo "targetSdk：$target_sdk" || warn_echo "未检测到 targetSdk"
    [[ -n "$min_sdk" ]] && info_echo "minSdk：$min_sdk" || warn_echo "未检测到 minSdk"
    break
  done
}

# ✅ 执行构建
run_flutter_build() {
  local log_file="/tmp/flutter_build_log.txt"
  rm -f "$log_file"
  fix_jenv_java_version

  info_echo "📦 JDK 版本："
  java -version 2>&1 | tee -a "$log_file"

  info_echo "📦 Gradle 版本："
  ./android/gradlew -v | tee -a "$log_file"

  print_agp_version | tee -a "$log_file"
  print_sdk_versions | tee -a "$log_file"

  info_echo "📦 sdkmanager 版本："
  sdkmanager --version | tee -a "$log_file" || warn_echo "sdkmanager 未找到"

  local build_cmd=("${flutter_cmd[@]}" build "$build_target" ${flavor_name:+--flavor "$flavor_name"} --"$build_mode")
  success_echo "🚀 执行构建命令：${build_cmd[*]}"
  "${build_cmd[@]}" | tee -a "$log_file"
}

# ✅ 打开输出目录
open_output_folder() {
  local base="build/app/outputs"
  if [[ "$build_target" == "apk" || "$build_target" == "all" ]]; then
    open "$base/flutter-apk" 2>/dev/null
  fi
  if [[ "$build_target" == "appbundle" || "$build_target" == "all" ]]; then
    open "$base/bundle/$build_mode" 2>/dev/null
  fi
}
# ✅ 判断是否使用 FVM
_detect_flutter_cmd() {
  if command -v fvm >/dev/null 2>&1 && [[ -f ".fvm/fvm_config.json" ]]; then
    flutter_cmd=("fvm" "flutter")
    info_echo "🧩 检测到 FVM 项目，使用命令：fvm flutter"
  else
    flutter_cmd=("flutter")
    info_echo "📦 使用系统 Flutter 命令：flutter"
  fi
}

# ✅ 执行 flutter clean🧹 与 pub get
maybe_flutter_clean_and_get() {
  if confirm_step "flutter clean"; then
    "${flutter_cmd[@]}" clean
  fi

  if confirm_step "flutter pub get"; then
    "${flutter_cmd[@]}" pub get
  fi
}

# ============================== 🚀 main 函数入口 ==============================
main() {
    cd "$(cd "$(dirname "$0")" && pwd -P)"      # ✅ 切换到脚本目录
    show_intro                                  # ✅ 自述信息
    install_homebrew                            # ✅ 自检 Homebrew
    install_fzf                                 # ✅ 自检 Homebrew.fzf
    resolve_flutter_root                        # ✅ 获取 Flutter 根目录
    select_build_target                         # ✅ 选择 APK / AAB / All 构建类型
    prompt_flavor_and_mode                      # ✅ 选择 flavor 和构建模式（release/debug/profile）
    detect_flutter_cmd                          # ✅ 判断是否使用 FVM
    configure_java_env                          # ✅ 配置 Java 环境（支持记忆）
    maybe_flutter_clean_and_get                 # ✅ 执行 flutter clean🧹 与 pub get
    run_flutter_build                           # ✅ 执行 flutter build 命令
    open_output_folder                          # ✅ 打开构建产物目录
    success_echo "🎉 构建完成，日志保存在 /tmp/flutter_build_log.txt"
}

main "$@"
