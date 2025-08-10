#!/bin/zsh

# ✅ 日志与输出 ===============================
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

# ✅ 初始化环境
init_environment() {
  cd "$(cd "$(dirname "$0")" && pwd -P)" || exit 1
  # sdkmanager（Homebrew 安装的 android-commandlinetools）
  export PATH="/opt/homebrew/share/android-commandlinetools/cmdline-tools/latest/bin:$PATH"
  # jenv
  if [[ -d "$HOME/.jenv" ]]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
  fi
}

# ✅ 写 shellenv（修复未定义变量）
# 用法：inject_shellenv_block <profile_file> <id> <shellenv>
inject_shellenv_block() {
  local profile_file="$1"
  local id="$2"
  local shellenv="$3"
  local header="# >>> ${id} 环境变量 >>>"
  [[ -z "$profile_file" || -z "$id" || -z "$shellenv" ]] && { error_echo "❌ inject_shellenv_block 参数不足"; return 1; }
  touch "$profile_file"
  if ! grep -Fq "$header" "$profile_file"; then
    {
      echo ""
      echo "$header"
      echo "$shellenv"
    } >> "$profile_file"
    success_echo "✅ 已写入：$profile_file ($id)"
  else
    info_echo "📌 已存在：$profile_file ($id)"
  fi
  eval "$shellenv"
  success_echo "🟢 当前终端已生效"
}

# ✅ 架构判断
get_cpu_arch() { [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"; }

# ✅ Homebrew 自检
install_homebrew() {
  local arch="$(get_cpu_arch)"
  local shell_path="${SHELL##*/}"
  local profile_file
  local brew_bin
  local shellenv_cmd

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装…（$arch）"
    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { error_echo "❌ Homebrew 安装失败"; exit 1; }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { error_echo "❌ Homebrew 安装失败"; exit 1; }
      brew_bin="/usr/local/bin/brew"
    fi
    success_echo "✅ Homebrew 安装成功"

    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""
    case "$shell_path" in
      zsh)  profile_file="$HOME/.zprofile" ;;
      bash) profile_file="$HOME/.bash_profile" ;;
      *)    profile_file="$HOME/.profile" ;;
    esac
    inject_shellenv_block "$profile_file" "homebrew_env" "$shellenv_cmd"
  else
    info_echo "🔄 Homebrew 已安装，更新中…"
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
  fi
}

# ✅ Homebrew.fzf 自检
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    note_echo "📦 未检测到 fzf，开始安装…"
    brew install fzf || { error_echo "❌ fzf 安装失败"; exit 1; }
    success_echo "✅ fzf 安装成功"
  else
    info_echo "🔄 fzf 已安装，升级中…"
    brew upgrade fzf && brew cleanup
    success_echo "✅ fzf 已是最新版"
  fi
}

# ✅ 路径工具
abs_path() {
  local p="$1"; [[ -z "$p" ]] && return 1
  p="${p//\"/}"; [[ "$p" != "/" ]] && p="${p%/}"
  if [[ -d "$p" ]]; then (cd "$p" 2>/dev/null && pwd -P)
  elif [[ -f "$p" ]]; then (cd "${p:h}" 2>/dev/null && printf "%s/%s\n" "$(pwd -P)" "${p:t}")
  else return 1; fi
}

# ✅ 判断当前目录是否为Flutter项目根目录
is_flutter_project_root() { [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]; }

# ✅ 统一获取Flutter项目路径和Dart入口文件路径
resolve_flutter_root() {
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  local cwd="$PWD"
  if is_flutter_project_root "$script_dir"; then
    flutter_root="$script_dir"; cd "$flutter_root"; highlight_echo "📌 使用脚本所在目录作为 Flutter 根目录"; return
  fi
  if is_flutter_project_root "$cwd"; then
    flutter_root="$cwd"; cd "$flutter_root"; highlight_echo "📌 使用当前工作目录作为 Flutter 根目录"; return
  fi
  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录（包含 pubspec.yaml 和 lib/）："
    read -r input_path; input_path="${input_path//\"/}"; input_path=$(echo "$input_path" | xargs)
    [[ -z "$input_path" ]] && input_path="$script_dir" && info_echo "📎 未输入路径，默认：$input_path"
    local abs=$(abs_path "$input_path")
    if is_flutter_project_root "$abs"; then flutter_root="$abs"; cd "$flutter_root"; success_echo "✅ 识别成功：$flutter_root"; return; fi
    error_echo "❌ 无效路径：$abs，请重试"
  done
}

# ✅ 构建参数
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

