#!/bin/zsh
# ============================================================================
# 📱 Flutter / Dart -> iOS 模拟器 启动脚本（修正版）
# ---------------------------------------------------------------------------
# 特点：
#   • 自动识别 Flutter 根目录 / Dart 单文件入口
#   • 支持在脚本【位于项目根目录时无需拖入路径】——本次修复重点 ✅
#   • 支持拖入路径（文件或目录），自动判定
#   • 自动识别 FVM、flavor、构建模式
#   • fzf 选择 / 创建模拟器（设备 + Runtime）
#   • CocoaPods 异常自动修复（后台模式）
#   • 创建桌面快捷方式（链接到本脚本）
#   • 所有交互遵循统一规则：回车=执行 / 默认，任意键=跳过（或其它说明）
# ============================================================================

# ----------------------------- 实用函数区 ----------------------------------

# 彩色输出
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

# 解析真实绝对路径（兼容相对路径、~、空格等）
# 使用：_abs_path <path> -> echo 输出绝对路径
_abs_path() {
  local p="$1"
  [[ -z "$p" ]] && return 1
  # 去掉包裹双引号
  p="${p//\"/}"
  # 去掉末尾斜杠（不影响根 /）
  [[ "$p" != "/" ]] && p="${p%/}"
  if [[ -d "$p" ]]; then
    (cd "$p" 2>/dev/null && pwd -P)
  elif [[ -f "$p" ]]; then
    (cd "${p:h}" 2>/dev/null && printf "%s/%s\n" "$(pwd -P)" "${p:t}")
  else
    return 1
  fi
}

# 判断 Flutter 项目根目录（仅需 pubspec.yaml + lib/）
_is_flutter_project_root() {
  local p="$1"
  local abs=$(_abs_path "$p") || return 1
  [[ -f "$abs/pubspec.yaml" && -d "$abs/lib" ]]
}

# 判断 Dart 文件是否入口：支持 void/Future<void> main() [async]，忽略注释和注解
_is_dart_entry_file() {
  local f="$1"
  local abs=$(_abs_path "$f") || return 1
  [[ $abs == *.dart ]] || return 1

  # ✅ 支持 main() {...} 和 main() => ... 写法
  if grep -Ev '^\s*//' "$abs" | grep -Eq '\b(Future\s*<\s*void\s*>|void)?\s*main\s*\(\s*\)\s*(async\s*)?(\{|=>)' ; then
    return 0
  fi
  return 1
}

# ----------------------------- Banner --------------------------------------
clear
_color_echo cyan   "                                                                                       "
_color_echo cyan   "88888888888 88         88        88 888888888888 888888888888 88888888888 88888888ba   "
_color_echo cyan   "88          88         88        88      88           88      88          88      \"8b  "
_color_echo cyan   "88          88         88        88      88           88      88          88      ,8P  "
_color_echo cyan   "88aaaaa     88         88        88      88           88      88aaaaa     88aaaaaa8P'  "
_color_echo cyan   "88\"\"\"\"\"     88         88        88      88           88      88\"\"\"\"\"     88\"\"\"\"88'    "
_color_echo cyan   "88          88         88        88      88           88      88          88    \`8b    "
_color_echo cyan   "88          88         Y8a.    .a8P      88           88      88          88     \`8b   "
_color_echo cyan   "88          88888888888 \`\"Y8888Y\"'       88           88      88888888888 88      \`8b  "
_color_echo cyan   "                                                                                       "
_color_echo yellow "                        🛠️ FLUTTER iOS 模拟器 启动脚本"
printf "\n"
_color_echo green  "🛠️ 本脚本用于将 Dart 或 Flutter 项目运行到 iOS 模拟器"
_color_echo green  "===================================================================="
_color_echo green  "👉 支持："
_color_echo green  "   1. 拖入 Flutter 项目根目录（含 pubspec.yaml 和 lib/main.dart）或 Dart 单文件（含 void main）"
_color_echo green  "   2. 自动识别 FVM、构建模式、flavor 参数"
_color_echo green  "   3. 自动启动 iOS 模拟器，处理假后台问题"
_color_echo green  "   4. 支持 fzf 模拟器选择与创建（设备 + 系统组合）"
_color_echo green  "   5. flutter run 日志异常时自动修复 CocoaPods"
_color_echo green  "   6. 自动创建桌面 .command 快捷方式"
_color_echo green  "===================================================================="
_color_echo red    "📌 如需运行断点调试，请使用 VSCode / Android Studio / Xcode 等 IDE。终端运行不支持断点。"
printf "\n"

