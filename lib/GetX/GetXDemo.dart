import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
