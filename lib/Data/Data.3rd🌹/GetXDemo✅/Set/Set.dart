
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  final controller = RotaryController();
  controller.onInit(); // 初始化控制器
}

class CustomRxString extends RxString {
  CustomRxString(super.initial);

  @override
  set value(dynamic val) {
    super.value = val;
    // 打印调用堆栈信息
    debugPrint('currencyId setter called');
    debugPrint(StackTrace.current.toString()); // 将调用堆栈信息转换为字符串类型
  }
}

class RotaryController extends GetxController {
  final currencyId = CustomRxString('701'); // 使用自定义的 RxString

  void someMethod() {
    currencyId.value = '702'; // 调用自定义的 setter 方法
  }

  @override
  void onInit() {
    super.onInit();
    someMethod();
  }
}


