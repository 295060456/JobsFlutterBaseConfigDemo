#! /bin/sh

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory
cd $current_directory
# 执行项目清理
flutter clean
# 预先下载和缓存 iOS 构建所需的工具和依赖项
flutter precache --ios
# 重新下载依赖包
flutter pub get