# ✅ flavor
prompt_flavor_and_mode() {
  read "flavor_name?📎 请输入 flavor（可留空）: "
  local modes=("release" "debug" "profile")
  warn_echo "⚙️ 请选择构建模式："
  build_mode=$(printf '%s\n' "${modes[@]}" | fzf)
  success_echo "✅ 模式：$build_mode"
  [[ -n "$flavor_name" ]] && success_echo "✅ 使用 flavor：$flavor_name" || info_echo "📎 未指定 flavor"
}

# ✅ Flutter 命令检测
detect_flutter_command() {
  if command -v fvm >/dev/null && [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
    flutter_cmd=("fvm" "flutter"); warn_echo "🧩 检测到 FVM：使用 fvm flutter"
  else
    flutter_cmd=("flutter"); info_echo "📦 使用系统 flutter"
  fi
}

# ✅ Java 选择与注入
fix_jenv_java_version() {
  local jdk_path="/opt/homebrew/opt/openjdk@17"
  if command -v jenv >/dev/null 2>&1 && [[ -d "$jdk_path" ]]; then
    jenv versions --bare | grep -q "^17" || { warn_echo "📦 注册 openjdk@17 到 jenv…"; jenv add "$jdk_path"; jenv rehash; }
  fi
}

# ✅ Java 环境的配置
configure_java_env() {
  local record_file="$flutter_root/.java-version"
  local selected last_used; [[ -f "$record_file" ]] && last_used=$(cat "$record_file")
  local available_versions=$(brew search openjdk@ | grep -E '^openjdk@\d+$' | sort -Vr)
  [[ -z "$available_versions" ]] && { error_echo "❌ 未找到可用 openjdk"; exit 1; }

  if [[ -n "$last_used" && "$available_versions" == *"$last_used"* ]]; then
    success_echo "📦 上次使用的 JDK：$last_used"; read "?👉 继续使用？回车=是 / 任意键+回车=重新选: " && [[ -z "$REPLY" ]] && selected="$last_used"
  fi
  [[ -z "$selected" ]] && selected=$(echo "$available_versions" | fzf --prompt="☑️ 选择 openjdk 版本：" --height=40%) || true
  [[ -z "$selected" ]] && { error_echo "❌ 未选择 JDK"; exit 1; }

  local version_number="${selected#*@}"
  brew list --formula | grep -q "^$selected$" || brew install "$selected"
  sudo ln -sfn "/opt/homebrew/opt/$selected/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/${selected}.jdk" 2>/dev/null
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version_number")
  export PATH="$JAVA_HOME/bin:$PATH"
  echo "$selected" > "$record_file"
  success_echo "✅ JAVA_HOME = $JAVA_HOME"
}

# ✅ 版本打印
print_agp_version() {
  local agp_version=""
  if [[ -f android/settings.gradle ]]; then
    agp_version=$(grep -oE "com\\.android\\.application['\"]?\\s+version\\s+['\"]?[0-9.]+" android/settings.gradle | head -n1 | grep -oE "[0-9]+(\\.[0-9]+){1,2}")
  fi
  if [[ -z "$agp_version" && -f android/build.gradle ]]; then
    agp_version=$(grep -oE "com\\.android\\.tools\\.build:gradle:[0-9.]+" android/build.gradle | head -n1 | cut -d: -f3)
  fi
  [[ -n "$agp_version" ]] && success_echo "📦 AGP：$agp_version" || warn_echo "📦 未检测到 AGP 版本"
}

print_sdk_versions() {
  local file
  for file in android/app/build.gradle android/app/build.gradle.kts; do
    [[ -f "$file" ]] || continue
    local compile_sdk=$(grep -E "compileSdk\s*[:=]\s*['\"]?[0-9]+['\"]?" "$file" | head -n1 | grep -oE "[0-9]+")
    local target_sdk=$(grep -E "targetSdk\s*[:=]\s*['\"]?[0-9]+['\"]?" "$file" | head -n1 | grep -oE "[0-9]+")
    local min_sdk=$(grep -E "minSdk\s*[:=]\s*['\"]?[0-9]+['\"]?" "$file" | head -n1 | grep -oE "[0-9]+")
    [[ -n "$compile_sdk" ]] && info_echo "compileSdk：$compile_sdk" || warn_echo "未检测到 compileSdk"
    [[ -n "$target_sdk" ]] && info_echo "targetSdk：$target_sdk" || warn_echo "未检测到 targetSdk"
    [[ -n "$min_sdk"    ]] && info_echo "minSdk：$min_sdk"       || warn_echo "未检测到 minSdk"
    break
  done
}

# ✅ 用指定 JAVA 执行 Flutter
run_flutter_with_java() {
  JAVA_HOME="$JAVA_HOME" PATH="$JAVA_HOME/bin:$PATH" FVM_JAVA_HOME="$JAVA_HOME" JAVA_TOOL_OPTIONS="" \
  env JAVA_HOME="$JAVA_HOME" PATH="$JAVA_HOME/bin:$PATH" "${flutter_cmd[@]}" "$@"
}

# ✅ 打开产物目录
open_output_folder() {
  local base="build/app/outputs"
  [[ "$build_target" == "apk" || "$build_target" == "all" ]] && open "$base/flutter-apk" 2>/dev/null
  [[ "$build_target" == "appbundle" || "$build_target" == "all" ]] && open "$base/bundle/$build_mode" 2>/dev/null
}

# ✅ 交互辅助
confirm_step() { local step="$1"; read "REPLY?👉 是否执行【$step】？回车=是 / 任意键+回车=跳过: "; [[ -z "$REPLY" ]]; }

# ✅ 重获 Flutter 项目依赖
maybe_flutter_clean_and_get() {
  if confirm_step "flutter clean"; then "${flutter_cmd[@]}" clean; fi
  if confirm_step "flutter pub get"; then "${flutter_cmd[@]}" pub get; fi
}

# ✅ 环境诊断（不触发构建）
print_env_diagnostics() {
  local lf="/tmp/flutter_build_log.txt"; rm -f "$lf"
  color_echo "🩺 flutter doctor -v"
  "${flutter_cmd[@]}" doctor -v | tee -a "$lf"

  color_echo "📦 JDK 版本："; java -version 2>&1 | tee -a "$lf"

  info_echo "📦 Gradle wrapper 版本："
  if [[ -x ./android/gradlew ]]; then ./android/gradlew -v | tee -a "$lf"; else warn_echo "❌ 未找到 ./android/gradlew"; fi

  if command -v gradle &>/dev/null; then
    info_echo "📦 系统 gradle："; gradle -v | tee -a "$lf"; info_echo "📦 gradle 路径：$(which gradle)" | tee -a "$lf"
  else
    warn_echo "⚠️ 系统未安装 gradle"
  fi

  color_echo "📦 AGP："; print_agp_version | tee -a "$lf"

  color_echo "📦 sdkmanager 版本："
  sdkmanager --list > /dev/null 2>&1 && sdkmanager --version | tee -a "$lf" || err_echo "❌ sdkmanager 执行失败"
  color_echo "📦 sdkmanager 路径："; which sdkmanager | tee -a "$lf"

  color_echo "📦 Flutter 使用的 Android SDK 路径："
  "${flutter_cmd[@]}" config --machine | grep -o '"androidSdkPath":"[^"]*"' | cut -d':' -f2- | tr -d '"' | tee -a "$lf"
}

# ✅ 构建阶段（修复 all 分支 + 正确退出码）
run_flutter_build() {
  set -o pipefail
  local lf="/tmp/flutter_build_log.txt"
  local code=0

  _build_one() {
    local one_target="$1"
    local args=(build "$one_target" ${flavor_name:+--flavor "$flavor_name"} "--$build_mode")
    success_echo "🚀 构建命令：${flutter_cmd[*]} ${args[*]}"
    run_flutter_with_java "${args[@]}" 2>&1 | tee -a "$lf"
    local ec=${pipestatus[1]}
    return $ec
  }

  if [[ "$build_target" == "all" ]]; then
    _build_one apk   || code=$?
    [[ $code -ne 0 ]] && return $code
    _build_one appbundle || code=$?
    return $code
  else
    _build_one "$build_target"
    return $?
  fi
}

# ✅ main
main() {
  init_environment                   # ✅ 初始化环境
  show_intro                         # ✅ 自述信息
  install_homebrew                   # ✅ Homebrew 自检
  install_fzf                        # ✅ Homebrew.fzf 自检
  resolve_flutter_root               # ✅ 统一获取Flutter项目路径和Dart入口文件路径
  select_build_target                # ✅ 构建参数
  prompt_flavor_and_mode             # ✅ flavor
  detect_flutter_command             # ✅ Flutter 命令检测
  fix_jenv_java_version              # ✅ Java 选择与注入
  configure_java_env                 # ✅ Java 环境的配置
  print_env_diagnostics              # ✅ 环境诊断（不触发构建）
  maybe_flutter_clean_and_get        # ✅ 重获 Flutter 项目依赖

  if ! run_flutter_build; then
    error_echo "❌ 构建失败（详见 /tmp/flutter_build_log.txt）"
    exit 1
  fi

  open_output_folder
  success_echo "🎉 构建完成，日志保存在 /tmp/flutter_build_log.txt"
}

main "$@"
