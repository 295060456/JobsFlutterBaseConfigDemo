#!/bin/zsh

# ✅ 变量定义
script_path="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
cd "$script_path"
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
script_file="$(basename "$0")"
flutter_cmd=("flutter")
entry_file="" # Flutter项目的入口

 # ✅ 彩色输出函数
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
  echo ""
  bold_echo "===================================================================="
  note_echo "🛠️ 脚本功能说明："
  bold_echo "===================================================================="
  note_echo "📌 脚本用途："
  note_echo "将 Dart 文件运行到 Android 模拟器"
  echo ""
  note_echo "📦 功能列表："
  success_echo " ✅ 拖入 Dart 文件或 Flutter 项目目录（含 lib/main.dart）"
  success_echo " ✅ 自动判断是否使用 FVM"
  success_echo " ✅ 自动检测和安装 Android SDK 工具"
  success_echo " ✅ 自动创建和启动 AVD（支持 fzf 多选 + arm64 优化）"
  success_echo " ✅ 支持构建模式（debug/release/profile）与 --flavor"
  success_echo " ✅ 自动修复 adb / sdkmanager / namespace 等问题"
  echo ""
  warm_echo "🔁 可选步骤：[任意键=执行, 回车=跳过]"
  bold_echo "===================================================================="
  echo ""

  # ✅ 等待用户输入，回车跳过，其他继续
  print -n "⚙️  现在是否执行可选操作？（回车跳过 / 任意键执行）："
  read user_choice

  if [[ -z "$user_choice" ]]; then
    return 1   # 跳过
  else
    return 0   # 执行
  fi
}

# ✅ 启动 Android 模拟器
# 检查模拟器是否存在；
# 启动一个可用的；
# 设置并返回 $device_id
get_or_start_android_emulator() {
  # ✅ 全局声明变量 device_id
  typeset -g device_id

  device_id=$(eval "${flutter_cmd[@]}" devices | grep -iE 'emulator|android' | awk -F '•' '{print $2}' | head -n1 | xargs)

  if [[ -n "$device_id" ]]; then
    success_echo "📱 已找到 Android 模拟器设备：$device_id"
    return 0
  fi

  warn_echo "⚠️ 未找到 Android 模拟器，尝试自动启动..."

  if ! command -v emulator &>/dev/null; then
    error_echo "❌ 未找到 emulator 命令，请检查 ANDROID_HOME 设置"
    return 1
  fi

  local avd_name
  avd_name=$(avdmanager list avd | grep "Name:" | head -n1 | awk -F': ' '{print $2}' | xargs)

  if [[ -z "$avd_name" ]]; then
    error_echo "❌ 没有可用的 AVD，请先创建模拟器"
    echo "你可以运行：avdmanager create avd -n your_avd_name -k \"system-images;android-30;google_apis;x86_64\""
    return 1
  fi

  note_echo "🚀 启动模拟器：$avd_name"
  nohup emulator -avd "$avd_name" >/dev/null 2>&1 &

  local timeout=60
  while [[ $timeout -gt 0 ]]; do
    device_id=$(eval "${flutter_cmd[@]}" devices | grep -iE 'emulator|android' | awk -F '•' '{print $2}' | head -n1 | xargs)
    if [[ -n "$device_id" ]]; then
      success_echo "✅ 模拟器启动成功：$device_id"
      return 0
    fi
    sleep 2
    ((timeout-=2))
  done

  error_echo "❌ 模拟器启动超时（60秒）"
  return 1
}

# ✅ 日志输出（日志文件名 == 脚本文件名）
init_logging() {
  local custom_log_name="$1"

  # 获取脚本路径（兼容 Finder 双击和终端执行）
  local resolved_path="${(%):-%x}"
  script_path="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"

  local default_log_name="$(basename "$resolved_path" | sed 's/\.[^.]*$//').log"
  local log_file_name="${custom_log_name:-$default_log_name}"

  LOG_FILE="${script_path}/${log_file_name}"

  # 清空旧日志
  : > "$LOG_FILE"
  # 打印路径（彩色输出后才重定向）
  info_echo "日志记录启用：$LOG_FILE"
  # 重定向所有输出到终端 + 日志
  exec 1> >(tee -a "$LOG_FILE") 2>&1
}

