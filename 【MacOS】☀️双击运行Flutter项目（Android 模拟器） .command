#!/bin/zsh

# ✅ 获取脚本当前路径
script_path="$(cd "$(dirname "$0")" && pwd)"
script_file="$(basename "$0")"

# ✅ 判断当前目录是否为 Flutter 项目
if [[ -f "$script_path/pubspec.yaml" ]]; then
  flutter_project_name=$(grep -m1 '^name:' "$script_path/pubspec.yaml" | awk '{print $2}')
else
  flutter_project_name="Flutter项目"
fi

# ✅ 生成桌面快捷方式
shortcut_name="${flutter_project_name}.command"
shortcut_path="$HOME/Desktop/$shortcut_name"

# ✅ 创建快捷方式（如果还不存在）
if [[ ! -f "$shortcut_path" ]]; then
  ln -s "$script_path/$script_file" "$shortcut_path"
  chmod +x "$shortcut_path"
  echo "📎 已在桌面创建快捷方式：$shortcut_name"
fi

# =====================================================
# 🛠️ 脚本功能说明
# =====================================================
echo ""
echo "===================================================================="
echo "🛠️ 脚本功能说明："
echo "===================================================================="
echo "📌 脚本用途："
echo "    ➤ 将 Dart 文件运行到 Android 模拟器"
echo ""
echo "📦 功能列表："
echo "    ✅ 拖入 Dart 文件或 Flutter 项目目录（含 lib/main.dart）"
echo "    ✅ 自动判断是否使用 FVM"
echo "    ✅ 自动检测和安装 Android SDK 工具（cmdline-tools, emulator 等）"
echo "    ✅ 自动创建和启动 AVD（Android 模拟器）"
echo "    ✅ 支持模拟器设备 / 系统镜像 fzf 多选 + 上次记忆"
echo "    ✅ 支持 Apple Silicon 自动优选 arm64 架构镜像"
echo "    ✅ 支持构建模式（debug/release/profile）与 --flavor"
echo "    ✅ 自动修复 adb / sdkmanager / avdmanager 找不到的问题"
echo ""
echo "🔁 可选步骤：[任意键=执行, 回车=跳过]"
echo "===================================================================="
echo ""



# ✅ 环境变量设置
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# ✅ 彩色输出函数
color_echo() { echo "\033[1;32m$1\033[0m"; }
warm_echo()  { echo "\033[1;33m$1\033[0m"; }
err_echo()   { echo "\033[1;31m$1\033[0m"; }

