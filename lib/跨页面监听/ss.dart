import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/form_controller.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';
// flutter的demo，界面上有2个输入框，一个按钮。要求输入框有值的情况下，按钮才能按。
// 按钮点击事件是发出手机震动
// 状态管理用getx

// 按钮和输入框要进行封装成2个不同的类
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final FormController formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter GetX Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: formController.firstTextController,
              hintText: 'Enter first value',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: formController.secondTextController,
              hintText: 'Enter second value',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: formController.onButtonPressed,
              isButtonEnabled: formController.isButtonEnabled,
            ),
          ],
        ),
      ),
    );
  }
}
