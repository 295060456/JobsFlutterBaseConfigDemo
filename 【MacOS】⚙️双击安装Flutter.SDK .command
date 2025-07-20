#!/bin/zsh

clear

# ------------------------- 🌟 自述 -------------------------
echo ""
echo "🛠 Flutter SDK 安装助手（支持官方 / brew / fvm）"
echo "------------------------------------------------------"
echo "📌 功能说明："
echo "1️⃣ 自动安装或升级 Homebrew 和 fzf"
echo "2️⃣ 提供三种安装 Flutter SDK 的方式："
echo "   - ✅ 官方手动解压（支持拖入安装路径）"
echo "   - ✅ brew 一键安装或升级"
echo "   - ✅ fvm 安装 Flutter（推荐，需在 Flutter 项目根目录下运行）"
echo "3️⃣ 若使用 FVM 安装，将强制检测当前目录是否为 Flutter 项目根目录"
echo "   （要求存在 pubspec.yaml 和 lib/）"
echo "4️⃣ 安装完成后，自动检测并写入环境变量到 ~/.bash_profile（带用户确认）"
echo "------------------------------------------------------"
echo ""

# ------------------------- 🔍 工具自检 -------------------------
check_or_install() {
  local cmd=$1
  local install=$2

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "🔧 未检测到 $cmd，正在安装..."
    eval "$install"
  else
    echo "✅ 已安装 $cmd，尝试升级..."
    if [[ "$cmd" == "brew" ]]; then
      brew update && brew upgrade
    else
      brew upgrade "$cmd" || true
    fi
  fi
}

check_or_install "brew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
check_or_install "fzf" 'brew install fzf'

# ------------------------- 🎯 安装方式选择 -------------------------
echo ""
echo "📦 请选择安装 Flutter SDK 的方式（通过 ↑↓ 选择，回车确认）："
sleep 0.5

choice=$(printf "1️⃣ 官方解压安装\n2️⃣ Homebrew 安装/升级\n3️⃣ FVM 安装（多版本推荐）" | fzf)

# ------------------------- 🚀 分支执行 -------------------------
if [[ "$choice" == "1️⃣ 官方解压安装" ]]; then
  echo ""
  echo "📂 请拖入你希望安装 Flutter 的目标文件夹（如 ~/development）："
  read -r target_dir
  target_dir="${target_dir/#\~/$HOME}"
  mkdir -p "$target_dir"
  cd "$target_dir"

  echo "🌐 下载 Flutter SDK 中..."
  curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_latest-stable.zip

  echo "📦 解压..."
  unzip -q flutter_macos_latest-stable.zip
  rm flutter_macos_latest-stable.zip

  echo "✅ Flutter SDK 解压完成"
  open "$target_dir/flutter"

elif [[ "$choice" == "2️⃣ Homebrew 安装/升级" ]]; then
  echo ""
  if command -v flutter >/dev/null 2>&1; then
    echo "🔄 已检测到 Flutter，尝试升级..."
    brew upgrade flutter || true
  else
    echo "📦 开始安装 Flutter..."
    brew install flutter
  fi
  echo "✅ 安装完成，执行 flutter doctor 检查配置"
  flutter doctor

elif [[ "$choice" == "3️⃣ FVM 安装（多版本推荐）" ]]; then
  echo ""
  echo "📍 当前选择了 FVM 安装方式：必须在 Flutter 项目根目录执行"
  echo "📂 检查当前路径是否为 Flutter 项目..."

  function is_flutter_project() {
    [[ -f "pubspec.yaml" && -d "lib" ]]
  }

  until is_flutter_project; do
    echo ""
    echo "❌ 当前目录 $(pwd) 不是有效的 Flutter 项目"
    echo "👉 请拖入 Flutter 项目根目录（包含 pubspec.yaml 和 lib/）"
    read -r flutter_project_dir
    flutter_project_dir="${flutter_project_dir/#\~/$HOME}"
    cd "$flutter_project_dir"
  done

  echo "✅ 已确认是 Flutter 项目：$(pwd)"
  echo "📦 开始安装 fvm..."
  brew install fvm

  echo "🔍 可用 Flutter 版本（按 ↑↓ 查看，回车选择，或直接回车默认 stable）..."
  version=$(fvm releases | awk '/^stable|beta|dev|master/ {print $1}' | fzf --prompt="选择要安装的 Flutter 版本：" || echo "stable")

  echo "⬇️ 安装 Flutter $version ..."
  fvm install "$version"
  fvm use "$version"

  echo "✅ 安装完成，执行 flutter doctor 检查配置"
  fvm flutter doctor
