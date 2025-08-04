#!/bin/zsh

# ✅ 彩色输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')     # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                    # 设置日志输出路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
warm_echo()      { log "\033[1;33m$1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
err_echo()       { log "\033[1;31m$1\033[0m"; }
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }
underline_echo() { log "\033[4m$1\033[0m"; }

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 🍺 Homebrew （自动架构判断）
install_homebrew() {
    local arch
    arch=$(get_cpu_arch)
    if ! command -v brew >/dev/null 2>&1; then
        warn_echo "🧩 未检测到 Homebrew，正在安装（$arch）..."
        if [[ "$arch" == "arm64" ]]; then
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
            error_echo "❌ Homebrew 安装失败"
            exit 1
          }
        else
          arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
            error_echo "❌ Homebrew 安装失败（x86_64）"
            exit 1
          }
        fi
        success_echo "✅ Homebrew 安装成功"
    else
        info_echo "🔄 Homebrew 已安装，正在更新..."
        brew update && brew upgrade && brew cleanup
        success_echo "✅ Homebrew 已更新"
    fi
}

# ✅ 自检安装 fzf
install_fzf() {
    if ! command -v fzf >/dev/null 2>&1; then
        note_echo "📦 fzf 未安装，正在通过 Homebrew 安装..."
        brew install fzf
        success_echo "✅ fzf 安装完成"
    else
        info_echo "🔄 fzf 已安装，正在升级..."
        brew upgrade fzf || true
        success_echo "✅ fzf 升级完成"
    fi
}

# ✅ 项目类型判断
is_flutter_project() {
    [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

# ✅ 系统级 Flutter 清理菜单
show_global_menu() {
    local CHOICE
    CHOICE=$(cat <<EOF | fzf --prompt="📌 请选择要执行的系统清理操作：" --height=15 --border --reverse
【清除 Pub 缓存】rm -rf ~/.pub-cache/*
【清除 Android 缓存】rm -rf ~/.gradle
【修复依赖缓存】flutter pub cache repair
【加载 Flutter 项目】拖入 pubspec.yaml 所在路径
EOF
  )

    [[ -z "$CHOICE" ]] && error_echo "❌ 操作取消" && exit 0
    echo ""
    success_echo "▶️ 执行中：$CHOICE"

    case "$CHOICE" in
        *Pub\ 缓存*)
          open "$HOME/.pub-cache"
          read "?⏎ 按回车清除 .pub-cache，其他键跳过："
          [[ -z "$REPLY" ]] && rm -rf "$HOME/.pub-cache"/* && success_echo "✅ Pub 缓存已清除" || info_echo "🚫 跳过"
          ;;
        *Android\ 缓存*)
          rm -rf "$HOME/.gradle"
          success_echo "✅ Android 缓存已清除"
          ;;
        *依赖缓存*)
          fvm flutter pub cache repair || flutter pub cache repair
          success_echo "✅ Flutter 依赖缓存已修复"
          ;;
        *加载\ Flutter\ 项目*)
          prompt_flutter_path
          ;;
    esac
}

# ✅ Flutter 项目路径交互
prompt_flutter_path() {
    while true; do
        note_echo "📂 请拖入 Flutter 项目目录（含 pubspec.yaml 和 lib/）"
        read "?👉 输入路径（回车返回）："
        local user_input="$REPLY"

        if [[ -z "$user_input" || "$user_input" != /* ]]; then
            warn_echo "↩️ 返回系统菜单"
            show_global_menu
            return
        fi

        if [[ ! -d "$user_input" ]]; then
            error_echo "❌ 不是有效目录，请重新拖入"
            continue
        fi

        if is_flutter_project "$user_input"; then
            cd "$user_input"
            success_echo "✅ 已识别 Flutter 项目：$user_input"
            show_flutter_project_menu
            return
        else
            error_echo "❌ 非有效 Flutter 项目（缺 pubspec.yaml / lib）"
        fi
    done
}

# ✅ Flutter 项目清理菜单
show_flutter_project_menu() {
    local CHOICE
    CHOICE=$(cat <<EOF | fzf --prompt="📦 Flutter 项目操作菜单：" --height=15 --border --reverse
【刷新依赖】flutter pub get
【项目清理】flutter clean && pub get && pub upgrade
【清除 Flutter 缓存】rm -rf bin/cache
【清除 iOS 缓存】rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Flutter .dart_tool build pubspec.lock ~/Library/Developer/Xcode/DerivedData/*
【返回上级菜单】
EOF
    )

    [[ -z "$CHOICE" ]] && error_echo "❌ 操作取消" && return
    success_echo "▶️ 执行中：$CHOICE"

    case "$CHOICE" in
        *刷新依赖*) fvm flutter pub get || flutter pub get ;;
        *项目清理*)
          fvm flutter clean || flutter clean
          rm -rf .idea .dart_tool
          fvm flutter pub get || flutter pub get
          fvm flutter pub upgrade --major-versions || flutter pub upgrade --major-versions
          success_echo "✅ 项目清理完成"
          ;;
        *Flutter\ 缓存*)
          local sdk_path
          sdk_path="$(dirname "$(dirname "$(command -v flutter)")")"
          if [[ -f ".fvm/fvm_config.json" && -d ".fvm/flutter_sdk/bin/cache" ]]; then
            sdk_path="$(cd .fvm/flutter_sdk && pwd)"
          fi
          local flutter_cache="$sdk_path/bin/cache"
          note_echo "📁 缓存路径：$flutter_cache"
          open "$flutter_cache"
          read "?⏎ 按回车清除缓存，其他键跳过："
          [[ -z "$REPLY" ]] && rm -rf "$flutter_cache"/* && success_echo "✅ 缓存清除完成" || info_echo "🚫 跳过"
          ;;
        *iOS\ 缓存*)
          rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Flutter
          rm -rf .dart_tool build pubspec.lock
          rm -rf ~/Library/Developer/Xcode/DerivedData/*
          success_echo "✅ iOS 缓存清除完成"
          ;;
        *返回*) show_global_menu ;;
    esac
}

# ✅ 主交互流程封装
enter_interactive_mode() {
    echo ""
    read "?👉 按下回车键继续，或 Ctrl+C 退出..."

    install_homebrew
    install_fzf

    if is_flutter_project "$(pwd)"; then
        success_echo "📁 当前目录为 Flutter 项目"
        show_flutter_project_menu
    else
        warn_echo "📁 当前不是 Flutter 项目，将进入系统菜单"
        show_global_menu
    fi
}

# ✅ 主函数入口
main() {
    clear
    highlight_echo "🧹 Flutter 清理工具"
    info_echo "• 支持系统缓存与项目缓存清理"
    info_echo "• 支持拖入项目路径进入操作菜单"
    enter_interactive_mode
    success_echo "🎉 所有操作执行完毕"
}

main "$@"
