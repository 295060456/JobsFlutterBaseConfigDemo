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
    *) echo "$text" ;;
  esac
}

echo "🛠️ 本脚本用于将 Dart 文件运行到 iOS 模拟器"
echo "👉 支持任意目录执行，自动识别 Flutter 项目路径"
echo "👉 支持 flavor / build 模式选择"
echo "👉 自动创建 iOS 模拟器 + 修复 CocoaPods + 创建桌面快捷方式"
echo ""

# ✅ 获取脚本路径
script_path="$0"
script_dir="$(cd "$(dirname "$0")" && pwd)"

# ✅ 判断是否为 Flutter 项目根目录
is_flutter_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ✅ 强制脚本从自身路径开始判断
flutter_root="$(cd "$(dirname "$0")" && pwd)"
cd "$flutter_root" || exit 1

until is_flutter_root "$flutter_root"; do
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

# ✅ 获取模拟器列表
_color_echo blue "🔍 正在获取 iOS 模拟器..."
device_list=$($flutter_cmd devices | grep -i "simulator")

# ✅ 如果无模拟器，自动创建
if [[ -z "$device_list" ]]; then
  _color_echo yellow "⚠️ 未检测到 iOS 模拟器，正在初始化..."

  if ! command -v brew &>/dev/null; then
    _color_echo red "🍺 安装 Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
  fi

  if ! command -v fzf &>/dev/null; then
    _color_echo yellow "🔧 安装 fzf..."
    brew install fzf || exit 1
  fi

  _color_echo blue "🧹 清理无效模拟器..."
  for id in $(xcrun simctl list devices | grep -i "unavailable" | grep -oE '[A-F0-9\-]{36}'); do
    xcrun simctl delete "$id"
  done

  device_types=("${(@f)$(xcrun simctl list devicetypes | grep 'iPhone' | sed -E 's/^(.*) \((.*)\)/\2|\1/')}")
  runtimes=("${(@f)$(xcrun simctl list runtimes | grep 'iOS' | grep -v 'unavailable' | grep -v '(null)' | sed -E 's/^(.*) \((.*)\) - (.*)/\3|\1 (\2)/')}")

  combos=()
  for d in "${device_types[@]}"; do
    for r in "${runtimes[@]}"; do
      combos+=("${d}+${r}")
    done
  done

  selected=$(printf "%s\n" "${combos[@]}" | awk -F'[|+]' '{printf "%-25s | %-35s [%s + %s]\n", $2, $4, $1, $3}' | tac | fzf --height=40% --prompt="👉 选择要创建的模拟器: ")
  [[ -z "$selected" ]] && _color_echo red "❌ 未选择，退出" && exit 1

  device_type_id=$(echo "$selected" | sed -E 's/.*\[(.*) \+ (.*)\]/\1/')
  runtime_id=$(echo "$selected" | sed -E 's/.*\[(.*) \+ (.*)\]/\2/')
  device_name=$(echo "$selected" | cut -d '|' -f1 | awk '{$1=$1};1')

  _color_echo yellow "🛑 正在关闭所有模拟器..."
  xcrun simctl shutdown all

  sim_id=$(xcrun simctl create "$device_name" "$device_type_id" "$runtime_id")
  [[ -z "$sim_id" ]] && _color_echo red "❌ 创建失败" && exit 1

  open -a Simulator
  sleep 3
  xcrun simctl boot "$sim_id" 2>/tmp/sim_boot_log.txt

  if grep -q "Unable to boot" /tmp/sim_boot_log.txt; then
    xcrun simctl delete "$sim_id"
    _color_echo red "❌ 启动失败，模拟器无效，已删除"
    exit 1
  fi

  _color_echo green "✅ 模拟器已创建并启动"
  device_list=$($flutter_cmd devices | grep -i "simulator")
fi

# ✅ 选择模拟器
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

# ✅ 执行 flutter run
_color_echo green "🚀 启动到模拟器：$sim_name ($sim_id)"
run_cmd="$flutter_cmd run -d \"$sim_id\" -t \"$entry_file\" --$build_mode $flavor_param"
eval $run_cmd
run_status=$?

# ✅ 若失败则修复 CocoaPods 后重试
if [[ $run_status -ne 0 ]]; then
  _color_echo yellow "⚠️ flutter run 失败，尝试修复 CocoaPods..."

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

  _color_echo yellow "♻️ 重新尝试 flutter run..."
  eval $run_cmd
fi

# ✅ 创建桌面快捷方式
_color_echo blue "📎 正在为脚本创建桌面快捷方式..."
desktop_path="$HOME/Desktop"
project_name=$(grep -m1 '^name:' "$flutter_root/pubspec.yaml" | awk '{print $2}')
shortcut_name="${project_name}.command"
shortcut_path="$desktop_path/$shortcut_name"

if [[ -e "$shortcut_path" ]]; then
  _color_echo yellow "⚠️ 桌面已存在同名快捷方式：$shortcut_name，将跳过创建"
else
  ln -s "$script_path" "$shortcut_path"
  chmod +x "$shortcut_path"
  _color_echo green "✅ 已创建桌面快捷方式：$shortcut_path"
fi