else
  echo "❌ 未知选择，脚本中止"
  exit 1
fi

# ------------------------- 📌 写入环境变量 .bash_profile -------------------------

target_env_file="$HOME/.bash_profile"
[[ -f "$target_env_file" ]] || touch "$target_env_file"

echo ""
echo "\033[32m📄 即将写入环境变量配置到：$target_env_file\033[0m"
echo ""
echo "\033[31m以下内容将在确认后追加写入（若未存在）：\033[0m"
echo "------------------------------------------------------"
cat <<'EOF' | tee /dev/stderr
# 配置 Flutter 环境变量
if ! command -v fvm &>/dev/null; then
  if [[ -d "/opt/homebrew/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/opt/homebrew/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "/usr/local/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/usr/local/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "$HOME/flutter/bin" ]]; then
    export PATH="$HOME/flutter/bin:$PATH"
  elif [[ -d "$HOME/Documents/GitHub.Jobs/Flutter.SDK/Flutter.SDK.last/bin" ]]; then
    export PATH="$HOME/Documents/GitHub.Jobs/Flutter.SDK/Flutter.SDK.last/bin:$PATH"
  else
    echo "⚠️ 未找到 Flutter SDK，请手动配置路径"
  fi
fi
export PUB_HOSTED_URL=https://pub.dartlang.org
export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com

# 配置 FVM 环境变量
export PATH="$HOME/.pub-cache/bin:$PATH"
if command -v fvm &>/dev/null; then
  flutter() { fvm flutter "$@"; }
else
  echo "⚠️ 未检测到 fvm，请执行 flutter pub global activate fvm 安装"
fi
EOF
echo "------------------------------------------------------"

echo ""
read "?🎯 按回车键写入以上内容，或输入任意内容 + 回车跳过： " confirm
if [[ -z "$confirm" ]]; then
  echo "📝 正在写入..."
  content_to_add=$(cat <<'EOL'

# 配置 Flutter 环境变量
if ! command -v fvm &>/dev/null; then
  if [[ -d "/opt/homebrew/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/opt/homebrew/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "/usr/local/Caskroom/flutter/latest/flutter/bin" ]]; then
    export PATH="/usr/local/Caskroom/flutter/latest/flutter/bin:$PATH"
  elif [[ -d "$HOME/flutter/bin" ]]; then
    export PATH="$HOME/flutter/bin:$PATH"
  elif [[ -d "$HOME/Documents/GitHub.Jobs/Flutter.SDK/Flutter.SDK.last/bin" ]]; then
    export PATH="$HOME/Documents/GitHub.Jobs/Flutter.SDK/Flutter.SDK.last/bin:$PATH"
  else
    echo "⚠️ 未找到 Flutter SDK，请手动配置路径"
  fi
fi
export PUB_HOSTED_URL=https://pub.dartlang.org
export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com

# 配置 FVM 环境变量
export PATH="$HOME/.pub-cache/bin:$PATH"
if command -v fvm &>/dev/null; then
  flutter() { fvm flutter "$@"; }
else
  echo "⚠️ 未检测到 fvm，请执行 flutter pub global activate fvm 安装"
fi
EOL
)
  if ! grep -q "# 配置 Flutter 环境变量" "$target_env_file"; then
    echo "$content_to_add" >> "$target_env_file"
    echo "✅ 写入完成，请执行：\033[33msource $target_env_file\033[0m"
  else
    echo "✅ 检测到内容已存在，未重复写入"
  fi
else
  echo "⛔️ 已取消写入 .bash_profile"
fi
