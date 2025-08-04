#!/bin/zsh

# ✅ 全局变量定义区域
PROFILE_FILE=""
selected_envs=()

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

# ✅ 自述信息
print_description() {
  info_echo      "=============================="
  info_echo      "     Jobs Installer 🚀       "
  info_echo      "=============================="
  echo ""
  bold_echo      "🛠️ Jobs 自动化脚本助手"
  gray_echo      "----------------------------------------------"
  note_echo      "✅ 自动检测环境 / 安装依赖"
  note_echo      "✅ 支持 FVM / SDK 管理 / PATH 写入"
  note_echo      "✅ 命令行交互式选择 / 回车跳过 / 高亮提示"
  note_echo      "✅ 所有改动尽量幂等且具备提示"
  gray_echo      "----------------------------------------------"
}

# ✅ 用户确认启动
wait_for_user_to_start() {
  echo ""
  read "?👉 按下回车开始执行，或 Ctrl+C 取消..."
  echo ""
}

# ✅  功能模块：选择 Profile
select_profile_file() {
  info_echo "📝 请选择你要写入的配置文件（默认写入 ~/.bash_profile）："
  echo "1️⃣ ~/.bash_profile"
  echo "2️⃣ ~/.bashrc"
  echo "3️⃣ ~/.zshrc"
  echo "4️⃣ ~/.oh-my-zsh/oh-my-zsh.sh"
  read "?👉 输入序号选择（回车默认 ~/.bash_profile）：" choice

  case $choice in
    2) PROFILE_FILE="$HOME/.bashrc" ;;
    3) PROFILE_FILE="$HOME/.zshrc" ;;
    4) PROFILE_FILE="$HOME/.oh-my-zsh/oh-my-zsh.sh" ;;
    *) PROFILE_FILE="$HOME/.bash_profile" ;;
  esac

  info_echo "📄 当前配置文件：$PROFILE_FILE"
  touch "$PROFILE_FILE"
}

# ✅ 功能模块：选择环境变量编号
select_env_items() {
  info_echo "🛠️ 请选择你要写入的环境变量（可多选）："
  echo ""
  echo " 1️⃣ Rbenv / Ruby"
  echo " 2️⃣ Curl"
  echo " 3️⃣ VSCode"
  echo " 4️⃣ Flutter"
  echo " 5️⃣ Android SDK"
  echo " 6️⃣ FVM"
  echo " 7️⃣ JDK / SDKMAN"
  echo " 8️⃣ Gradle"
  echo " 9️⃣ pipx"
  echo " 🔟 cd 进入桌面"
  echo ""
  warn_echo "💡 回车 = 全选；否则请输入多个编号，用空格分隔"

  local input more
  while true; do
    read "?👉 请输入你想添加的编号（回车=全选）: " input
    if [[ -z "$input" ]]; then
      selected_envs=(1 2 3 4 5 6 7 8 9 10)
      break
    else
      selected_envs+=($input)
      info_echo "📌 当前选择：${selected_envs[*]}"
      read "?👉 是否继续添加更多编号？回车结束，输入更多编号继续：" more
      [[ -n "$more" ]] && selected_envs+=($more) || break
    fi
  done

  selected_envs=($(echo "${selected_envs[@]}" | tr ' ' '\n' | sort -n | uniq))
}

# ✅ 功能模块：多行写入环境变量块（避免重复写入）
append_env_block() {
  local file="$1"           # 参数1：要写入的文件路径，例如 ~/.zshrc
  shift                     # 去掉第一个参数
  local block=("$@")        # 参数2+：多行内容数组

  # 提取 block 中第一行作为 header（用作唯一标识）
  local header="${block[0]}"
  if [[ -z "$header" ]]; then
    error_echo "❌ 环境变量块不能为空"
    return 1
  fi

  # 如果文件中已包含该 header，跳过写入
  if grep -Fq "$header" "$file" 2>/dev/null; then
    info_echo "📌 已存在：$header"
  else
    echo "" >> "$file"
    for line in "${block[@]}"; do
      echo "$line" >> "$file"
    done
    success_echo "✅ 已写入到 $file：$header"
  fi
}

