#!/bin/zsh
set -e

## ========= 💥 错误捕获 =========
#if [ -n "$BASH_VERSION" ]; then
#  trap 'exit_code=$?; echo -e "\033[31m❌ [Bash] 命令失败：$BASH_COMMAND\n退出码：$exit_code，出错行号：$LINENO\033[0m" >&2; exit $exit_code' ERR
#else
#  _trap_err_zsh() {
#    local lineno=$1
#    local code=$2
#    echo -e "\033[31m❌ [Zsh] 脚本出错！第 $lineno 行命令失败，退出码：$code\033[0m" >&2
#    exit $code
#  }
#  trap '_trap_err_zsh $LINENO $?' ERR
#fi

# ========= 🌈 彩色输出 =========
_color_echo() {
  local color="$1"; shift
  local text="$*"
  case "$color" in
    green)  printf "\033[32m%s\033[0m\n" "$text" ;;
    red)    printf "\033[31m%s\033[0m\n" "$text" ;;
    blue)   printf "\033[34m%s\033[0m\n" "$text" ;;
    yellow) printf "\033[33m%s\033[0m\n" "$text" ;;
    *)      printf "%s\n" "$text" ;;
  esac
}

# ========= 📣 自述 =========
clear
_color_echo green "📦 Flutter 项目组件预下载脚本"
_color_echo green "==================================================================="
_color_echo green "该脚本将帮助你一次性或分类预下载 Flutter 的所有支持平台工具"
_color_echo green "包括：Android 所有架构、iOS、macOS、Windows、Linux、Web、Dart SDK"
_color_echo green "支持离线缓存功能，预备无法联网时直接恢复"
_color_echo green "请在 Flutter 项目根目录（含 pubspec.yaml 和 lib/）中运行此脚本"
_color_echo green "==================================================================="
read "?📎 按回车继续（或 Ctrl+C 退出）："

# ========= 🍺 工具自检 =========
_check_homebrew() {
  # ✅ 自检更新 fzf
  if ! command -v brew >/dev/null 2>&1; then
    _color_echo red "❌ 未安装 Homebrew，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
  fi
  # ✅ 自检更新 fzf
  if ! command -v fzf >/dev/null 2>&1; then
    brew install fzf
  else
    brew upgrade fzf || true
  fi
  
  # ✅ 自检更新 coreutils（提供 realpath 命令）
  if ! command -v realpath >/dev/null 2>&1; then
    _color_echo yellow "🔍 正在检测 realpath 命令（依赖 coreutils）..."
  if ! brew list coreutils >/dev/null 2>&1; then
    _color_echo blue "🔧 未检测到 coreutils，正在通过 Homebrew 安装..."
    brew install coreutils
  else
    _color_echo green "✅ 已安装 coreutils"
  fi
  # 有些系统 realpath 装完不会自动加 PATH，需要手动 export
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
  fi
}

# ========= 🔄 进入脚本所在目录 =========
cd "$(dirname "$0")"

# ========= 🧭 判断 Flutter 项目根目录【含 pubspec.yaml 和 lib/】 =========
while [[ ! -f "pubspec.yaml" || ! -d "lib" ]]; do
  _color_echo red "❌ 当前目录不是 Flutter 项目根目录（缺少 pubspec.yaml 或 lib/）"
  _color_echo blue "📁 当前目录是：$(pwd)"
  read "?📂 请拖入 Flutter 项目根目录后按回车继续：" project_path

  # 去除双引号
  project_path="${project_path/#\"/}"; project_path="${project_path/%\"/}"

  # ✅ 判断是否为空
  if [[ -z "$project_path" ]]; then
    _color_echo yellow "⚠️ 未输入任何路径，请重新拖入后按回车"
    continue
  fi

  # ✅ 判断路径是否存在
  if [[ ! -e "$project_path" ]]; then
    _color_echo red "❌ 输入的路径不存在：$project_path"
    continue
  fi

  # ✅ 转为绝对路径
  project_path=$(realpath "$project_path")

  # ✅ 切换目录
  cd "$project_path"
done


# ========= 🔁 判断 FVM =========
CMD_PREFIX=""
if [[ -d ".fvm" ]]; then
  _color_echo green "✅ 当前为 FVM 管理的 Flutter 项目"
  CMD_PREFIX="fvm "
else
  _color_echo blue "ℹ️ 当前为普通 Flutter 项目"
fi

# ========= 📦 离线缓存支持 =========
if [[ -n "$CMD_PREFIX" ]]; then
  # ✅ FVM 模式：使用标准路径获取 flutter 可执行文件
  FLUTTER_BIN="$(realpath .fvm/flutter_sdk/bin/flutter)"
else
  # ✅ 非 FVM 模式：用系统 flutter 路径
  FLUTTER_BIN="$(command -v flutter)"
fi

# ✅ 获取 Flutter SDK 根目录
FLUTTER_SDK="$(dirname "$(dirname "$FLUTTER_BIN")")"
CACHE_DIR="$FLUTTER_SDK/bin/cache"
BACKUP_DIR="$HOME/.flutter_cache_backups/$(basename "$PWD")"

# ✅ 创建备份目录并执行备份
mkdir -p "$BACKUP_DIR"
_color_echo yellow "📁 正在备份当前缓存到离线目录：$BACKUP_DIR"
rsync -a --delete "$CACHE_DIR/" "$BACKUP_DIR/"

# ========= 📦 下载方式选择 =========
echo ""
_color_echo green "请选择下载方式："
echo "1. 下载全部平台工具（推荐）"
echo "2. 分类选择平台（fzf 多选）"
read "?👉 请输入 1 或 2 ：" mode

if [[ "$mode" == "1" ]]; then
  _color_echo blue "🚀 正在下载全部平台工具..."
  eval "${CMD_PREFIX}flutter precache --universal"
else
  while true; do
    _color_echo green "✅ 请选择需要下载的平台（空格多选，回车确认）"
    platforms=$(echo "
--ios
--android-arm-profile
--android-arm-release
--android-arm64-profile
--android-arm64-release
--android-x64-profile
--android-x64-release
--web
--macos
--linux
--windows
--force
" | fzf --multi)

    if [[ -z "$platforms" ]]; then
      _color_echo yellow "⚠️ 未选择任何平台，请重新选择（Ctrl+C 退出）"
    else
      break
    fi
  done

  _color_echo blue "🚀 正在下载所选平台工具：$platforms"
  eval "${CMD_PREFIX}flutter precache $platforms"
fi

# ========= 📁 下载完成提示 =========
if [[ -d "$CACHE_DIR" ]]; then
  _color_echo green "✅ 所有下载任务已完成！"
  _color_echo green "📁 工具保存目录如下："
  echo "$CACHE_DIR"
  read "?📎 按回车打开该目录（或 Ctrl+C 退出）：" _
  open "$CACHE_DIR"
else
  _color_echo red "❌ 缓存目录不存在：$CACHE_DIR"
  exit 1
fi
