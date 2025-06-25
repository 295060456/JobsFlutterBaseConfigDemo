#!/bin/zsh

#######################################################################
# 🛠️ 脚本功能说明：
# 1️⃣ 自动判断脚本所在目录是否为 Flutter 项目根目录（含 pubspec.lock 和 pubspec.yaml）
# 2️⃣ 若不是，则提示用户拖入 Flutter 项目根目录路径
# 3️⃣ 支持同时查询多个依赖包，包名以空格分隔（支持多空格）
# 4️⃣ 自动读取 pubspec.lock 获取实际依赖版本号
# 5️⃣ 用户直接按回车则退出
# 6️⃣ 若全部依赖未找到则要求重新输入
# 7️⃣ 查询成功后延迟 2 秒并强制关闭当前终端窗口（不影响其他终端）
#######################################################################

# 清屏
clear

echo "📦 当前脚本用于查询 Flutter 项目中某个或多个依赖包的实际使用版本（来源：pubspec.lock）"
echo "📌 输入方式：支持多个依赖包名，用空格分隔。例如：camera dio firebase_core"
echo ""

# 获取脚本目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 判断是否为 Flutter 项目目录
if [[ -f "$SCRIPT_DIR/pubspec.lock" && -f "$SCRIPT_DIR/pubspec.yaml" ]]; then
  PROJECT_DIR="$SCRIPT_DIR"
  echo "✅ 已自动识别 Flutter 项目目录：$PROJECT_DIR"
else
  echo "⚠️ 未检测到 Flutter 项目，请将包含 pubspec.lock 的 Flutter 项目目录拖入终端后回车："
  read -r user_input
  user_input=${user_input//\"/}

  if [[ ! -d "$user_input" ]]; then
    echo "❌ 错误：路径无效"
    exit 1
  fi

  if [[ ! -f "$user_input/pubspec.lock" || ! -f "$user_input/pubspec.yaml" ]]; then
    echo "❌ 错误：该目录不是有效的 Flutter 项目根目录（缺少 pubspec.lock 或 pubspec.yaml）"
    exit 1
  fi

  PROJECT_DIR="$user_input"
fi

cd "$PROJECT_DIR" || exit 1
echo "📂 项目目录切换为：$PROJECT_DIR"
echo ""

# 主循环
while true; do
  read "?📦 请输入要查询的依赖包名（多个包用空格分隔，直接回车退出）： " package_line

  # 用户直接按回车，退出
  if [[ -z "$package_line" ]]; then
    echo "👋 已退出"
    sleep 1
    osascript <<EOF
tell application "Terminal"
  if front window exists then close front window
end tell
EOF
    exit 0
  fi

  package_list=(${(z)package_line}) # 转换为空格分隔的数组

  echo ""
  echo "🔍 查询结果："
  echo "──────────────────────────────────────────────"

  all_not_found=true
  for pkg in $package_list; do
    version=$(awk "/$pkg:/{found=1} found && /version: /{print \$2; exit}" pubspec.lock)
    if [[ -n "$version" ]]; then
      printf "✅ %-25s 版本：%s\n" "$pkg" "$version"
      all_not_found=false
    else
      printf "❌ %-25s 未找到或未集成\n" "$pkg"
    fi
  done

  echo "──────────────────────────────────────────────"

  if [[ "$all_not_found" == true ]]; then
    echo ""
    echo "⚠️ 没有任何有效的依赖，请重新输入（或直接回车退出）。"
    continue
  fi

  echo ""
  echo "✅ 查询完成，窗口将自动关闭..."
  sleep 2
  osascript <<EOF
tell application "Terminal"
  if front window exists then close front window
end tell
EOF
  exit 0
done
