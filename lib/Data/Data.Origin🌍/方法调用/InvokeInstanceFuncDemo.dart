import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // 定义GlobalKey
  final GlobalKey<_AState> aKey = GlobalKey<_AState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //其他地方用这个aKey
    // Get.put(aKey);
    // final GlobalKey<_AState> aKey = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          A(key: aKey),
          ElevatedButton(
            onPressed: () {
              // 通过GlobalKey调用实例方法
              aKey.currentState?.dd();
            },
            child: const Text('Call Instance Method'),
          ),
        ],
      ),
    );
  }
}

class A extends StatefulWidget {
  const A({super.key});

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  void dd() {
    debugPrint("sss");
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Main Page Content'),
    );
  }
}
