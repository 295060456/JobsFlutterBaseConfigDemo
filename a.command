#!/bin/zsh

echo "🛠 正在扫描并修复缺失 namespace 的三方依赖..."

# Flutter 项目根目录
FLUTTER_PROJECT_ROOT="$(pwd)"
PUB_CACHE_DIR="$HOME/.pub-cache/hosted/pub.dev"

# 提取所有依赖包名（从 .packages 或 .dart_tool/package_config.json 更保险）
PACKAGE_PATHS=$(find .dart_tool/package_config.json .packages pubspec.lock -type f 2>/dev/null | head -n 1)
if [[ -z "$PACKAGE_PATHS" ]]; then
  echo "❌ 未找到依赖配置文件 (.dart_tool/package_config.json / .packages / pubspec.lock)"
  exit 1
fi

# 遍历 pub-cache 中所有依赖包
find "$PUB_CACHE_DIR" -type f -name "build.gradle" | while read -r GRADLE_FILE; do
  DIR_PATH="$(dirname "$GRADLE_FILE")"
  MANIFEST="$DIR_PATH/src/main/AndroidManifest.xml"

  # 检查是否是 flutter 插件
  if [[ ! -f "$MANIFEST" ]]; then
    continue
  fi

  # 判断 build.gradle 中是否已有 namespace
  if grep -q "namespace" "$GRADLE_FILE"; then
    echo "✅ 已含 namespace: $GRADLE_FILE"
    continue
  fi

  # 从 AndroidManifest.xml 中提取 package
  PACKAGE_NAME=$(grep -oP '(?<=package=")[^"]+' "$MANIFEST" | head -n 1)
  if [[ -z "$PACKAGE_NAME" ]]; then
    echo "⚠️  无法提取 package: $MANIFEST"
    continue
  fi

  # 插入 namespace 到 build.gradle（添加到 android { 后面）
  TMP_FILE=$(mktemp)
  INSERTED=false
  while IFS= read -r line; do
    echo "$line" >> "$TMP_FILE"
    if [[ "$line" =~ "android {" ]] && [[ "$INSERTED" == "false" ]]; then
      echo "    namespace '$PACKAGE_NAME'" >> "$TMP_FILE"
      INSERTED=true
    fi
  done < "$GRADLE_FILE"

  mv "$TMP_FILE" "$GRADLE_FILE"
  echo "🔧 已补全 namespace: $PACKAGE_NAME -> $GRADLE_FILE"
done

echo "✅ 所有插件扫描完成。建议执行 flutter clean && flutter pub get 后再构建。"

