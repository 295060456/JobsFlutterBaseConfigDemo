#!/bin/zsh

# ============================================
# 🛠️【MacOS】Flutter 工具：修复中文路径 URI 编码问题
# ============================================

echo ""
echo "📦 脚本用途：修复 Flutter 项目中 import 语句中被 URI 编码的中文路径（如 %E9%AB%98%E4%BB%BF）"
echo ""
echo "📁 判断 Flutter 项目根目录的依据："
echo "   ✅ 当前目录下存在 pubspec.yaml"
echo "   ✅ 当前目录下存在 lib/ 文件夹"
echo ""
echo "🔧 本脚本将自动执行以下步骤："
echo ""
echo "1️⃣ 检测 Flutter 项目根目录（只要 pubspec.yaml 和 lib 文件夹存在即可）"
echo "2️⃣ 自动识别 Flutter 命令（优先使用 FVM）"
echo "3️⃣ 自检并升级依赖工具（brew / perl / URI::Escape）"
echo "4️⃣ 替换所有 Dart 文件中 URI 编码路径为中文路径"
echo "5️⃣ 所有修改文件备份至 .import_backup/"
echo "6️⃣ 自动在备份目录中生成 README.txt 说明"
echo "7️⃣ 最后询问是否执行 flutter analyze"
echo "8️⃣ 最后询问是否执行 flutter upgrade"
echo ""
read "start_input?🔑 按下回车开始执行..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

is_flutter_project() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}

project_root="$SCRIPT_DIR"
while ! is_flutter_project "$project_root"; do
  echo "❌ 当前目录不是 Flutter 项目根目录（缺 pubspec.yaml 或 lib/ 文件夹）"
  read "project_root?📂 请输入 Flutter 项目根目录路径："
done

cd "$project_root" || exit 1

FLUTTER_CMD="flutter"
if [ -f ".fvm/flutter_sdk/bin/flutter" ]; then
  echo "🧭 检测到 FVM，使用 fvm flutter"
  FLUTTER_CMD=".fvm/flutter_sdk/bin/flutter"
fi

# Homebrew
if ! command -v brew &>/dev/null; then
  echo "📦 未检测到 Homebrew，正在安装..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "🔄 更新 brew..."
brew update && brew upgrade && brew cleanup

# Perl
if ! command -v perl &>/dev/null; then
  echo "📦 未检测到 Perl，正在安装..."
  brew install perl
else
  echo "🔄 升级 Perl..."
  brew upgrade perl
fi

# Perl 模块 URI::Escape
if ! perl -MURI::Escape -e1 2>/dev/null; then
  echo "📦 安装 Perl 模块 URI::Escape..."
  cpan URI::Escape
fi

backup_dir=".import_backup"
mkdir -p "$backup_dir"

fix_imports() {
  local file="$1"
  local temp_file="${file}.tmp"
  local changed=false

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" == *"import "* && "$line" == *"%"* ]]; then
      old_line="$line"
      new_line=$(perl -MURI::Escape -pe 's/(import\s+[\'\"])([^\'\"]+)([\'\"])/$1 . uri_unescape($2) . $3/e' <<< "$line")
      if [[ "$new_line" != "$old_line" ]]; then
        changed=true
        echo "$new_line" >> "$temp_file"
      else
        echo "$line" >> "$temp_file"
      fi
    else
      echo "$line" >> "$temp_file"
    fi
  done < "$file"

  if $changed; then
    cp "$file" "$backup_dir/"
    mv "$temp_file" "$file"
    echo "✅ 修复: $file"
  else
    rm -f "$temp_file"
  fi
}

echo ""
echo "🔍 正在扫描 Dart 文件..."
find . -type f -name "*.dart" | while read -r dart_file; do
  fix_imports "$dart_file"
done

# 添加 .import_backup/README.txt 文件说明
cat > "$backup_dir/README.txt" <<EOF
📁 .import_backup 文件夹说明：

本目录由修复 Flutter 中文 import 脚本自动生成，
用于备份所有被修改过的 Dart 文件（import 路径已被 URI 解码为中文路径）。

您可以随时在这里找到修改前的原始文件备份，以便回滚或对比。
EOF

echo ""
echo "✅ 所有 import 路径修复完成"
echo "📦 备份文件位置：$project_root/$backup_dir"

echo ""
read "analyze_input?🔍 是否现在运行 $FLUTTER_CMD analyze？（按回车执行，Ctrl+C 跳过）"
$FLUTTER_CMD analyze

echo ""
read "upgrade_input?🆙 是否现在执行 $FLUTTER_CMD upgrade 升级 Flutter 到最新版？（回车执行，Ctrl+C 跳过）"
$FLUTTER_CMD upgrade

echo ""
echo "🎉 脚本执行完毕！"
