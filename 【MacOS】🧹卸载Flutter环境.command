#!/bin/zsh

echo "🧨 正在全面清理 Dart / Flutter / FVM 环境..."
sleep 1

# 1. 清除系统常见软链
echo "🔗 移除全局软链..."
sudo rm -f /usr/local/bin/flutter
sudo rm -f /usr/local/bin/dart
sudo rm -f /opt/homebrew/bin/flutter
sudo rm -f /opt/homebrew/bin/dart
sudo rm -f /usr/bin/flutter
sudo rm -f /usr/bin/dart

# 2. 删除 Homebrew 安装的 Flutter/Dart
echo "🍺 卸载 Homebrew 安装的 dart/flutter（如果存在）..."
brew uninstall --force dart 2>/dev/null
brew uninstall --force flutter 2>/dev/null

# 3. 清除 FVM/Dart/Flutter 缓存目录
echo "📂 删除全局缓存目录..."
rm -rf ~/.pub-cache
rm -rf ~/.dart
rm -rf ~/.flutter
rm -rf ~/.fvm
rm -rf ~/.dartserver
rm -rf ~/flutter
rm -rf ~/development/flutter

# 4. 删除当前项目下的 flutter 相关目录
echo "📁 清理当前项目目录中的临时文件..."
rm -rf .dart_tool
rm -rf .fvm
rm -rf .packages
rm -rf pubspec.lock
rm -rf build/

# 5. 删除通过 global activate 安装的 fvm
echo "🚫 反激活全局 fvm（如果已安装）..."
dart pub global deactivate fvm 2>/dev/null

# 6. 清理 PATH 设置和 flutter alias 函数
echo "🧹 清理 PATH 中的 .pub-cache/bin 和 flutter alias..."
for file in ~/.zshrc ~/.bashrc ~/.bash_profile; do
    [[ -f "$file" ]] || continue
    sed -i '' '/\.pub-cache\/bin/d' "$file"
    sed -i '' '/flutter() { fvm flutter/d' "$file"
done

# 7. 让改动立即生效
source ~/.zshrc 2>/dev/null || true
source ~/.bash_profile 2>/dev/null || true
source ~/.bashrc 2>/dev/null || true

echo "✅ 所有 Dart / Flutter / FVM 环境已清除干净"