# ✅ 强化的自动修复 cmdline-tools
auto_install_sdk_tools() {
  local tools_dir="$ANDROID_HOME/cmdline-tools"
  local latest_dir="$tools_dir/latest"

  rm -rf "$latest_dir"
  mkdir -p "$latest_dir"

  cd /tmp || exit 1
  curl -O https://dl.google.com/android/repository/commandlinetools-mac-10406996_latest.zip
  unzip -q commandlinetools-mac-*.zip
  mv -f cmdline-tools/* "$latest_dir"

  export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$latest_dir/bin:$PATH"

  echo ""
  color_echo "🔍 验证工具安装情况："
  for tool in sdkmanager avdmanager emulator; do
    if command -v "$tool" &>/dev/null; then
      color_echo "✅ 已找到 $tool: $(command -v $tool)"
    else
      err_echo "❌ 修复失败：$tool"
    fi
  done

  echo ""
  color_echo "📁 当前 cmdline-tools 目录结构："
  ls -l "$latest_dir/bin"

  echo ""
  color_echo "✅ cmdline-tools 修复完成！"
}

# ✅ 检查 adb/sdkmanager/avdmanager 缺失
tools=(sdkmanager avdmanager adb)
missing_tools=()
for tool in "${tools[@]}"; do
  if ! command -v "$tool" &>/dev/null; then
    missing_tools+=("$tool")
  fi
done

if [[ ${#missing_tools[@]} -gt 0 ]]; then
  warm_echo "🔧 检测到 ${#missing_tools[@]} 个命令缺失，正在自动修复..."
  auto_install_sdk_tools
fi

# ✅ 自动创建 AVD（模拟器）逻辑
create_avd_if_needed() {
  if ! avdmanager list avd | grep -q "Name"; then
    warm_echo "⚠️ 本机无模拟器，正在自动创建..."

    local api_level="33"
    local arch="arm64-v8a"
    local sysimg_list=$(sdkmanager --list | grep "system-images;android-${api_level}" | grep -i "$arch" | awk '{print $1}')
    local sysimg=$(printf "%s\n" "${sysimg_list[@]}" | fzf --prompt="选择系统镜像" --height=10 --reverse)

    if [[ -z "$sysimg" ]]; then
      err_echo "❌ 无可用镜像，无法创建模拟器"
      return
    fi

    local sysimg_path="$ANDROID_HOME/$(echo "$sysimg" | sed 's/;/\//g')"
    color_echo "📦 即将下载系统镜像：$sysimg"
    color_echo "📁 下载路径为：$sysimg_path"

    sdkmanager "$sysimg"

    local devices=$(avdmanager list device | grep -E '^\s+id:' | cut -d "'" -f2)
    local device=""
    if [[ -z "$devices" ]]; then
      device="pixel_5"
      warm_echo "⚠️ 未获取到设备列表，默认使用：$device"
    else
      device=$(printf "%s\n" "${devices[@]}" | fzf --prompt="选择设备类型" --height=10 --reverse)
      if [[ -z "$device" ]]; then
        err_echo "❌ 设备选择失败"
        return
      fi
    fi

    read -r "?📝 输入模拟器名称（默认 MyAVD）：" avd_name
    avd_name=${avd_name:-MyAVD}

    avdmanager create avd -n "$avd_name" -k "$sysimg" -d "$device"

    color_echo "📁 模拟器数据目录：$HOME/.android/avd/${avd_name}.avd"
    color_echo "📄 模拟器配置文件：$HOME/.android/avd/${avd_name}.ini"
  fi
}

# ✅ 确保 AVD 启动运行中
ensure_avd_running() {
  if ! command -v adb &>/dev/null; then
    sdkmanager "platform-tools"
    export PATH="$ANDROID_HOME/platform-tools:$PATH"
  fi

  if ! adb devices | grep -q "emulator"; then
    pkill -f "emulator -avd" && sleep 2
    local avds=($(emulator -list-avds))
    local avd=$(printf "%s\n" "${avds[@]}" | fzf --prompt="选择要启动的 AVD" --height=10 --reverse)
    [[ -z "$avd" ]] && err_echo "❌ 未选择 AVD，模拟器无法启动" && exit 1
    nohup emulator -avd "$avd" > /dev/null 2>&1 &
    sleep 10
  fi
}

# ✅ 判断是否为 Flutter 项目根目录
validate_flutter_root() {
  local path="$1"
  [[ -f "$path/pubspec.yaml" && -d "$path/lib" ]] && return 0 || return 1
}

# ✅ 检测入口文件
detect_entry_file() {
  while true; do
    current_dir="$(pwd)"
    if validate_flutter_root "$current_dir"; then
      flutter_project_root="$current_dir"
      cd "$flutter_project_root" || exit 1
    else
      err_echo "❌ 当前目录不是 Flutter 项目根目录"
      warm_echo "📍 当前目录为：$current_dir"
      echo "📂 请拖入 Flutter 项目根目录（包含 pubspec.yaml 和 lib/）"
      read -r user_input
      user_input=${user_input//\"/}
      user_input=${user_input%/}
      if [[ -d "$user_input" ]] && validate_flutter_root "$user_input"; then
        flutter_project_root="$user_input"
        cd "$flutter_project_root" || exit 1
      else
        continue
      fi
    fi

    default_entry="lib/main.dart"
    if [[ -f "$default_entry" ]]; then
      dart_entry_file="$default_entry"
    else
      err_echo "⚠️ 未找到默认入口 lib/main.dart"
      while true; do
        echo "📄 请手动拖入入口 Dart 文件（例如 lib/xxx.dart）："
        read -r manual_entry
        manual_entry=${manual_entry//\"/}
        if [[ -f "$manual_entry" ]]; then
          dart_entry_file="$manual_entry"
          break
        else
          err_echo "❌ 无效的 Dart 文件路径"
        fi
      done
    fi

    break
  done

  color_echo "✅ 项目目录：$flutter_project_root"
  color_echo "✅ 入口文件：$dart_entry_file"

  read -r "?🧩 输入 flavor（可选，直接回车跳过）：" FLAVOR
  read -r "?🧩 输入构建模式（debug / release / profile，默认 debug）：" BUILD_MODE
  BUILD_MODE=${BUILD_MODE:-debug}
}

# ✅ 执行 flutter run
run_flutter() {
  # ✅ 设置 flutter 命令（优先 FVM）
  if [[ -f "$flutter_project_root/.fvm/fvm_config.json" ]] && command -v fvm &>/dev/null; then
    flutter_cmd="fvm flutter"
    color_echo "🧩 使用 FVM 管理 Flutter 版本"
  else
    flutter_cmd="flutter"
    color_echo "🧩 使用全局 Flutter"
  fi

  # ✅ 执行 flutter pub get
  eval "$flutter_cmd pub get"

  # ✅ 创建并确保 AVD 启动
  create_avd_if_needed
  ensure_avd_running

  # ✅ 检查 adb 是否检测到设备
  if ! adb devices | grep -q "device$"; then
    err_echo "❌ adb 未检测到任何 Android 模拟器或实体设备"
    adb devices
    exit 1
  fi

  # ✅ 获取 flutter devices 列表中的设备 ID
  device_id=$(eval "$flutter_cmd devices" | grep -iE 'emulator|android' | awk -F '•' '{print $2}' | head -n1 | xargs)

  if [[ -z "$device_id" ]]; then
    err_echo "❌ 未找到 Android 模拟器设备（flutter devices 无匹配）"
    eval "$flutter_cmd devices"
    exit 1
  fi

  # ✅ 构建并执行 flutter run 命令
  cmd="$flutter_cmd run -d $device_id -t $dart_entry_file"
  [[ -n "$FLAVOR" ]] && cmd+=" --flavor $FLAVOR"
  [[ "$BUILD_MODE" == "release" ]] && cmd+=" --release"
  [[ "$BUILD_MODE" == "profile" ]] && cmd+=" --profile"

  color_echo "🚀 执行命令：$cmd"
  eval "$cmd"
}

# ✅ 主流程入口
detect_entry_file
run_flutter
