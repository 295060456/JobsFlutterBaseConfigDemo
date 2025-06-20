#! /bin/sh

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory
cd $current_directory/android

# 关闭所有iOS模拟器
xcrun simctl shutdown all
# 检查是否有iOS模拟器进程存在(存在即杀进程)
if pgrep -f 'Simulator' >/dev/null; then
    # 如果有，则会杀死所有包含"Simulator"字符串的进程
    osascript -e 'quit app "Simulator"'
    echo "iOS模拟器进程已终止"
else
    echo "没有找到iOS模拟器进程"
fi

# 打开xcode模拟器
open -a Simulator

# 打开Android Studio
open -a "Android Studio" $current_directory