# ---------------------------------------------------------------------------
# 获取脚本自身绝对路径（用于桌面快捷方式）
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd -P)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"

# ---------------------------------------------------------------------------
# 入口识别：支持三种情况
#   A. 用户拖入路径（目录 / 文件）并回车
#   B. 用户直接回车（空输入）=> 若脚本所在目录是 Flutter 根目录则自动使用
#   C. 用户拖入 Dart 单文件
# ---------------------------------------------------------------------------
entry_file=""
flutter_root=""

while true; do
  _color_echo yellow "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径："
  read -r user_input
  user_input="${user_input//\"/}"          # 去掉引号
  user_input="${user_input%/}"              # 去尾斜杠

  # 用户直接回车：尝试脚本所在目录
  if [[ -z "$user_input" ]]; then
    if _is_flutter_project_root "$SCRIPT_DIR"; then
      flutter_root=$(_abs_path "$SCRIPT_DIR")
      entry_file="$flutter_root/lib/main.dart"
      _color_echo cyan "🎯 检测到脚本所在目录即 Flutter 根目录，自动使用。"
      break
    else
      _color_echo red "❌ 未检测到有效路径（脚本目录不是 Flutter 根）。请重新拖入。"
      continue
    fi
  fi

  if [[ -d "$user_input" ]]; then
    if _is_flutter_project_root "$user_input"; then
      flutter_root=$(_abs_path "$user_input")
      entry_file="$flutter_root/lib/main.dart"
      break
    fi
  elif [[ -f "$user_input" ]]; then
    if _is_dart_entry_file "$user_input"; then
      entry_file=$(_abs_path "$user_input")
      flutter_root="${entry_file:h}"
      break
    fi
  fi

  _color_echo red "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
 done

cd "$flutter_root" || { _color_echo red "无法进入项目目录：$flutter_root"; exit 1; }
_color_echo green "✅ 项目路径：$flutter_root"
_color_echo green "🎯 入口文件：$entry_file"

# ---------------------------------------------------------------------------
# 构建参数
# ---------------------------------------------------------------------------
printf "\n"
_color_echo blue "🌶️ 请输入构建的 flavor 名称（回车=无 --flavor）："
read -r flavor
if [[ -n "$flavor" ]]; then
  flavor_args=(--flavor "$flavor")
else
  flavor_args=()
fi

printf "\n"
_color_echo blue "🚧 请选择构建模式（debug / release / profile，默认 debug）："
read -r build_mode
build_mode="${build_mode:-debug}"

# ---------------------------------------------------------------------------
# FVM 检测
# ---------------------------------------------------------------------------
if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
  _color_echo yellow "🧩 检测到 FVM，将使用 fvm flutter。"
  flutter_cmd=(fvm flutter)
else
  flutter_cmd=(flutter)
fi

# ---------------------------------------------------------------------------
# pub get（统一交互：回车=执行，任意键=跳过）
# ---------------------------------------------------------------------------
read '?📦 执行 flutter pub get？(回车=执行 / 任意键=跳过) ' run_get
if [[ -z "$run_get" ]]; then
  "${flutter_cmd[@]}" pub get
else
  _color_echo yellow "⏭️ 跳过 pub get。"
fi

# ---------------------------------------------------------------------------
# 模拟器彻底关闭（防假后台）
# ---------------------------------------------------------------------------
_color_echo yellow "🛑 正在彻底关闭所有 iOS 模拟器..."
xcrun simctl shutdown all >/dev/null 2>&1
osascript -e 'quit app "Simulator"' >/dev/null 2>&1
sleep 1
if pgrep -f Simulator >/dev/null 2>&1; then
  pkill -f Simulator >/dev/null 2>&1
  _color_echo green "✅ 已彻底关闭模拟器。"
else
  _color_echo green "✅ 模拟器已关闭。"
fi

# ---------------------------------------------------------------------------
# 重启模拟器（回车=打开 / 任意键=跳过）
# ---------------------------------------------------------------------------
read '?📱 按回车重新打开 iOS 模拟器，任意键=跳过： ' sim_input
if [[ -z "$sim_input" ]]; then
  open -a Simulator && _color_echo green "✅ iOS 模拟器已重新打开。"
else
  _color_echo yellow "⏭️ 已跳过打开模拟器。"
fi