# ✅ 创建桌面快捷方式
create_shortcut() {
  if [[ -f "$flutter_project_root/pubspec.yaml" ]]; then
    flutter_project_name=$(grep -m1 '^name:' "$flutter_project_root/pubspec.yaml" | awk '{print $2}')
  else
    flutter_project_name="Flutter项目"
  fi
  shortcut_name="${flutter_project_name}.command"
  shortcut_path="$HOME/Desktop/$shortcut_name"
  if [[ ! -f "$shortcut_path" ]]; then
    ln -s "$script_path/$script_file" "$shortcut_path"
    chmod +x "$shortcut_path"
    success_echo "📎 已在桌面创建快捷方式：$shortcut_name"
  fi
}

# ✅ 判断芯片架构（ARM64/ x86_64）
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

# ✅ 自检安装：🍺Homebrew
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

# ✅ 自检安装：🍺Homebrew.jenv
install_jenv() {
  if ! command -v jenv &>/dev/null; then
    info_echo "📦 未检测到 jenv，正在通过 Homebrew 安装..."
    brew install jenv || { error_echo "❌ jenv 安装失败"; exit 1; }
    success_echo "✅ jenv 安装成功"
  else
    info_echo "🔄 jenv 已安装，升级中..."
    brew upgrade jenv && brew cleanup
    success_echo "✅ jenv 已是最新版"
  fi

  # ✅ 设置 jenv 环境变量（追加到 .zshrc 或 .bash_profile）
  local shellrc="$HOME/.zshrc"
  [[ -n "$ZSH_VERSION" ]] || shellrc="$HOME/.bash_profile"

  if ! grep -q 'jenv init' "$shellrc"; then
    info_echo "📎 正在写入 jenv 初始化配置到：$shellrc"
    {
      echo ''
      echo '# >>> jenv 初始化 >>>'
      echo 'export PATH="$HOME/.jenv/bin:$PATH"'
      echo 'eval "$(jenv init -)"'
      echo '# <<< jenv 初始化 <<<'
    } >> "$shellrc"
    success_echo "✅ jenv 初始化配置已写入 $shellrc"
  else
    info_echo "📌 jenv 初始化配置已存在于 $shellrc"
  fi

  # ✅ 当前 shell 生效
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  success_echo "🟢 jenv 初始化完成并在当前终端生效"
}

# ✅ 初始化 jenv 并注入 JAVA_HOME（优先读取 .java-version）
select_and_set_java_version() {
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init - zsh)"

  local java_version

  # === 检查项目中的 .java-version 文件 ===
    if [[ -f ".java-version" ]]; then
      java_version=$(jenv version-name 2>/dev/null)

      if [[ -n "$java_version" && -d "$HOME/.jenv/versions/$java_version" ]]; then
        success_echo "📌 项目中存在 .java-version：$java_version"

        print -n "⚠️ 检测到已有 Java 版本 $java_version，按回车默认使用，输入任意字符重新选择："
        read confirm

        if [[ -n "$confirm" ]]; then
          note_echo "🔁 将忽略当前 .java-version，重新选择 Java 版本..."
        else
          export JAVA_HOME="$HOME/.jenv/versions/$java_version"
          export PATH="$JAVA_HOME/bin:$PATH"
          success_echo "✅ JAVA_HOME 设置为：$JAVA_HOME"
          return
        fi
      else
        warn_echo "⚠️ .java-version 存在但无效，将重新选择 Java 版本..."
      fi
    fi

  # === fzf 手动选择流程 ===
  local available_versions
  available_versions=$(jenv versions --bare --verbose | grep -v '^$' || true)

  if [[ -z "$available_versions" ]]; then
    error_echo "❌ jenv 中未检测到任何 Java 版本，请先添加"
    exit 1
  fi

  local selected_version
  selected_version=$(echo "$available_versions" | fzf --prompt="🧩 选择 Java 版本: ")

  if [[ -z "$selected_version" ]]; then
    warn_echo "⚠️ 用户未选择 Java 版本，退出"
    exit 1
  fi

  success_echo "📌 已选择 Java 版本：$selected_version"
  jenv local "$selected_version" || {
    error_echo "❌ 设置 jenv local 失败"
    exit 1
  }

  export JAVA_HOME="$HOME/.jenv/versions/$selected_version"
  export PATH="$JAVA_HOME/bin:$PATH"
  success_echo "✅ JAVA_HOME 设置为：$JAVA_HOME"
}

