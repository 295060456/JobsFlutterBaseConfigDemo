#!/bin/zsh

# ✅ 彩色输出函数
_color_echo() {
  local color="$1"
  local text="$2"
  case "$color" in
    green) echo "\033[32m$text\033[0m" ;;
    red) echo "\033[31m$text\033[0m" ;;
    yellow) echo "\033[33m$text\033[0m" ;;
    blue) echo "\033[34m$text\033[0m" ;;
    cyan) echo "\033[36m$text\033[0m" ;;
    *) echo "$text" ;;
  esac
}

# ✅ 开头 Logo（Flutter 飞鸟图标）
_color_echo cyan "                                                                                       "
_color_echo cyan "88888888888 88         88        88 888888888888 888888888888 88888888888 88888888ba   "
_color_echo cyan "88          88         88        88      88           88      88          88      \"8b  "
_color_echo cyan "88          88         88        88      88           88      88          88      ,8P  "
_color_echo cyan "88aaaaa     88         88        88      88           88      88aaaaa     88aaaaaa8P'  "
_color_echo cyan "88\"\"\"\"\"     88         88        88      88           88      88\"\"\"\"\"     88\"\"\"\"88'    "
_color_echo cyan "88          88         88        88      88           88      88          88    \`8b    "
_color_echo cyan "88          88         Y8a.    .a8P      88           88      88          88     \`8b   "
_color_echo cyan "88          88888888888 \`\"Y8888Y\"'       88           88      88888888888 88      \`8b  "
_color_echo cyan "                                                                                       "
_color_echo yellow "                        🛠️ FLUTTER iOS 模拟器 启动脚本"
echo ""

# ✅ 自述
clear
_color_echo green "🛠️ 本脚本用于将 Dart 或 Flutter 项目运行到 iOS 模拟器"
_color_echo green "===================================================================="
_color_echo green "👉 支持："
_color_echo green "   1. 拖入 Flutter 项目根目录（含 pubspec.yaml 和 lib/main.dart）或 Dart 单文件（含 void main）"
_color_echo green "   2. 自动识别 FVM、构建模式、flavor 参数"
_color_echo green "   3. 自动启动 iOS 模拟器，处理假后台问题"
_color_echo green "   4. 支持 fzf 模拟器选择与创建（设备 + 系统组合）"
_color_echo green "   5. flutter run 日志异常时自动修复 CocoaPods"
_color_echo green "   6. 自动创建桌面 .command 快捷方式"
_color_echo green "===================================================================="
_color_echo red   "📌 如需运行断点调试，请移步 VSCode / Android Studio / Xcode 等 IDE，终端运行不支持断点功能。"
echo ""

# ✅ 项目路径判断
script_path="$0"
script_dir="$(cd "$(dirname "$0")" && pwd)"

is_flutter_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

flutter_root="$script_dir"
cd "$flutter_root" || exit 1