# ✅ 功能模块：特殊处理 cd 桌面
prepend_cd_desktop() {
  if [[ " ${selected_envs[*]} " =~ " 10 " ]]; then
    if ! grep -Fxq 'cd "$HOME/Desktop"' "$PROFILE_FILE"; then
      tmp_file=$(mktemp)
      echo '# 每次打开终端默认进入桌面目录' >> "$tmp_file"
      echo 'cd "$HOME/Desktop"' >> "$tmp_file"
      echo '' >> "$tmp_file"
      cat "$PROFILE_FILE" >> "$tmp_file"
      mv "$tmp_file" "$PROFILE_FILE"
      success_echo "✅ 已将『cd ~/Desktop』插入配置文件顶部"
    else
      info_echo "📌 配置文件中已存在 cd ~/Desktop"
    fi
  fi
}

# ✅ 功能模块：写入各类配置
write_all_env_blocks() {
  append_env_block "$PROFILE_FILE" \
    "# 配置 Rbenv / Ruby" \
    'export PATH="$HOME/.rbenv/bin:$PATH"' \
    'eval "$(rbenv init -)"'

  append_env_block "$PROFILE_FILE" \
    "# 配置 Curl 环境变量" \
    'export PATH="/usr/local/opt/curl/bin:$PATH"'

  append_env_block "$PROFILE_FILE" \
    "# 配置 VSCode 命令行" \
    'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"'

  append_env_block "$PROFILE_FILE" \
    "# 配置 Flutter 环境变量" \
    'export PATH="$HOME/flutter/bin:$PATH"' \
    'export PUB_HOSTED_URL=https://pub.dev' \
    'export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com'

  append_env_block "$PROFILE_FILE" \
    "# 配置 Android SDK" \
    'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"' \
    'export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"'

  append_env_block "$PROFILE_FILE" \
    "# 配置 FVM" \
    'export PATH="$HOME/.pub-cache/bin:$PATH"' \
    'flutter() { fvm flutter "$@"; }'

  append_env_block "$PROFILE_FILE" \
    "# 配置 JDK / SDKMAN" \
    'export JAVA_HOME=$(/usr/libexec/java_home)' \
    'export PATH="$JAVA_HOME/bin:$PATH"'

  append_env_block "$PROFILE_FILE" \
    "# 配置 Gradle" \
    'export PATH="$HOME/Documents/Gradle/gradle-8.7/bin:$PATH"'

  append_env_block "$PROFILE_FILE" \
    "# 配置 pipx" \
    'export PATH="$PATH:$HOME/.local/bin"'

  prepend_cd_desktop
}

# ✅ 功能模块：打开文件 & 提示
final_tip() {
  open "$PROFILE_FILE"
  echo ""
  success_echo "✅ 环境变量已写入：$PROFILE_FILE"
  warn_echo "⚠️ 请手动执行以下命令以使其生效："
  echo ""
  underline_echo "source \"$PROFILE_FILE\""
  echo ""
}

# ✅ 功能说明输出（结构清晰）
print_description() {
  echo ""
  bold_echo "🛠️ 环境变量快速写入脚本"
  gray_echo "---------------------------------------------"
  note_echo "1️⃣ 选择配置文件（.zshrc / .bash_profile / etc）"
  note_echo "2️⃣ 支持多种常用开发工具配置写入"
  note_echo "3️⃣ 自动避免重复写入，结构清晰"
  note_echo "4️⃣ 全程交互，写入后自动打开查看"
  gray_echo "---------------------------------------------"
}

# ✅ 主函数
main() {
  clear                           # 清屏
  print_description               # 自述信息
  wait_for_user_to_start          # 等待用户确认开始
  print_description               # 自述介绍
  select_profile_file             # 选择配置文件
  select_env_items                # 选择要写入的环境变量项
  write_all_env_blocks            # 写入配置
  final_tip                       # 提示用户手动生效
}

main "$@"
