#include <stdio.h>

void helloFromC() {
    printf("Jobs,Hello from C!\n");
}

/// Linux 上 编译成动态库。编译后的文件名：libexample.so
// gcc -shared -o libexample.so -fPIC example.c
/// macOS 上 编译成动态库。编译后的文件名：libexample.dylib
// gcc -shared -o libexample.dylib -fPIC example.c
/// 为iOS设备生成动态库
// xcrun --sdk iphoneos clang -arch arm64 -shared -o libexample_ios.dylib -fPIC example.c
/// 为iOS模拟器生成动态库
// xcrun --sdk iphonesimulator clang -arch x86_64 -shared -o libexample_sim.dylib -fPIC example.c
/// Windows 上 编译成动态库。编译后的文件名：example.dll
// gcc -shared -o example.dll -Wl,--out-implib,libexample.a example.c

// 将动态库复制到Flutter项目中：
// 对于macOS：cp libexample.dylib <flutter_project_path>/ios
// 对于Linux：cp libexample.so <flutter_project_path>/android/app/src/main/jniLibs/
// 对于Windows：cp example.dll <flutter_project_path>/windows

// 配置Xcode：
// 打开你的Flutter项目的 ios/Runner.xcworkspace。
// 在Xcode中，右键点击 Runner 项目，选择 Add Files to "Runner"...。
// 选择 libexample.dylib 文件并添加它。
// 在Xcode的 Build Phases 中，确保 libexample.dylib 被包含在 Link Binary With Libraries 部分。