# ---------------------------------------------------------------------------
# 交互：fzf 创建模拟器
# 注意：create_simulator_with_fzf 仅输出最后一行 "<name>|<id>" 供解析
# ---------------------------------------------------------------------------
create_simulator_with_fzf() {
  # 设备类型列表
  _color_echo blue "📦 获取可用设备类型..." >&2
  local device_options
  device_options=(${(@f)$(xcrun simctl list devicetypes 2>/dev/null | grep '^iPhone' | sed -E 's/^(.+) \((.+)\)$/📱 \1|\2/')})
  [[ ${#device_options[@]} -eq 0 ]] && { _color_echo red "❌ 未找到可用设备类型" >&2; return 1; }

  local selected_device_display selected_device_id
  selected_device_display=$(printf '%s\n' "${device_options[@]}" | cut -d'|' -f1 | fzf --prompt='👉 选择设备型号 > ' --height=40% --reverse)
  [[ -z "$selected_device_display" ]] && { _color_echo yellow "⚠️ 未选择设备" >&2; return 1; }

  for entry in "${device_options[@]}"; do
    local name="${entry%%|*}" id="${entry##*|}"
    [[ "$name" == "$selected_device_display" ]] && selected_device_id="$id" && break
  done
  [[ -z "$selected_device_id" ]] && { _color_echo red "❌ 无法匹配设备标识符" >&2; return 1; }
  _color_echo green "✅ 你选择的设备是：$selected_device_display" >&2
  _color_echo green "🔗 对应设备 ID：$selected_device_id" >&2

  # Runtime 列表
  _color_echo blue "🧬 获取可用 iOS Runtime..." >&2
  local runtime_options
  runtime_options=(${(@f)$(xcrun simctl list runtimes 2>/dev/null | grep 'iOS' | grep -v 'unavailable' | sed -En 's/^.*(iOS [0-9.]+) \([^)]+\) - (com\.apple\.CoreSimulator\.SimRuntime\.[^)]+).*$/🧬 \1|\2/p')})
  [[ ${#runtime_options[@]} -eq 0 ]] && { _color_echo red "❌ 未找到可用 Runtime" >&2; return 1; }

  local selected_runtime_display selected_runtime_id
  selected_runtime_display=$(printf '%s\n' "${runtime_options[@]}" | cut -d'|' -f1 | fzf --prompt='👉 选择系统版本 > ' --height=40% --reverse)
  [[ -z "$selected_runtime_display" ]] && { _color_echo yellow "⚠️ 未选择系统版本" >&2; return 1; }

  for entry in "${runtime_options[@]}"; do
    local name="${entry%%|*}" id="${entry##*|}"
    [[ "$name" == "$selected_runtime_display" ]] && selected_runtime_id="$id" && break
  done
  [[ -z "$selected_runtime_id" ]] && { _color_echo red "❌ 无法匹配系统版本标识符" >&2; return 1; }
  _color_echo green "🧬 你选择的系统版本是：$selected_runtime_display" >&2
  _color_echo green "🔗 对应 Runtime ID：$selected_runtime_id" >&2

  # 创建模拟器
  local sim_name="MySim_$(date +%s | tail -c 6)"
  _color_echo blue "🚀 正在创建模拟器 $sim_name ..." >&2
  _color_echo cyan "📤 执行命令：xcrun simctl create \"$sim_name\" \"$selected_device_id\" \"$selected_runtime_id\"" >&2
  local sim_id
  sim_id=$(xcrun simctl create "$sim_name" "$selected_device_id" "$selected_runtime_id" 2>/dev/null)
  if [[ -z "$sim_id" ]]; then
    _color_echo red "❌ 模拟器创建失败" >&2
    return 1
  fi

  _color_echo green "✅ 模拟器创建成功：$sim_name" >&2
  _color_echo green "🆔 模拟器 ID：$sim_id" >&2
  _color_echo yellow "🚀 正在启动模拟器 $sim_name ..." >&2
  xcrun simctl boot "$sim_id" >/dev/null 2>&1
  open -a Simulator >/dev/null 2>&1

  # 只输出解析行（stdout）
  echo "$sim_name|$sim_id"
}

# ---------------------------------------------------------------------------
# 模拟器检测 & 条件创建
# ---------------------------------------------------------------------------
sim_name=""
sim_id=""
device_list=$("${flutter_cmd[@]}" devices | grep -i 'simulator')
try_count=0
max_try=3

while [[ $try_count -lt $max_try ]]; do
  device_list=$("${flutter_cmd[@]}" devices | grep -i 'simulator')
  if [[ -n "$device_list" ]]; then
    break
  fi
  _color_echo yellow "⚠️ 未检测到模拟器（尝试第 $((try_count+1)) 次）"
  printf '❓ 是否创建模拟器？输入 y 或 Y 回车创建，其它任意键跳过等待：'
  read -r user_input
  if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
    result=$(create_simulator_with_fzf | tail -n1)
    sim_name="${result%%|*}"; sim_id="${result##*|}"
    break
  fi
  _color_echo cyan "⏳ 等待模拟器加载中..."
  sleep 2
  ((try_count++))
 done

if [[ -z "$device_list" && -z "$sim_id" ]]; then
  _color_echo red "⏱️ 自动进入创建流程..."
  result=$(create_simulator_with_fzf | tail -n1)
  sim_name="${result%%|*}"; sim_id="${result##*|}"
fi

# ---------------------------------------------------------------------------
# 若没有通过创建得到 sim_id，则让用户从 flutter devices 列表中选
# ---------------------------------------------------------------------------
if [[ -z "$sim_id" ]]; then
  formatted_devices=()
  while IFS= read -r line; do
    local_name=$(echo "$line" | awk -F '•' '{print $1}' | xargs)
    local_id=$(echo   "$line" | awk -F '•' '{print $2}' | xargs)
    formatted_devices+=("$local_name（$local_id）")
  done <<< "$device_list"

  selected_entry=$(printf '%s\n' "${formatted_devices[@]}" | fzf --prompt='👉 选择模拟器 > ')
  [[ -z "$selected_entry" ]] && { _color_echo red "❌ 未选择设备，退出"; exit 1; }
  sim_name="${selected_entry%%（*}";
  sim_id="${selected_entry##*（}"; sim_id="${sim_id%）}"
fi

# ---------------------------------------------------------------------------
# flutter run（前台 / 后台）
# ---------------------------------------------------------------------------
run_args=(run -d "$sim_id" -t "$entry_file" --$build_mode "${flavor_args[@]}")
_color_echo green "🚀 启动到模拟器：$sim_name ($sim_id)"
read '?🎯 是否后台运行 flutter run？(回车=前台 / 任意键=后台) ' run_mode_input

if [[ -z "$run_mode_input" ]]; then
  "${flutter_cmd[@]}" "${run_args[@]}"
else
  "${flutter_cmd[@]}" "${run_args[@]}" > /tmp/flutter_run_log.txt 2>&1 &
  sleep 5
  _color_echo green "✅ Flutter run 已在后台运行。日志：/tmp/flutter_run_log.txt"

  if grep -q 'CocoaPods' /tmp/flutter_run_log.txt || grep -q 'Error' /tmp/flutter_run_log.txt; then
    _color_echo yellow "⚠️ 检测到 CocoaPods 异常，尝试自动修复..."
    if ! command -v pod >/dev/null 2>&1; then
      _color_echo red "❌ 未安装 CocoaPods：请执行 sudo gem install cocoapods"
      exit 1
    fi
    rm -rf ios/Pods ios/Podfile.lock
    (cd ios && pod repo update && pod install)
    _color_echo yellow "♻️ 正在重新 flutter run（后台）..."
    "${flutter_cmd[@]}" "${run_args[@]}" > /tmp/flutter_run_log.txt 2>&1 &
    sleep 5
  fi
fi

# ---------------------------------------------------------------------------
# 创建桌面快捷方式（指向本脚本）
# ---------------------------------------------------------------------------
project_name=$(grep -m1 '^name:' "$flutter_root/pubspec.yaml" | awk '{print $2}')
[[ -z "$project_name" ]] && project_name="FlutterProject"

desktop_path="$HOME/Desktop"
shortcut_path="$desktop_path/${project_name}.command"
count=1
while [[ -e "$shortcut_path" ]]; do
  shortcut_path="$desktop_path/${project_name} ($count).command"
  ((count++))
 done

# 确保桌面目录存在
mkdir -p "$desktop_path" 2>/dev/null

if [[ ! -L "$shortcut_path" || "$(readlink "$shortcut_path" 2>/dev/null)" != "$SCRIPT_PATH" ]]; then
  ln -sf "$SCRIPT_PATH" "$shortcut_path"
  chmod +x "$shortcut_path"
  _color_echo green "✅ 已创建桌面快捷方式：$shortcut_path"
else
  _color_echo yellow "⚠️ 快捷方式已存在，跳过创建。"
fi

exit 0
