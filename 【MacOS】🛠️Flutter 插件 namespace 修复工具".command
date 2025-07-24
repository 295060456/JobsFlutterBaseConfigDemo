#!/bin/zsh
# 自动修复 pub 缓存中缺失 namespace 的插件（支持 Groovy 和 Kotlin DSL，插入到 android 块）

# ========== 自述 ==========
clear
echo "🛠️ Flutter 插件 namespace 修复工具"
echo "===================================================================="
echo "✅ 功能说明："
echo "   ➤ 查找 .pub-cache 中所有插件的 build.gradle / build.gradle.kts"
echo "   ➤ 如果缺少 namespace 字段，将根据 AndroidManifest.xml 中的 package 自动添加"
echo "   ➤ namespace 将自动插入到 android { ... } 块内部"
echo "   ➤ 同时兼容 Groovy（.gradle）与 Kotlin DSL（.gradle.kts）"
echo "===================================================================="
echo ""
read "?📎 按回车开始修复（或输入任意内容 + 回车退出）：" confirm
if [[ -n "$confirm" ]]; then
  echo "❌ 已取消执行"
  exit 0
fi

# ========== 扫描并修复 ==========
echo "🔍 正在查找缺失 namespace 的插件模块..."

find "$HOME/.pub-cache/hosted" -type f \( -name "build.gradle" -o -name "build.gradle.kts" \) | while read -r file; do
  # 跳过已包含 namespace 的
  if grep -q "namespace" "$file"; then
    continue
  fi

  manifest_file="$(dirname "$file")/src/main/AndroidManifest.xml"
  if [[ ! -f "$manifest_file" ]]; then
    continue
  fi

  # 提取 package 名
  package_name=$(grep "package=" "$manifest_file" | head -n 1 | sed -E 's/.*package="([^"]+)".*/\1/')
  if [[ -z "$package_name" ]]; then
    continue
  fi

  echo "🛠️ 修复: $file"

  # 插入 namespace 到 android { 内部
  if [[ "$file" == *.kts ]]; then
    # Kotlin DSL 插入
    sed -i '' "/android[[:space:]]*{/a\\
    namespace = \"$package_name\"
    " "$file"
  else
    # Groovy 插入
    sed -i '' "/android[[:space:]]*{/a\\
    namespace '$package_name'
    " "$file"
  fi
done

echo ""
echo "✅ 所有插件修复完成，请重新执行打包命令"
