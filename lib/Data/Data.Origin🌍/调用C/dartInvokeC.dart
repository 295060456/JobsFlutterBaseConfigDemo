import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/Tools.dart';

// 定义与C函数相对应的类型
typedef HelloFromCFunc = Void Function();
typedef HelloFromCDart = void Function();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DynamicLibrary dylib;
  bool isLibraryLoaded = false;

  @override
  void initState() {
    super.initState();
    try {
      if (Platform.isIOS) {
        if (Platform.environment.containsKey('SIMULATOR_DEVICE_NAME')) {
          dylib = DynamicLibrary.open('Frameworks/libexample_sim.dylib');
        } else {
          dylib = DynamicLibrary.open('Frameworks/libexample_ios.dylib');
        }
      } else if (Platform.isMacOS) {
        dylib = DynamicLibrary.open('libexample.dylib');
      } else if (Platform.isLinux) {
        dylib = DynamicLibrary.open('libexample.so');
      } else if (Platform.isWindows) {
        dylib = DynamicLibrary.open('example.dll');
      }
      isLibraryLoaded = true;
    } catch (e) {
      JobsPrint('Failed to load dynamic library: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter FFI Example'),
      ),
      body: Center(
        child: isLibraryLoaded
            ? ElevatedButton(
                onPressed: () {
                  // 在按钮点击时调用C函数
                  final HelloFromCDart helloFromC = dylib
                      .lookup<NativeFunction<HelloFromCFunc>>('helloFromC')
                      .asFunction();
                  helloFromC();
                },
                child: const Text('Call C Function'),
              )
            : const Text('Failed to load dynamic library'),
      ),
    );
  }
}