while ! is_flutter_root "$flutter_root"; do
  _color_echo yellow "⚠️ 当前目录不是 Flutter 项目根目录"
  echo "📂 请拖入 Flutter 项目根目录（必须包含 pubspec.yaml 和 lib/）："
  read -r user_input
  user_input=${user_input//\"/}
  flutter_root="$user_input"
done

cd "$flutter_root" || exit 1
_color_echo green "✅ 已识别 Flutter 项目根目录：$flutter_root"

# ✅ main.dart 检查
entry_file="$flutter_root/lib/main.dart"
[[ ! -f "$entry_file" ]] && _color_echo red "❌ 缺少 lib/main.dart" && exit 1

if ! grep -E '^\s*void\s+main\s*\(\s*\)' "$entry_file" | grep -v '^\s*//' >/dev/null; then
  _color_echo red "❌ lib/main.dart 中未检测到未被注释的 void main()"
  exit 1
fi

# ✅ 构建参数
echo ""
_color_echo blue "🌶️ 请输入构建的 flavor 名称（留空表示无 --flavor 参数）："
read -r flavor
[[ -n "$flavor" ]] && flavor_param="--flavor $flavor" || flavor_param=""

echo ""
_color_echo blue "🚧 请选择构建模式（debug / release / profile，默认 debug）："
read -r build_mode
build_mode="${build_mode:-debug}"

# ✅ FVM 检测
flutter_cmd="flutter"
[[ -f "$flutter_root/.fvm/fvm_config.json" ]] && flutter_cmd="fvm flutter" && _color_echo yellow "🧩 使用 FVM"

# ✅ pub get
read "?📦 是否执行 flutter pub get？[空格+回车=执行, 回车=跳过] " run_get
[[ "$run_get" =~ " " ]] && $flutter_cmd pub get

# ✅ 模拟器彻底关闭
_color_echo yellow "🛑 正在彻底关闭所有 iOS 模拟器..."
xcrun simctl shutdown all >/dev/null 2>&1
osascript -e 'quit app "Simulator"' >/dev/null 2>&1
sleep 1
pgrep -f Simulator >/dev/null && pkill -f Simulator && _color_echo green "✅ 已彻底关闭模拟器" || _color_echo green "✅ 模拟器已关闭"

# ✅ 重启模拟器
read "?📱 按回车重新打开 iOS 模拟器，输入任意内容后回车跳过：" sim_input
[[ -z "$sim_input" ]] && open -a Simulator && _color_echo green "✅ iOS 模拟器已重新打开" || _color_echo yellow "⏭️ 已跳过打开模拟器"

# ✅ 自动创建模拟器
create_simulator_with_fzf() {
  _color_echo blue "📦 获取可用设备类型..."

  # 获取所有 iPhone 设备类型（显示名 | identifier）
  local device_options=("${(@f)$(xcrun simctl list devicetypes |
    grep '^iPhone' |
    sed -E 's/^(.+) \((.+)\)$/📱 \1|\2/')}")

  [[ ${#device_options[@]} -eq 0 ]] && _color_echo red "❌ 未找到可用设备类型" && return 1

  # fzf 选择设备
  local selected_device_display=$(printf "%s\n" "${device_options[@]}" |
    cut -d'|' -f1 |
    fzf --prompt="👉 选择设备型号 > " --height=40% --reverse)

  [[ -z "$selected_device_display" ]] && _color_echo yellow "⚠️ 未选择设备" && return 1

  # 获取设备 identifier
  local selected_device_id=""
  for entry in "${device_options[@]}"; do
    local name="${entry%%|*}"
    local id="${entry##*|}"
    [[ "$name" == "$selected_device_display" ]] && selected_device_id="$id" && break
  done

  [[ -z "$selected_device_id" ]] && _color_echo red "❌ 无法匹配设备标识符" && return 1

  _color_echo green "✅ 你选择的设备是：$selected_device_display"
  _color_echo green "🔗 对应设备 ID：$selected_device_id"
  echo ""

  # ================== Runtime ==================
  _color_echo blue "🧬 获取可用 iOS Runtime..."

  local runtime_options=("${(@f)$(xcrun simctl list runtimes |
    grep "iOS" |
    grep -v "unavailable" |
    sed -En 's/^.*(iOS [0-9.]+) \([^)]+\) - (com\.apple\.CoreSimulator\.SimRuntime\.[^)]+).*$/🧬 \1|\2/p')}")

  [[ ${#runtime_options[@]} -eq 0 ]] && _color_echo red "❌ 未找到可用 Runtime" && return 1

  # fzf 选择 Runtime
  local selected_runtime_display=$(printf "%s\n" "${runtime_options[@]}" |
    cut -d'|' -f1 |
    fzf --prompt="👉 选择系统版本 > " --height=40% --reverse)

  [[ -z "$selected_runtime_display" ]] && _color_echo yellow "⚠️ 未选择系统版本" && return 1

  # 获取 Runtime identifier
  local selected_runtime_id=""
  for entry in "${runtime_options[@]}"; do
    local name="${entry%%|*}"
    local id="${entry##*|}"
    [[ "$name" == "$selected_runtime_display" ]] && selected_runtime_id="$id" && break
  done

  [[ -z "$selected_runtime_id" ]] && _color_echo red "❌ 无法匹配系统版本标识符" && return 1

  _color_echo green "🧬 你选择的系统版本是：$selected_runtime_display"
  _color_echo green "🔗 对应 Runtime ID：$selected_runtime_id"
  echo ""

# ================== 创建模拟器 ==================
    local sim_name="MySim_$(date +%s | tail -c 6)"
    _color_echo blue "🚀 正在创建模拟器 $sim_name ..."
    echo ""
    _color_echo cyan "📤 执行命令：xcrun simctl create \"$sim_name\" \"$selected_device_id\" \"$selected_runtime_id\""

    # ✅ 正确：create 成功会返回设备 ID
    local sim_id=$(xcrun simctl create "$sim_name" "$selected_device_id" "$selected_runtime_id" 2>/dev/null)

    if [[ -z "$sim_id" ]]; then
      _color_echo red "❌ 模拟器创建失败"
      return 1
    fi

    _color_echo green "✅ 模拟器创建成功：$sim_name"
    _color_echo green "🆔 模拟器 ID：$sim_id"

    # ✅ Boot 模拟器
    _color_echo yellow "🚀 正在启动模拟器 $sim_name ..."
    xcrun simctl boot "$sim_id" >/dev/null 2>&1

    # ✅ 打开 Simulator.app
    open -a Simulator

    # ✅ 返回模拟器信息
    echo "$sim_name|$sim_id"
}

# ✅ 模拟器检测与创建
sim_name=""
sim_id=""
device_list=$($flutter_cmd devices | grep -i "simulator")
try_count=0
max_try=3

try_count=0
max_try=3

while [[ $try_count -lt $max_try ]]; do
  device_list=$($flutter_cmd devices | grep -i "simulator")
  [[ -n "$device_list" ]] && break

  _color_echo yellow "⚠️ 未检测到模拟器（尝试第 $((try_count+1)) 次）"
  echo "❓ 是否创建模拟器？输入 y 或 Y 回车创建，其它任意键跳过等待："
  read -r user_input
  if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
    result=$(create_simulator_with_fzf)
    sim_name="${result%%|*}"
    sim_id="${result##*|}"
    break
  fi

  _color_echo cyan "⏳ 等待模拟器加载中..."
  sleep 2
  ((try_count++))
done

if [[ -z "$device_list" && -z "$sim_id" ]]; then
  _color_echo red "⏱️ 自动进入创建流程..."
  result=$(create_simulator_with_fzf)
  sim_name="${result%%|*}"
  sim_id="${result##*|}"
fi

# ✅ 若未设置 sim_id，则手动选择
if [[ -z "$sim_id" ]]; then
  formatted_devices=()
  while IFS= read -r line; do
    name=$(echo "$line" | awk -F '•' '{print $1}' | xargs)
    id=$(echo "$line" | awk -F '•' '{print $2}' | xargs)
    formatted_devices+=("$name（$id）")
  done <<< "$device_list"

  selected_entry=$(printf "%s\n" "${formatted_devices[@]}" | fzf --prompt="👉 选择模拟器 > ")
  [[ -z "$selected_entry" ]] && _color_echo red "❌ 未选择设备，退出" && exit 1

  sim_name="${selected_entry%%（*}"
  sim_id="${selected_entry##*（}"
  sim_id="${sim_id%）}"
fi

# ✅ flutter run 构建并运行
run_cmd="$flutter_cmd run -d \"$sim_id\" -t \"$entry_file\" --$build_mode $flavor_param"

_color_echo green "🚀 启动到模拟器：$sim_name ($sim_id)"
_color_echo blue "🎯 是否后台运行 flutter run？回车=前台，输入任意字符+回车=后台："
read -r run_mode_input

if [[ -z "$run_mode_input" ]]; then
  eval $run_cmd
else
  eval $run_cmd > /tmp/flutter_run_log.txt 2>&1 &
  sleep 5
  _color_echo green "✅ Flutter run 已在后台运行"

  if grep -q "CocoaPods" /tmp/flutter_run_log.txt || grep -q "Error" /tmp/flutter_run_log.txt; then
    _color_echo yellow "⚠️ 检测到 CocoaPods 异常，尝试自动修复..."
    command -v pod &>/dev/null || {
      _color_echo red "❌ 未安装 CocoaPods：sudo gem install cocoapods"
      exit 1
    }

    rm -rf ios/Pods ios/Podfile.lock
    cd ios || exit 1
    pod repo update && pod install
    cd .. || exit 1

    _color_echo yellow "♻️ 正在重新 flutter run（后台）..."
    eval $run_cmd > /tmp/flutter_run_log.txt 2>&1 &
    sleep 5
  fi
fi

# ✅ 创建桌面快捷方式
project_name=$(grep -m1 '^name:' "$flutter_root/pubspec.yaml" | awk '{print $2}')
desktop_path="$HOME/Desktop"
shortcut_path="$desktop_path/${project_name}.command"
count=1
while [[ -e "$shortcut_path" ]]; do
  shortcut_path="$desktop_path/${project_name} ($count).command"
  ((count++))
done

if [[ ! -L "$shortcut_path" || "$(readlink "$shortcut_path")" != "$script_path" ]]; then
  ln -s "$script_path" "$shortcut_path"
  chmod +x "$shortcut_path"
  _color_echo green "✅ 已创建桌面快捷方式：$shortcut_path"
else
  _color_echo yellow "⚠️ 快捷方式已存在，跳过创建"
fi
