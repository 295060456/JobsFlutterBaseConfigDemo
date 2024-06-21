import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobs_flutter_base_config/Tools.dart';

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
  static const platform = MethodChannel('com.example/simulator');
  late DynamicLibrary dylib;
  bool isLibraryLoaded = false;

  @override
  void initState() {
    super.initState();
    checkIfSimulator().then((isSimulator) {
      try {
        JobsPrint('Running on iOS Simulator: $isSimulator');
         if (Platform.isIOS) {
          JobsPrint('Loading libexample_universal.dylib');
          /// iOS Simulator + iOS Device
          dylib = DynamicLibrary.open('libexample_universal.dylib');
        } else if (Platform.isMacOS) {
          dylib = DynamicLibrary.open('libexample.dylib');
        } else if (Platform.isLinux) {
          dylib = DynamicLibrary.open('libexample.so');
        } else if (Platform.isWindows) {
          dylib = DynamicLibrary.open('example.dll');
        }
        setState(() {
          isLibraryLoaded = true;
        });
      } catch (e) {
        JobsPrint('Failed to load dynamic library: $e');
      }
    });
  }

  Future<bool> checkIfSimulator() async {
    try {
      final bool isSimulator = await platform.invokeMethod('isSimulator');
      JobsPrint('isSimulator method result: $isSimulator');
      return isSimulator;
    } on PlatformException catch (e) {
      JobsPrint("Failed to check if simulator: '${e.message}'.");
      return false;
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
