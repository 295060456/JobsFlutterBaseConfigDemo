import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(RotaryController()); // 注册控制器

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CustomRxString Demo')),
        body: Center(
          child: Obx(() => Text('Currency ID: ${controller.currencyId.value}')),
        ),
      ),
    );
  }
}

class RotaryController extends GetxController {
  final currencyId = CustomRxString('701'); // 自定义的 RxString

  void someMethod() {
    currencyId.value = '702'; // 触发 setter 打印堆栈
  }

  @override
  void onInit() {
    super.onInit();
    someMethod();
  }
}

class CustomRxString extends RxString {
  CustomRxString(super.initial);

  @override
  set value(dynamic val) {
    super.value = val;
    debugPrint('currencyId setter called');
    debugPrint(StackTrace.current.toString()); // 打印当前这行代码是如何被调用的路径（堆栈）
  }
}
