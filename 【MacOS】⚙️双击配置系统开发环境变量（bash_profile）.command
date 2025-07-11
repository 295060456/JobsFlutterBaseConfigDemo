#!/bin/zsh

# ✅ 彩色打印函数
print_success() { echo "\033[1;32m✅ $1\033[0m"; }
print_info()    { echo "\033[1;34m📘 $1\033[0m"; }
print_warn()    { echo "\033[1;33m⚠️ $1\033[0m"; }
print_error()   { echo "\033[1;31m❌ $1\033[0m"; }

# ✅ 选择写入配置文件
print_info "📝 请选择你要写入的配置文件（默认写入 ~/.bash_profile）："
echo "1️⃣ ~/.bash_profile"
echo "2️⃣ ~/.bashrc"
echo "3️⃣ ~/.zshrc"
echo "4️⃣ ~/.oh-my-zsh/oh-my-zsh.sh"
read "?👉 输入序号选择（回车默认 ~/.bash_profile）：" profile_choice

case $profile_choice in
  2) PROFILE_FILE="$HOME/.bashrc";;
  3) PROFILE_FILE="$HOME/.zshrc";;
  4) PROFILE_FILE="$HOME/.oh-my-zsh/oh-my-zsh.sh";;
  *) PROFILE_FILE="$HOME/.bash_profile";;
esac

print_info "📄 当前配置文件：$PROFILE_FILE"
touch "$PROFILE_FILE"

# ✅ 显示功能说明
print_info "🛠️ 本脚本支持添加以下环境变量配置（可多选）："
echo ""
echo " 1️⃣ Rbenv / Ruby"
echo " 2️⃣ Curl"
echo " 3️⃣ VSCode"
echo " 4️⃣ Flutter"
echo " 5️⃣ Android SDK"
echo " 6️⃣ FVM"
echo " 7️⃣ JDK / OpenJDK / SDKMAN"
echo " 8️⃣ Gradle"
echo " 9️⃣ pipx"
echo " 🔟 终端默认路径定位 ~/Desktop"
echo ""
print_warn "💡 默认直接回车 = 全选；否则请输入多个编号，用空格分隔"

selected=()
while true; do
  read "?👉 请输入你想添加的编号（回车=全选）: " input
  if [[ -z "$input" ]]; then
    selected=(1 2 3 4 5 6 7 8 9 10)
    break
  else
    selected+=($input)
    print_info "当前选择：${selected[*]}"
    read "?👉 是否继续添加更多编号？回车结束，输入更多编号继续：" more
    [[ -n "$more" ]] && selected+=($more) || break
  fi
done

selected=($(echo "${selected[@]}" | tr ' ' '\n' | sort -n | uniq))

# ✅ 插入环境配置块函数
append_block_if_not_exists() {
  local id=$1
  local header="$2"
  shift 2
  local block=("$@")

  if [[ " ${selected[@]} " =~ " ${id} " ]]; then
    if ! grep -Fq "$header" "$PROFILE_FILE"; then
      if [[ $id == 10 ]]; then
        sed -i '' '1i\
'"${block[0]}"'
' "$PROFILE_FILE"
        print_success "已将『终端默认进入桌面目录』写入配置文件顶部"
      else
        echo "\n$header" >> "$PROFILE_FILE"
        for line in "${block[@]}"; do echo "$line" >> "$PROFILE_FILE"; done
        print_success "✅ 已添加：$header"
      fi
    else
      print_info "📌 已存在：$header"
    fi
  fi
}

# ✅ cd ~/Desktop 永久插入顶部（不使用 sed 以避免兼容问题）
if [[ " ${selected[@]} " =~ " 10 " ]]; then
  if ! grep -Fxq 'cd "$HOME/Desktop"' "$PROFILE_FILE"; then
    tmp_file=$(mktemp)
    echo '# 每次打开终端默认进入桌面目录' >> "$tmp_file"
    echo 'cd "$HOME/Desktop"' >> "$tmp_file"
    echo '' >> "$tmp_file"
    cat "$PROFILE_FILE" >> "$tmp_file"
    mv "$tmp_file" "$PROFILE_FILE"
    print_success "✅ 已将『cd ~/Desktop』插入配置文件顶部"
  else
    print_info "📌 配置文件中已存在 cd ~/Desktop"
  fi
fi

# ✅ Rbenv + Ruby
append_block_if_not_exists 1 "# 配置 Rbenv.ruby 环境变量（需安装 rbenv）" \
  'if command -v rbenv &>/dev/null; then' \
  '  export PATH="$HOME/.rbenv/bin:$PATH"' \
  '  eval "$(rbenv init -)"' \
  'else' \
  '  echo "⚠️ 未检测到 rbenv，请执行 brew install rbenv 安装"' \
  'fi' \
  'if command -v ruby &>/dev/null; then' \
  '  export PATH="/usr/local/opt/ruby/bin:$PATH"' \
  '  export LDFLAGS="-L/usr/local/opt/ruby/lib"' \
  '  export CPPFLAGS="-I/usr/local/opt/ruby/include"' \
  '  export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"' \
  'else' \
  '  echo "⚠️ 未检测到 ruby，建议执行 brew install ruby"' \
  'fi'

