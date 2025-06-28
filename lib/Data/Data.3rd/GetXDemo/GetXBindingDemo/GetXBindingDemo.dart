import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CounterPage.dart';
import 'CounterBinding.dart';

// 启动时注入 binding + view
void main() {
  runApp(
    GetMaterialApp(
      initialBinding: CounterBinding(), // 注册依赖
      home: const CounterPage(), // 页面 UI
    ),
  );
}