# ✅ Android 构建环境完整性检查
check_android_environment() {
  warm_echo "🔍 正在检查 Android 构建环境..."
  eval "$flutter_cmd --version"

  # === JDK 检查 ===
  if ! command -v java &>/dev/null; then
    error_echo "❌ 未安装 Java（JDK），请先安装 JDK 17 或以上"
    exit 1
  fi

  JAVA_VERSION=$(java -version 2>&1 | grep 'version' | awk -F '"' '{print $2}')
  JAVA_HOME_PATH=$(dirname "$(dirname "$(which java)")")

  note_echo "📦 当前使用 JDK 版本为：$JAVA_VERSION"
  note_echo "📂 JAVA_HOME 推断路径：$JAVA_HOME_PATH"

  if [[ "$JAVA_HOME_PATH" == *Android\ Studio* ]]; then
    warn_echo "⚠️ 当前使用的是 Android Studio 自带的 JDK"
  fi

  # === sdkmanager 检查 + 版本 ===
  if ! command -v sdkmanager &>/dev/null; then
    error_echo "❌ 未找到 sdkmanager，可能缺少 Android cmdline-tools"
    warn_echo "🛠️ 可尝试执行：sdkmanager --install 'cmdline-tools;latest'"
    exit 1
  else
    sdk_version=$(sdkmanager --version 2>/dev/null | head -n1)
    success_echo "✅ sdkmanager 版本：$sdk_version"
  fi

  # === adb 检查 + 版本 ===
  if ! command -v adb &>/dev/null; then
    error_echo "❌ 未安装 adb，缺失 platform-tools"
    warn_echo "🛠️ 可执行：sdkmanager 'platform-tools'"
    exit 1
  else
    adb_version=$(adb version | grep -oE 'version [0-9.]+' | awk '{print $2}')
    success_echo "✅ adb 版本：$adb_version"
  fi

  # === build-tools 检查 ===
  if [[ ! -d "$ANDROID_HOME/build-tools" ]] || [[ -z "$(ls "$ANDROID_HOME/build-tools")" ]]; then
    warn_echo "⚠️ 未检测到任何 build-tools，尝试安装中..."
    sdkmanager "build-tools;34.0.0" || warn_echo "⚠️ build-tools 安装可能失败，请手动检查"
  else
    latest_build_tools=$(ls "$ANDROID_HOME/build-tools" | sort -V | tail -n1)
    success_echo "✅ 已检测到 build-tools：$latest_build_tools"
  fi

  # === platforms 检查 ===
  if [[ ! -d "$ANDROID_HOME/platforms" ]] || [[ -z "$(ls "$ANDROID_HOME/platforms")" ]]; then
    warn_echo "⚠️ 未检测到任何 Android 平台 SDK，尝试安装中..."
    sdkmanager "platforms;android-34" || warn_echo "⚠️ Android 平台 SDK 安装可能失败，请手动检查"
  else
    latest_platform=$(ls "$ANDROID_HOME/platforms" | sort -V | tail -n1)
    success_echo "✅ 已检测到平台 SDK：$latest_platform"
  fi

  # === flutter doctor 全量输出 ===
  note_echo "🩺 正在执行 flutter doctor 检查环境..."
  "${flutter_cmd[@]}" doctor
  "${flutter_cmd[@]}" doctor | tee -a "$LOG_FILE"
  
  # === Gradle Wrapper 检查 ===
  local wrapper_file="android/gradle/wrapper/gradle-wrapper.properties"
  if [[ -f "$wrapper_file" ]]; then
    gradle_url=$(grep distributionUrl "$wrapper_file" | cut -d= -f2 | xargs)
    gradle_version=$(echo "$gradle_url" | grep -oE 'gradle-[0-9.]+' || true)
    if [[ -n "$gradle_version" ]]; then
      success_echo "✅ 检测到 Gradle Wrapper：$gradle_version"
    else
      warn_echo "⚠️ 未能解析 Gradle 版本：$gradle_url"
    fi
  else
    warn_echo "⚠️ 未检测到 gradle-wrapper.properties，可能不是标准 Flutter 项目结构"
  fi

  # === Android NDK 检查 ===
  local ndk_dir="$ANDROID_HOME/ndk"
  if [[ -d "$ndk_dir" ]] && [[ -n "$(ls -A "$ndk_dir")" ]]; then
    latest_ndk=$(ls "$ndk_dir" | sort -V | tail -n1)
    success_echo "✅ 检测到 Android NDK：$latest_ndk"
  else
    warn_echo "⚠️ 未检测到 Android NDK（$ndk_dir），如项目使用 native C/C++，请通过 sdkmanager 安装"
    note_echo "➤ 示例命令：sdkmanager 'ndk;26.3.11579264'"
  fi

  warm_echo "🔍 Android 构建环境监察完毕"
}

