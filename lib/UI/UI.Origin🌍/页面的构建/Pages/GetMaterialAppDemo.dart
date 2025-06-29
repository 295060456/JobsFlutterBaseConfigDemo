import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialAppDemo());
}

class GetMaterialAppDemo extends StatelessWidget {
  const GetMaterialAppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      /// 是否显示右上角的红色 DEBUG 标识（横幅）
      home: GetCounterPage(),
    );
  }
}

class CounterController extends GetxController {
  var count = 0.obs;
  void increment() => count++;
}

class GetCounterPage extends StatelessWidget {
  final controller = Get.put(CounterController());

  GetCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetMaterialApp 示例')),
      body: Center(
        child: Obx(() => Text(
            '点击次数: ${controller.count}\n'
            '🆚 GetMaterialApp 相比 MaterialApp：\n'
            '• 内建路由、状态管理、依赖注入\n'
            '• 使用 Obx 实现响应式，无需 setState\n'
            '• Get.put() 自动注入控制器，无需手动管理生命周期',
            style: const TextStyle(fontSize: 20))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
