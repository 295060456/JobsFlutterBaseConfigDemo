#!/bin/zsh

set -euo pipefail

# ✅ 彩色输出
print_green()  { echo -e "\033[1;32m$1\033[0m"; }
print_red()    { echo -e "\033[1;31m$1\033[0m"; }
print_yellow() { echo -e "\033[1;33m$1\033[0m"; }

clear
print_green "🧹 Flutter 清理工具 - 脚本功能说明："
print_green "• 在任意目录运行，判断是否为 Flutter 项目"
print_green "• 提供通用清理项（无项目也可执行）"
print_green "• 支持拖入 Flutter 项目路径后进入项目专属清理菜单"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 判断路径是否为 Flutter 项目（含 pubspec.yaml 和 lib/）
is_flutter_project() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ✅ 展示系统级清理菜单（与项目无关）
show_global_menu() {
  CHOICE=$(cat <<EOF | fzf --prompt="📌 请选择要执行的系统清理操作：" --height=15 --border --reverse
【清除 Pub 缓存】rm -rf ~/.pub-cache/*
【清除 Android 缓存】rm -rf ~/.gradle
【修复依赖缓存】flutter pub cache repair
【加载 Flutter 项目】拖入 pubspec.yaml 所在路径
EOF
  )

  [[ -z "$CHOICE" ]] && print_red "❌ 已取消操作" && exit 0
  echo ""
  print_green "▶️ 正在执行：$CHOICE"

  case "$CHOICE" in
    "【清除 Pub 缓存】rm -rf ~/.pub-cache/*")
      open "$HOME/.pub-cache"
      read "?按回车清除 .pub-cache，其他键跳过："
      [[ -z "$REPLY" ]] && rm -rf "$HOME/.pub-cache"/* && print_green "✅ Pub 缓存清除完成" || echo "🚫 跳过"
      ;;

    "【清除 Android 缓存】rm -rf ~/.gradle")
      rm -rf "$HOME/.gradle"
      print_green "✅ Android 缓存清除完成"
      ;;

    "【修复依赖缓存】flutter pub cache repair")
      fvm flutter pub cache repair || flutter pub cache repair
      print_green "✅ Flutter 依赖缓存修复完成"
      ;;

    "【加载 Flutter 项目】拖入 pubspec.yaml 所在路径")
      while true; do
        echo ""
        print_yellow "📂 请拖入 Flutter 项目文件夹（包含 pubspec.yaml 和 lib/）"
        read "?👉 输入路径（直接回车或任意非路径字符返回上级菜单）："
        user_input="$REPLY"

        if [[ -z "$user_input" || "$user_input" != /* ]]; then
          print_yellow "↩️ 已返回上级菜单"
          show_global_menu
          return
        fi

        if [[ ! -d "$user_input" ]]; then
          print_red "❌ 这不是一个有效目录，请重新拖入"
          continue
        fi

        if is_flutter_project "$user_input"; then
          cd "$user_input"
          print_green "✅ 已成功识别 Flutter 项目：$user_input"
          show_flutter_project_menu
          return
        else
          print_red "❌ 不是 Flutter 项目（缺 pubspec.yaml 或 lib/），请重试"
        fi
      done
      ;;
  esac
}

# ✅ 项目路径存在时，展示项目专属菜单
show_flutter_project_menu() {
  CHOICE=$(cat <<EOF | fzf --prompt="📦 Flutter 项目操作菜单：" --height=15 --border --reverse
【刷新依赖】flutter pub get
【项目清理】flutter clean && pub get && pub upgrade
【清除 Flutter 缓存】rm -rf bin/cache
【清除 iOS 缓存】rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Flutter .dart_tool build pubspec.lock ~/Library/Developer/Xcode/DerivedData/*
【返回上级菜单】
EOF
  )

  [[ -z "$CHOICE" ]] && print_red "❌ 已取消操作" && return

  print_green "▶️ 正在执行：$CHOICE"

  case "$CHOICE" in
    "【刷新依赖】flutter pub get")
      fvm flutter pub get || flutter pub get
      ;;

    "【项目清理】flutter clean && pub get && pub upgrade")
      fvm flutter clean || flutter clean
      rm -rf .idea .dart_tool
      fvm flutter pub get || flutter pub get
      fvm flutter pub upgrade --major-versions || flutter pub upgrade --major-versions
      print_green "✅ 项目清理完成"
      ;;

    "【清除 Flutter 缓存】rm -rf bin/cache")
      if [[ -f ".fvm/fvm_config.json" && -d ".fvm/flutter_sdk/bin/cache" ]]; then
        sdk_path="$(cd .fvm/flutter_sdk && pwd)"
      else
        sdk_path="$(dirname $(dirname $(command -v flutter)))"
      fi
      flutter_cache="$sdk_path/bin/cache"
      print_yellow "📁 缓存路径：$flutter_cache"
      open "$flutter_cache"
      read "?按回车清除 Flutter 缓存，其他键跳过："
      [[ -z "$REPLY" ]] && rm -rf "$flutter_cache"/* && print_green "✅ 清除完成" || echo "🚫 跳过"
      ;;

    "【清除 iOS 缓存】rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Flutter .dart_tool build pubspec.lock ~/Library/Developer/Xcode/DerivedData/*")
      rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Flutter
      rm -rf .dart_tool build pubspec.lock
      rm -rf ~/Library/Developer/Xcode/DerivedData/*
      print_green "✅ iOS 缓存清除完成"
      ;;

    "【返回上级菜单】")
      show_global_menu
      ;;
  esac
}

# ✅ 入口逻辑
if is_flutter_project "$(pwd)"; then
  print_green "📁 当前目录为 Flutter 项目"
  show_flutter_project_menu
else
  print_yellow "📁 当前不是 Flutter 项目，进入系统操作菜单"
  show_global_menu
fi

print_green "🎉 所有操作执行完毕！"
