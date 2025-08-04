#!/bin/zsh

# ✅ 环境变量设置
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# ✅ 获取脚本路径
script_path="$(cd "$(dirname "$0")" && pwd)"
script_file="$(basename "$0")"
flutter_project_root="$script_path"

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

# ✅ 自述信息
show_intro() {
  echo ""
  bold_echo "===================================================================="
  note_echo "🛠️ 脚本功能说明："
  bold_echo "===================================================================="
  note_echo "📌 脚本用途："
  note_echo "    ➤ 将 Dart 文件运行到 Android 模拟器"
  echo ""
  note_echo "📦 功能列表："
  success_echo "    ✅ 拖入 Dart 文件或 Flutter 项目目录（含 lib/main.dart）"
  success_echo "    ✅ 自动判断是否使用 FVM"
  success_echo "    ✅ 自动检测和安装 Android SDK 工具"
  success_echo "    ✅ 自动创建和启动 AVD（支持 fzf 多选 + arm64 优化）"
  success_echo "    ✅ 支持构建模式（debug/release/profile）与 --flavor"
  success_echo "    ✅ 自动修复 adb / sdkmanager / namespace 等问题"
  echo ""
  warm_echo "🔁 可选步骤：[任意键=执行, 回车=跳过]"
  bold_echo "===================================================================="
  echo ""
}

# ✅ 修复缺失 namespace
fix_missing_namespace() {
  local project_root="$1"
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

# ✅  启动 Android 模拟器
start_android_emulator() {
  if adb devices | grep -q "device$"; then
    success_echo "✅ 已检测到设备或模拟器"
    return
  fi
  warm_echo "🖥️ 当前无模拟器运行，准备启动 AVD..."
  if ! command -v fzf &>/dev/null; then
    error_echo "❌ 未安装 fzf，请先安装：brew install fzf"
    exit 1
  fi
  avds=($("$ANDROID_HOME/emulator/emulator" -list-avds))
  if [[ ${#avds[@]} -eq 0 ]]; then
    error_echo "❌ 未找到任何 AVD，请先使用 avdmanager 创建模拟器"
    exit 1
  fi
  selected_avd=$(printf "%s\n" "${avds[@]}" | fzf --prompt="📱 选择要启动的模拟器：")
  if [[ -z "$selected_avd" ]]; then
    error_echo "❌ 未选择 AVD，已取消"
    exit 1
  fi
  highlight_echo "🚀 启动模拟器：$selected_avd ..."
  nohup "$ANDROID_HOME/emulator/emulator" -avd "$selected_avd" >/dev/null 2>&1 &
  info_echo "⏳ 等待模拟器启动中，请稍候..."
  for i in {1..30}; do
    if adb devices | grep -q "device$"; then
      success_echo "✅ 模拟器已就绪"
      return
    fi
    sleep 2
  done
  error_echo "❌ 模拟器启动失败，请手动检查 AVD 是否可用"
  exit 1
}

# ✅ 检测入口文件
detect_entry_file() {
  while true; do
    if [[ -f "$flutter_project_root/pubspec.yaml" && -d "$flutter_project_root/lib" ]]; then
      cd "$flutter_project_root" || exit 1
    else
      error_echo "❌ 当前目录不是 Flutter 项目根目录"
      info_echo "📍 当前目录为：$flutter_project_root"
      note_echo "📂 请拖入 Flutter 项目根目录（包含 pubspec.yaml 和 lib/）"
      read -r user_input
      user_input=${user_input//\"/}
      user_input=${user_input%/}
      if [[ -d "$user_input" && -f "$user_input/pubspec.yaml" && -d "$user_input/lib" ]]; then
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
      warn_echo "⚠️ 未找到默认入口 lib/main.dart"
      while true; do
        note_echo "📄 请手动拖入入口 Dart 文件（例如 lib/xxx.dart）："
        read -r manual_entry
        manual_entry=${manual_entry//\"/}
        if [[ -f "$manual_entry" ]]; then
          dart_entry_file="$manual_entry"
          break
        else
          error_echo "❌ 无效的 Dart 文件路径"
        fi
      done
    fi

    break
  done

  success_echo "✅ 项目目录：$flutter_project_root"
  success_echo "✅ 入口文件：$dart_entry_file"

  read -r "?🧩 输入 flavor（可选，直接回车跳过）：" FLAVOR
  read -r "?🧩 输入构建模式（debug / release / profile，默认 debug）：" BUILD_MODE
  BUILD_MODE=${BUILD_MODE:-debug}
}

# ✅  执行 flutter run
run_flutter() {
  if [[ -f "$flutter_project_root/.fvm/fvm_config.json" ]] && command -v fvm &>/dev/null; then
    flutter_cmd="fvm flutter"
    note_echo "🧩 使用 FVM 管理 Flutter 版本"
  else
    flutter_cmd="flutter"
    note_echo "🧩 使用全局 Flutter"
  fi

  note_echo "📦 自动执行：flutter pub upgrade"
  eval "$flutter_cmd pub upgrade"

  if grep -q "connectivity:" "$flutter_project_root/pubspec.yaml"; then
    if grep -q "connectivity_plus:" "$flutter_project_root/pubspec.yaml"; then
      warn_echo "⚠️ 已存在 connectivity_plus，跳过重复添加"
      sed -i '' '/^\s*connectivity[: ].*/d' "$flutter_project_root/pubspec.yaml"
    else
      highlight_echo "🔁 自动替换 connectivity → connectivity_plus"
      sed -i '' 's/^\s*connectivity:/  connectivity_plus:/g' "$flutter_project_root/pubspec.yaml"
    fi
    eval "$flutter_cmd pub get"
  fi

  start_android_emulator

  device_id=$(eval "$flutter_cmd devices" | grep -iE 'emulator|android' | awk -F '•' '{print $2}' | head -n1 | xargs)
  if [[ -z "$device_id" ]]; then
    error_echo "❌ 未找到 Android 模拟器设备（flutter devices 无匹配）"
    eval "$flutter_cmd devices"
    exit 1
  fi

  cmd="$flutter_cmd run -d $device_id -t $dart_entry_file --android-skip-build-dependency-validation"
  [[ -n "$FLAVOR" ]] && cmd+=" --flavor $FLAVOR"
  [[ "$BUILD_MODE" == "release" ]] && cmd+=" --release"
  [[ "$BUILD_MODE" == "profile" ]] && cmd+=" --profile"

  highlight_echo "🚀 执行命令：$cmd"
  eval "$cmd"

  if [[ $? -ne 0 ]]; then
    warn_echo "⚠️ 构建失败，执行自动修复流程..."
    note_echo "🧹 清除缓存 ~/.pub-cache 和本地构建产物"
    rm -rf ~/.pub-cache
    rm -rf "$flutter_project_root/.dart_tool"
    rm -rf "$flutter_project_root/build"
    eval "$flutter_cmd pub get"
    note_echo "🔁 正在重试 flutter run..."
    eval "$cmd"
  fi
}

# ==================== 主执行函数 ====================
main() {
  clear
  create_shortcut                               # 创建桌面快捷方式
  show_intro                                    # 自述信息
  fix_missing_namespace "$flutter_project_root" # 修复缺失 namespace
  detect_entry_file                             # 检测入口文件
  run_flutter                                   # 执行 flutter run
}

main "$@"
