#!/bin/zsh

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

# ✅ 项目路径与环境初始化
init_script_env() {
  clear
  cd "$(dirname "$0")" || exit 1  # 强制切换到脚本所在目录
}

# ✅ 自述信息
print_banner() {
  echo ""
  highlight_echo "📦 脚本用途：修复 Flutter 项目中 import 语句中被 URI 编码的中文路径"
  echo ""
  info_echo "📁 判断 Flutter 项目根目录的依据："
  info_echo "   ✅ 当前目录下存在 pubspec.yaml"
  info_echo "   ✅ 当前目录下存在 lib/ 文件夹"
  echo ""
  info_echo "🔧 本脚本将自动执行以下步骤："
  info_echo "1️⃣ 检测 Flutter 项目根目录"
  info_echo "2️⃣ 自动识别 Flutter 命令（FVM 优先）"
  info_echo "3️⃣ 安装/升级工具（brew、perl、URI::Escape）"
  info_echo "4️⃣ 替换所有 Dart 文件中 URI 编码路径为中文路径"
  info_echo "5️⃣ 所有修改文件备份至 .import_backup/"
  info_echo "6️⃣ 自动生成说明文件"
  info_echo "7️⃣ 询问是否执行 flutter analyze"
  info_echo "8️⃣ 询问是否执行 flutter upgrade"
  echo ""
  read "?🔑 按下回车开始执行..."
}

# ✅ 检查 Flutter 项目根目录
is_flutter_project_root() {
  [[ -f "pubspec.yaml" && -d "lib" ]]
}

check_flutter_project_root() {
  until is_flutter_project_root; do
    error_echo "❌ 当前目录不是 Flutter 项目根目录（缺 pubspec.yaml 或 lib/）"
    read "?📂 请输入 Flutter 项目路径：" proj_path
    cd "$proj_path" 2>/dev/null || {
      error_echo "❌ 路径无效：$proj_path"
      continue
    }
  done
}

# ✅ Flutter 命令识别
detect_flutter_command() {
  if command -v fvm &>/dev/null && [[ -x ".fvm/flutter_sdk/bin/flutter" ]]; then
    FLUTTER_CMD=".fvm/flutter_sdk/bin/flutter"
    info_echo "🧭 检测到 FVM，使用 fvm flutter"
  else
    FLUTTER_CMD="flutter"
    info_echo "🧭 使用全局 flutter"
  fi
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 安装 Homebrew（芯片架构兼容、含环境注入）
install_homebrew() {
  local arch="$(get_cpu_arch)"
  local shell_path="${SHELL##*/}"
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    _color_echo yellow "🧩 未检测到 Homebrew，正在安装 ($arch)..."

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    _color_echo green "✅ Homebrew 安装成功"

    # ==== 设置 brew 环境 ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""
    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    # 避免重复写入
    if grep -qF "$shellenv_cmd" "$profile_file" 2>/dev/null; then
      _color_echo blue "🔁 brew shellenv 已存在于 $profile_file，无需重复添加"
    else
      echo "$shellenv_cmd" >> "$profile_file"
      _color_echo green "📝 已写入 brew shellenv 到 $profile_file"
    fi

    # 当前会话立即生效
    eval "$shellenv_cmd"
    _color_echo green "✅ brew 环境变量已在当前终端生效"

  else
    _color_echo blue "🔄 Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    _color_echo green "✅ Homebrew 已更新"
  fi
}

ensure_perl_installed() {
  if ! brew list perl &>/dev/null; then
    warn_echo "📦 未检测到 Homebrew 安装的 Perl，正在安装..."
    brew install perl || {
      error_echo "❌ Perl 安装失败，请检查网络或更换镜像"
      exit 1
    }
  else
    info_echo "🔄 检测到 Perl，正在升级..."
    brew upgrade perl
  fi
}

ensure_uri_escape_installed() {
  if ! perl -MURI::Escape -e 1 &>/dev/null; then
    info_echo "📦 安装 URI::Escape 模块..."
    cpan install URI::Escape || {
      error_echo "❌ 安装 URI::Escape 失败，请检查 Perl 配置"
      exit 1
    }
  fi
}

# ✅ 替换 import 路径
replace_uri_imports() {
  echo ""
  info_echo "🔍 正在扫描 Dart 文件..."
  BACKUP_DIR=".import_backup"
  mkdir -p "$BACKUP_DIR"

  find . -name "*.dart" | while read -r file; do
    if grep -q "import 'package:[^']*%[0-9A-Fa-f]\{2\}" "$file"; then
      info_echo "🔧 修复 import：$file"
      cp "$file" "$BACKUP_DIR/$(basename "$file")"
      perl -i -pe "use URI::Escape; s|(import\\s+'package:[^']*)|uri_unescape(\$1)|ge" "$file"
    fi
  done

  cat > "$BACKUP_DIR/README.txt" <<EOF
该目录包含被替换前的 Dart 文件备份。
路径替换时间：$(date)
EOF

  success_echo "✅ 所有 import 路径修复完成"
  info_echo "📦 备份文件位置：$(pwd)/$BACKUP_DIR"
}

# ✅ 后续操作：分析与升级
ask_flutter_analyze() {
  echo ""
  read "?🔍 是否运行 $FLUTTER_CMD analyze？（回车执行，Ctrl+C 跳过）"
  $FLUTTER_CMD analyze
}

ask_flutter_upgrade() {
  echo ""
  read "?⬆️ 是否执行 $FLUTTER_CMD upgrade？（回车执行，Ctrl+C 跳过）"
  $FLUTTER_CMD upgrade
}

# ✅ 主流程入口
main() {
  init_script_env               # 🧭 初始化并切换到脚本目录
  print_banner                  # ✅ 自述信息
  check_flutter_project_root    # 🔍 检查并进入 Flutter 项目根目录
  detect_flutter_command        # 🧩 检测 Flutter 命令（fvm 或全局）
  ensure_brew_installed         # 🍺 确保 brew 已安装并更新
  ensure_perl_installed         # 🐪 安装或升级 perl
  ensure_uri_escape_installed   # 📦 安装 URI::Escape 模块
  replace_uri_imports           # 🔧 修复 import 中的中文 URI 编码路径
  ask_flutter_analyze           # 🔍 是否执行 flutter analyze 分析
  ask_flutter_upgrade           # ⬆️ 是否执行 flutter upgrade 升级 SDK
}

main "$@"
