#! /bin/sh

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory
cd $current_directory

fvm flutter pub outdated # 查看当前项目中依赖包的版本状态（是否过期）
# major（主版本）
# minor（次版本）
# patch（补丁）
fvm flutter pub upgrade --major-versions # 强制升级依赖到最新可用的大版本（可能是破坏性更新）
