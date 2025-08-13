#!/bin/zsh

# ✅ 全局变量与日志
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

EMULATOR_DIR="$ANDROID_HOME/emulator"
SYSTEM_IMAGES_DIR="$ANDROID_HOME/system-images"
AVD_DIR="$HOME/.android/avd"
CMDLINE_TOOLS_BIN="$ANDROID_HOME/cmdline-tools/latest/bin"

# ✅ 彩色输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
print_script_intro_and_path_check() {
    highlight_echo "📦 Android 模拟器工具脚本"
    echo ""
    note_echo "🗂️ 模拟器路径结构说明："
    info_echo "1️⃣ SDK 根目录         ：\$ANDROID_HOME → $ANDROID_HOME"
    info_echo "2️⃣ 模拟器工具目录     ：$EMULATOR_DIR"
    info_echo "3️⃣ 系统镜像目录       ：$SYSTEM_IMAGES_DIR"
    info_echo "4️⃣ 模拟器配置数据目录 ：$AVD_DIR"
    echo ""

    gray_echo "📂 示例结构："
    gray_echo "~/.android/avd/Pixel_5.avd/config.ini"
    gray_echo "~/Library/Android/sdk/system-images/android-34/google_apis/x86_64/"
    echo ""

    info_echo "🔍 正在检测关键路径..."
    for dir in "$ANDROID_HOME" "$EMULATOR_DIR" "$SYSTEM_IMAGES_DIR" "$AVD_DIR" "$CMDLINE_TOOLS_BIN"; do
        [[ -e "$dir" ]] && success_echo "存在路径：$dir" || warn_echo "缺失路径：$dir"
    done
}

fzf_select() {
    local choice=$(printf "%s\n" "$@" | fzf --prompt="请选择：" --height=10 --border --reverse)
    echo "$choice"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
    [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 安装 Homebrew（自动架构判断，包含环境注入）
install_homebrew() {
  local arch="$(get_cpu_arch)"                   # 获取当前架构（arm64 或 x86_64）
  local shell_path="${SHELL##*/}"                # 获取当前 shell 名称（如 zsh、bash）
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    inject_shellenv_block "$profile_file" "$shellenv_cmd"

  else
    info_echo "🔄 Homebrew 已安装，正在更新..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
  fi
}

# ✅ 自检安装 Homebrew.fzf
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    note_echo "📦 未检测到 fzf，正在通过 Homebrew 安装..."
    brew install fzf || { error_echo "❌ fzf 安装失败"; exit 1; }
    success_echo "✅ fzf 安装成功"
  else
    info_echo "🔄 fzf 已安装，升级中..."
    brew upgrade fzf && brew cleanup
    success_echo "✅ fzf 已是最新版"
  fi
}

# ✅ 检查工具链：emulator 状态
check_emulator() {
    if ! command -v emulator &>/dev/null; then
        error_echo "未找到 emulator 命令，请检查 \$ANDROID_HOME 是否配置正确"
        exit 1
    fi
}

# ✅ 检查工具链：sdkmanager / avdmanager 状态
check_sdk_tools() {
    if [[ ! -x "$CMDLINE_TOOLS_BIN/sdkmanager" || ! -x "$CMDLINE_TOOLS_BIN/avdmanager" ]]; then
        error_echo "缺少 sdkmanager 或 avdmanager"
        note_echo "请前往 https://developer.android.com/studio#cmdline 下载解压至："
        gray_echo "$ANDROID_HOME/cmdline-tools/latest/"
        exit 1
    fi
}

# ✅ 创建模拟器
create_avd_if_needed() {
    avds=($(emulator -list-avds))
    if [[ ${#avds[@]} -eq 0 ]]; then
        warn_echo "本机尚未创建任何模拟器，准备创建..."

selected=$(cat <<EOF | fzf --prompt="请选择要创建的模拟器：" --height=10 --border
Pixel 5 (pixel_5) + system-images;android-34;google_apis;x86_64
Pixel 4 (pixel_4) + system-images;android-33;google_apis;x86_64
Pixel 3 (pixel_3) + system-images;android-31;google_apis;x86_64
EOF
)

        [[ -z "$selected" ]] && warn_echo "已取消模拟器创建" && exit 0

        device_id=$(echo "$selected" | awk -F '[()]' '{print $2}')
        avd_label=$(echo "$selected" | cut -d '+' -f 1 | cut -d '(' -f 1 | xargs)
        avd_name=$(echo "$avd_label" | tr ' ' '_' | tr -cd '[:alnum:]_.-')
        image_id=$(echo "$selected" | cut -d '+' -f 2 | xargs)

        info_echo "📦 安装系统镜像：$image_id ..."
        yes | "$CMDLINE_TOOLS_BIN/sdkmanager" "$image_id"

        note_echo "🛠️ 创建模拟器：$avd_name ..."
        echo "no" | "$CMDLINE_TOOLS_BIN/avdmanager" create avd -n "$avd_name" -k "$image_id" --device "$device_id"

        open "$AVD_DIR/$avd_name.avd"
        emulator -avd "$avd_name" &

        sleep 5
        if pgrep -f "emulator.*$avd_name" >/dev/null; then
          success_echo "模拟器 $avd_name 已成功启动"
        else
          error_echo "模拟器启动失败，请尝试手动启动：emulator -avd $avd_name"
        fi
        exit 0
    fi
}

# ✅ 启动已存在模拟器
start_avd() {
    avds=($(emulator -list-avds))
    selected=$(printf "%s\n" "${avds[@]}" | fzf --prompt="请选择要启动的模拟器：")
    [[ -z "$selected" ]] && warn_echo "用户取消选择，退出" && exit 0

    note_echo "🚀 正在启动模拟器：$selected"
    emulator -avd "$selected" &

    sleep 5
    if pgrep -f "emulator.*$selected" >/dev/null; then
        success_echo "模拟器 $selected 启动成功"
    else
        error_echo "启动失败，请手动执行：emulator -avd $selected"
    fi
}

# ✅ 主函数入口
main() {
    clear
    print_script_intro_and_path_check                  # ✅ 自述信息
    read "?⏎ 按回车继续执行，或 Ctrl+C 退出..."
    install_homebrew                                   # ✅ 安装 Homebrew（自动架构判断，包含环境注入）
    install_fzf                                        # ✅ 自检安装 Homebrew.fzf
    check_emulator                                     # ✅ 检查工具链：emulator 状态
    check_sdk_tools                                    # ✅ 检查工具链：sdkmanager / avdmanager 状态
    create_avd_if_needed                               # ✅ 创建模拟器
    start_avd                                          # ✅ 启动已存在模拟器
}

main "$@"
