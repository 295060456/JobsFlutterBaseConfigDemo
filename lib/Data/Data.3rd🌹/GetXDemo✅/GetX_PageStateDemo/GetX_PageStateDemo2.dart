import 'package:flutter/material.dart';
import 'package:get/get.dart';
// https://github.com/jonataslaw/getx
// 这个类给我们演示了如何使用 GetX 来管理状态，并自动更新 UI。
void main() {
  runApp(MyApp());
}

class CounterController extends GetxController {
  var count = 0.obs; // 使用 RxInt 包装计数器变量

  void increment() {
    count++; // 自动触发 UI 更新
  }
}

class MyApp extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  MyApp({super.key});

  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Demo'),
        ),
        body: Center(
          // 使用 Obx 来获取状态并自动更新 UI
          child: Obx(() => Text(
            'Count: ${counterController.count.value}',
            style: const TextStyle(fontSize: 24),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 调用控制器的增加计数器方法
            counterController.increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
