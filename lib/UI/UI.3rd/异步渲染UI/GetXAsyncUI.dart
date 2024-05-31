import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends GetView<RegisterLogic> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterLogic>(
      init: RegisterLogic(),
      id: "register",
      builder: (_) {
        controller.context = context;
        return Scaffold(
          backgroundColor: Colors.white,
          body: _buildView(context),
        );
      },
    );
  }

  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.startTimer();
            },
            child: const Text("Start Timer"),
          ),
          const SizedBox(height: 20),
          Obx(() => Text(
                controller.isUpdated.value
                    ? "Content updated after 5 seconds"
                    : "Press the button to start timer",
                style: const TextStyle(fontSize: 24),
              )),
        ],
      ),
    );
  }
}

class RegisterLogic extends GetxController {
  BuildContext? context;
  var isUpdated = false.obs;

  void startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      isUpdated.value = true;
      update(["register"]);
    });
  }
}