# ✅ Curl
append_block_if_not_exists 2 "# 配置 Curl 环境变量（需 Homebrew 安装）" \
  'if command -v curl &>/dev/null; then' \
  '  export PATH="/usr/local/opt/curl/bin:$PATH"' \
  '  export LDFLAGS="-L/usr/local/opt/curl/lib"' \
  '  export CPPFLAGS="-I/usr/local/opt/curl/include"' \
  '  export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"' \
  'else' \
  '  echo "⚠️ curl 未通过 brew 安装，建议执行 brew install curl"' \
  'fi'

# ✅ VSCode
append_block_if_not_exists 3 "# 配置 VSCode 命令行（code）" \
  'if command -v code &>/dev/null; then' \
  '  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' \
  'else' \
  '  echo "⚠️ 未检测到 code 命令，请打开 VSCode 后运行「Shell Command: Install code in PATH」"' \
  'fi'

# ✅ Flutter
append_block_if_not_exists 4 "# 配置 Flutter 环境变量" \
  'if ! command -v fvm &>/dev/null; then' \
  '  if [[ -d "/opt/homebrew/Caskroom/flutter/latest/flutter/bin" ]]; then' \
  '    export PATH="/opt/homebrew/Caskroom/flutter/latest/flutter/bin:$PATH"' \
  '  elif [[ -d "/usr/local/Caskroom/flutter/latest/flutter/bin" ]]; then' \
  '    export PATH="/usr/local/Caskroom/flutter/latest/flutter/bin:$PATH"' \
  '  elif [[ -d "$HOME/flutter/bin" ]]; then' \
  '    export PATH="$HOME/flutter/bin:$PATH"' \
  '  elif [[ -d "$HOME/Documents/GitHub.Jobs/Flutter.SDK/Flutter.SDK.last/bin" ]]; then' \
  '    export PATH="$HOME/Documents/GitHub.Jobs/Flutter.SDK/Flutter.SDK.last/bin:$PATH"' \
  '  else' \
  '    echo "⚠️ 未找到 Flutter SDK，请手动配置路径"' \
  '  fi' \
  'fi' \
  'export PUB_HOSTED_URL=https://pub.dartlang.org' \
  'export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com'

# ✅ Android SDK
append_block_if_not_exists 5 "# 配置 Android SDK 环境变量" \
  'if [[ -d "$HOME/Library/Android/sdk" ]]; then' \
  '  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"' \
  '  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin"' \
  'else' \
  '  echo "⚠️ 未检测到 Android SDK，请安装 Android Studio 或配置 ANDROID_SDK_ROOT"' \
  'fi'

# ✅ FVM
append_block_if_not_exists 6 "# 配置 FVM 环境变量" \
  'if command -v fvm &>/dev/null; then' \
  '  export PATH="$HOME/.pub-cache/bin:$PATH"' \
  '  flutter() { fvm flutter "$@"; }' \
  'else' \
  '  echo "⚠️ 未检测到 fvm，请执行 dart pub global activate fvm 安装"' \
  'fi'

# ✅ JDK / SDKMAN
append_block_if_not_exists 7 "# 配置 JDK / OpenJDK / SDKMAN" \
  'if /usr/libexec/java_home &>/dev/null; then' \
  '  export JAVA_HOME=$(/usr/libexec/java_home)' \
  '  export PATH="$JAVA_HOME/bin:$PATH"' \
  'else' \
  '  echo "⚠️ 未检测到 Java，请先安装 openjdk：brew install openjdk"' \
  'fi' \
  'if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then' \
  '  export SDKMAN_DIR="$HOME/.sdkman"' \
  '  source "$HOME/.sdkman/bin/sdkman-init.sh"' \
  'else' \
  '  echo "⚠️ 未检测到 SDKMAN，请访问 https://sdkman.io 安装"' \
  'fi'

# ✅ Gradle
append_block_if_not_exists 8 "# 配置 Gradle 环境变量" \
  'if command -v gradle &>/dev/null; then' \
  '  export PATH="$HOME/Documents/Gradle/gradle-8.7/bin:$PATH"' \
  'else' \
  '  echo "⚠️ 未检测到 gradle，建议执行 brew install gradle 安装"' \
  'fi'

# ✅ pipx
append_block_if_not_exists 9 "# 配置 pipx 环境变量" \
  'if command -v pipx &>/dev/null; then' \
  '  export PATH="$PATH:$HOME/.local/bin"' \
  'else' \
  '  echo "⚠️ pipx 未安装，建议执行 brew install pipx"' \
  'fi'

# ✅ 打开配置文件
open "$PROFILE_FILE"

# ✅ 尝试重新加载
print_info "🔄 尝试重新加载配置文件：$PROFILE_FILE"
[[ -s "$PROFILE_FILE" ]] && source "$PROFILE_FILE" || print_warn "⚠️ 配置文件为空，跳过 source"
