#!/bin/sh

# ✅ 临时加上 fvm 所在目录，防止找不到命令
export PATH="$HOME/.pub-cache/bin:$PATH"

# ✅ 获取当前脚本目录（macOS 上 readlink -f 不支持，改为通用写法）
current_directory=$(cd "$(dirname "$0")" && pwd)
echo "📁 当前目录：$current_directory"
cd "$current_directory" || exit 1

# ✅ 查看当前依赖包的版本状态（是否过期）
fvm flutter pub outdated

# ✅ 强制升级依赖到最新大版本（注意可能破坏性升级）
fvm flutter pub upgrade --major-versions