# ✅ Flutter 命令检测
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

# ✅ 修复缺失 namespace
fix_missing_namespace() {
  local project_root="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  local gradle_files=($(find "$project_root/android" -type f -name "build.gradle" -not -path "*/build/*"))
  for gradle_file in "${gradle_files[@]}"; do
    if [[ "$(basename "$(dirname "$gradle_file")")" == "android" ]]; then continue; fi
    local module_dir=$(dirname "$gradle_file")
    if grep -q "namespace\s\+" "$gradle_file"; then
      success_echo "✅ 已有 namespace：$gradle_file"
      continue
    fi
    local manifest_file="$module_dir/src/main/AndroidManifest.xml"
    if [[ -f "$manifest_file" ]]; then
      local package_name=$(grep -oP 'package="\K[^"]+' "$manifest_file")
      if [[ -n "$package_name" ]]; then
        if grep -q "android\s*{" "$gradle_file"; then
          sed -i '' "/android\s*{/a\\
          \ \ \ \ namespace \"$package_name\"
          " "$gradle_file"
          success_echo "🚀 已插入 namespace \"$package_name\" 到：$gradle_file"
        else
          warn_echo "⚠️ 未找到 android {} 块，跳过：$gradle_file"
        fi
      else
        error_echo "❌ 无法从 Manifest 提取 package：$manifest_file"
      fi
    else
      warn_echo "⚠️ 未找到 AndroidManifest.xml：$manifest_file"
    fi
  done
}

# ✅ 判断当前目录是否为Flutter项目根目录
is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ✅ 转换路径为绝对路径
abs_path() {
  local p="$1"
  [[ -z "$p" ]] && return 1
  p="${p//\"/}"                                                         # ✅ 移除双引号，防止参数传递误差
  [[ "$p" != "/" ]] && p="${p%/}"                                                               # ✅ 去除末尾斜杠，标准化路径形式

  if [[ -d "$p" ]]; then
    (cd "$p" 2>/dev/null && pwd -P)                                     # ✅ 子 shell，避免污染当前目录
  elif [[ -f "$p" ]]; then
    (cd "${p:h}" 2>/dev/null && printf "%s/%s\n" "$(pwd -P)" "${p:t}")  # ✅ 精准拼接
  else
    return 1
  fi
}

# ✅ 检测入口文件
detect_entry() {
  script_path="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  
  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径（回车即表示当前脚本的执行路径）："
    read -r user_input
    user_input="${user_input//\"/}"
    user_input="${user_input%/}"

    if [[ -z "$user_input" ]]; then
      if is_flutter_project_root "$script_path"; then
        flutter_root=$(abs_path "$script_path")
        entry_file="$flutter_root/lib/main.dart"
        highlight_echo "🎯 检测到脚本所在目录即 Flutter 根目录，自动使用。"
        break
      else
        error_echo "❌ 当前目录不是 Flutter 项目根目录，请重新拖入。"
        continue
      fi
    fi

    if [[ -d "$user_input" ]]; then
      if is_flutter_project_root "$user_input"; then
        flutter_root=$(abs_path "$user_input")
        entry_file="$flutter_root/lib/main.dart"
        break
      fi
    elif [[ -f "$user_input" ]]; then
      if is_dart_entry_file "$user_input"; then
        entry_file=$(abs_path "$user_input")
        flutter_root="${entry_file:h}"
        break
      fi
    fi

    error_echo "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
  done

  cd "$flutter_root" || { error_echo "无法进入项目目录：$flutter_root"; exit 1; }
  success_echo "✅ 项目路径：$flutter_root"
  success_echo "🎯 入口文件：$entry_file"
}

# ✅ 询问执行 flutter pub upgrade
replace_connectivity_dependency() {
  echo ""
  warn_echo "有些时候执行此命令，会造成代码无法构建。"
  warn_echo "默认不执行，请谨慎操作！"
  read "?🔧 是否执行 flutter pub upgrade ？输入 y 执行，其它跳过: " confirm
  if [[ ! "$confirm" =~ ^[yY]$ ]]; then
    note_echo "⏩ 已跳过依赖替换操作"
    return
  fi

  note_echo "📦 自动执行：flutter pub upgrade"
  eval "${flutter_cmd[@]}" pub upgrade

  local yaml_path="$flutter_project_root/pubspec.yaml"
  if grep -q "connectivity:" "$yaml_path"; then
    if grep -q "connectivity_plus:" "$yaml_path"; then
      warn_echo "⚠️ 已存在 connectivity_plus，跳过重复添加"
      sed -i '' '/^\s*connectivity[: ].*/d' "$yaml_path"
    else
      highlight_echo "🔁 自动替换 connectivity → connectivity_plus"
      sed -i '' 's/^\s*connectivity:/  connectivity_plus:/g' "$yaml_path"
    fi
    eval "${flutter_cmd[@]}" pub get
  else
    info_echo "ℹ️ 未检测到 connectivity，无需替换"
  fi
}

