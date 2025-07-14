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
_color_echo cyan "                                                                                       "
_color_echo yellow "                        🛠️ FLUTTER iOS 模拟器 启动脚本"

#!/bin/zsh

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
echo ""

# ✅ 获取脚本路径
script_path="$0"
script_dir="$(cd "$(dirname "$0")" && pwd)"

# ✅ 判断是否为 Flutter 项目根目录
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

# ✅ 默认入口文件
entry_file="$flutter_root/lib/main.dart"
[[ ! -f "$entry_file" ]] && _color_echo red "❌ 缺少 lib/main.dart" && exit 1

# ✅ 检查 lib/main.dart 是否含未注释的 void main()
if ! grep -E '^\s*void\s+main\s*\(\s*\)' "$entry_file" | grep -v '^\s*//' >/dev/null; then
  _color_echo red "❌ lib/main.dart 中未检测到未被注释的 void main()，无法作为入口"
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

# ✅ FVM 支持
flutter_cmd="flutter"
[[ -f "$flutter_root/.fvm/fvm_config.json" ]] && flutter_cmd="fvm flutter" && _color_echo yellow "🧩 使用 FVM"

# ✅ 是否执行 pub get
read "?📦 是否执行 flutter pub get？[空格+回车=执行, 回车=跳过] " run_get
[[ "$run_get" =~ " " ]] && $flutter_cmd pub get

# ✅ 关闭假后台模拟器
_color_echo yellow "🛑 正在彻底关闭所有 iOS 模拟器..."
xcrun simctl shutdown all >/dev/null 2>&1
osascript -e 'quit app "Simulator"' >/dev/null 2>&1
sleep 1
pgrep -f Simulator >/dev/null && pkill -f Simulator && _color_echo green "✅ 已彻底关闭模拟器" || _color_echo green "✅ 模拟器已关闭"

# ✅ 重启模拟器
read "?📱 按回车重新打开 iOS 模拟器，输入任意内容后回车跳过：" sim_input
[[ -z "$sim_input" ]] && open -a Simulator && _color_echo green "✅ iOS 模拟器已重新打开" || _color_echo yellow "⏭️ 已跳过打开模拟器"

# ✅ 等待模拟器设备
booted_sim=""
for i in {1..15}; do
  booted_sim=$(xcrun simctl list devices booted | grep "iPhone")
  [[ -n "$booted_sim" ]] && break
  sleep 1
done

device_list=$($flutter_cmd devices | grep -i "simulator")
should_create_simulator=false

while [[ -z "$device_list" ]]; do
  _color_echo yellow "⚠️ 未检测到模拟器，可能尚未加载完毕..."
  echo "🔄 【回车】继续等待设备加载，或【输入任意字符+回车】进入模拟器创建流程："
  read -r user_input
  if [[ -z "$user_input" ]]; then
    _color_echo blue "⏳ 等待中..."
    sleep 2
    device_list=$($flutter_cmd devices | grep -i "simulator")
  else
    should_create_simulator=true
    break
  fi
done

# ✅ 模拟器选择
formatted_devices=()
while IFS= read -r line; do
  name=$(echo "$line" | awk -F '•' '{print $1}' | xargs)
  id=$(echo "$line" | awk -F '•' '{print $2}' | xargs)
  formatted_devices+=("$name（$id）")
done <<< "$device_list"

if [[ ${#formatted_devices[@]} -eq 1 ]]; then
  selected_entry="${formatted_devices[1]}"
else
  selected_entry=$(printf "%s\n" "${formatted_devices[@]}" | fzf --prompt="👉 选择模拟器 > ")
  [[ -z "$selected_entry" ]] && _color_echo red "❌ 未选择设备，退出" && exit 1
fi

sim_name="${selected_entry%%（*}"
sim_id="${selected_entry##*（}"
sim_id="${sim_id%）}"

# ✅ 构建 flutter run 命令
run_cmd="$flutter_cmd run -d \"$sim_id\" -t \"$entry_file\" --$build_mode $flavor_param"

_color_echo green "🚀 启动到模拟器：$sim_name ($sim_id)"
_color_echo blue "🎯 是否后台运行 flutter run？直接回车 = 前台运行，输入任意字符 + 回车 = 后台运行："
read -r run_mode_input

if [[ -z "$run_mode_input" ]]; then
  _color_echo green "🚀 正在以【前台模式】运行 flutter run..."
  eval $run_cmd
else
  _color_echo green "🚀 正在以【后台模式】运行 flutter run..."
  eval $run_cmd > /tmp/flutter_run_log.txt 2>&1 &
  sleep 5
  _color_echo green "✅ Flutter run 已在后台运行，日志保存至：/tmp/flutter_run_log.txt"

  # ✅ 若日志中检测到异常自动修复 CocoaPods 并重试
  if grep -q "CocoaPods" /tmp/flutter_run_log.txt || grep -q "Error" /tmp/flutter_run_log.txt; then
    _color_echo yellow "⚠️ flutter run 日志检测到异常，尝试自动修复 CocoaPods..."

    if ! command -v pod &>/dev/null; then
      _color_echo red "❌ 未安装 CocoaPods，请运行：sudo gem install cocoapods"
      exit 1
    fi

    _color_echo blue "🧹 删除 Pods 和 Podfile.lock..."
    rm -rf ios/Pods ios/Podfile.lock

    cd ios || exit 1
    _color_echo blue "📦 更新 CocoaPods 仓库..."
    pod repo update
    _color_echo blue "📦 执行 pod install..."
    pod install
    cd .. || exit 1

    _color_echo yellow "♻️ 正在重新 flutter run（后台）..."
    eval $run_cmd > /tmp/flutter_run_log.txt 2>&1 &
    sleep 5
    _color_echo green "✅ 已重新 flutter run（后台）"
  fi
fi

# ✅ 创建桌面快捷方式（只要没有就创建）
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
  _color_echo yellow "⚠️ 快捷方式已存在且已指向此脚本，跳过创建"
fi
