# Dart 调用 C 实验专用

cmake_minimum_required(VERSION 3.10)
project(ExampleProject)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_STANDARD 11)

# 修改为实际项目中C文件的路径.在CMake中，使用相对路径或绝对路径都是可以的
add_library(example SHARED ./lib/Data/Data.Origin🌍/调用C/example.c) 

# 定位于Flutter工程的ios文件夹，最后执行：cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..