# ✅ 执行 flutter run
run_flutter() {
  note_echo "🧹 自动执行：flutter clean"
  eval "${flutter_cmd[@]}" clean

  replace_connectivity_dependency  # 询问是否 pub upgrade 并替换依赖

  # ================================== 构建命令 ==================================
  cmd=("${flutter_cmd[@]}" run -d "$device_id" -t "$entry_file")
  [[ -n "$FLAVOR" ]] && cmd+=("--flavor" "$FLAVOR")
  [[ "$BUILD_MODE" == "release" ]] && cmd+=("--release")
  [[ "$BUILD_MODE" == "profile" ]] && cmd+=("--profile")

  # ================================== 添加 --android-skip-build-dependency-validation ==================================
  read "?🔧 是否跳过 Android 构建依赖验证？按回车添加，输入任意字符不添加: " confirm
  if [[ -z "$confirm" ]]; then
    cmd+=("--android-skip-build-dependency-validation")
    note_echo "✅ 已添加参数：--android-skip-build-dependency-validation"
  else
    note_echo "⏩ 未添加该参数"
  fi

  # ================================== 前台/后台运行选择 ==================================
  echo ""
  read "?🎮 是否后台运行？按回车前台运行，输入任意字符后台运行（关闭终端不影响）: " run_mode
  if [[ -z "$run_mode" ]]; then
      # ✅ 回车 → 前台运行
      "${cmd[@]}"
      if [[ $? -ne 0 ]]; then
        warn_echo "⚠️ 构建失败，执行自动修复流程..."
        note_echo "🧹 清除项目构建产物和 pubspec.lock..."
        rm -rf "$flutter_project_root/.dart_tool"
        rm -rf "$flutter_project_root/build"
        rm -f "$flutter_project_root/pubspec.lock"

        eval "${flutter_cmd[@]}" clean
        eval "${flutter_cmd[@]}" pub get

        note_echo "🔁 正在重试 flutter run..."
        "${cmd[@]}"
    fi
  else
    # ❗ 任意字符 → 前台运行
    nohup "${cmd[@]}" > /tmp/flutter_run.log 2>&1 &
    disown
    success_echo "✅ Flutter 已后台运行，日志写入：/tmp/flutter_run.log"
  fi
}

# ✅ 询问用户是否用VSCode打开此Flutter项目
maybe_open_in_vscode() {
  print -n "🧭 是否用 VS Code 打开项目？（回车 = 打开，输入任意字符 = 跳过）："
  read confirm

  if [[ -z "$confirm" ]]; then
    if command -v code >/dev/null 2>&1; then
      open_path="$script_path"
      success_echo "🚀 正在用 VS Code 打开项目目录：$open_path"
      code "$open_path"
    else
      error_echo "❌ 未找到 VS Code 的命令行工具 code，请先在 VS Code 中启用 'Shell Command: Install code in PATH'"
      color_echo '🔥配置 VSCode 环境变量 👉 export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"'
    fi
  else
    note_echo "⏩ 已跳过 VS Code 打开操作"
  fi
}

# ✅ 主函数
main() {
    init_logging                             # ✅ 日志输出（日志文件名 == 脚本文件名）
    detect_flutter_cmd                       # ✅ Flutter 命令检测
    show_intro                               # ✅ 自述信息
    get_or_start_android_emulator || exit 1  # ✅ 启动 Android 模拟器

    install_homebrew                         # ✅ 自检安装：🍺Homebrew
    install_jenv                             # ✅ 自检安装：🍺Homebrew.jenv
    select_and_set_java_version              # ✅ Java 环境注入
    check_android_environment                # ✅ Android 构建环境完整性检查

    fix_missing_namespace                    # ✅ 修复缺失 namespace
    detect_entry                             # ✅ 检测入口文件
    run_flutter                              # ✅ 执行 flutter run（运行前先清理）
 
    maybe_open_in_vscode                     # ✅ 询问用户是否用VSCode打开此Flutter项目
    create_shortcut                          # ✅ 创建桌面快捷方式
}

main "$@"
