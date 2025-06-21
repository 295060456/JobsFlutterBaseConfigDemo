#!/bin/zsh

# ===============================
# 🚀 Flutter 项目清理 & 升级脚本
# ===============================

set -e  # 有错误就退出
set -u  # 使用未声明变量时报错

# ========== 🌍 函数定义 ==========
print_section() {
  echo ""
  echo "\033[1;34m🔹 $1...\033[0m"
}

print_success() {
  echo "\033[1;32m✅ $1\033[0m"
}

# ========== 📍 获取当前目录 ==========
print_section "获取当前脚本所在目录"
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR"
print_success "当前目录: $SCRIPT_DIR"

# ========== 🧹 清理项目 ==========
print_section "执行 flutter clean"
fvm flutter clean

# .idea 是 JetBrains 系列 IDE（如 Android Studio、IntelliJ IDEA、PhpStorm 等） 在每个项目中生成的配置文件夹，用于保存项目的本地 IDE 设置。
print_section "删除 .idea 缓存"
rm -rf .idea
print_success ".idea 已删除"

print_section "删除 .dart_tool 缓存"
rm -rf .dart_tool
print_success ".dart_tool 已删除"

# ========== ⏬ 下载 iOS 相关依赖 ==========
print_section "执行 flutter precache --ios"
fvm flutter precache --ios

# ========== 📦 获取 pub 依赖 ==========
print_section "执行 flutter pub get"
fvm flutter pub get

# ========== 🛠️ 自动修复 Dart 建议 ==========
print_section "执行 dart fix --apply"
fvm dart fix --apply

# ========== ⬆️ 升级 Flutter SDK & 依赖 ==========
print_section "执行 flutter upgrade"
fvm flutter upgrade

print_section "执行 flutter pub upgrade --major-versions"
fvm flutter pub upgrade --major-versions

print_success "全部操作完成 ✅"
