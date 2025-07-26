import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'jobs_controller.dart';

class JobsPage extends GetView<JobsController> {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textCtrl1 = TextEditingController();
    final textCtrl2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Jobs 双向绑定两个输入框')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          // 更新 TextEditingController 的 text（防止无限循环）
          if (textCtrl1.text != controller.text.value) {
            textCtrl1.text = controller.text.value;
            textCtrl1.selection = TextSelection.fromPosition(
              TextPosition(offset: textCtrl1.text.length),
            );
          }

          if (textCtrl2.text != controller.text.value) {
            textCtrl2.text = controller.text.value;
            textCtrl2.selection = TextSelection.fromPosition(
              TextPosition(offset: textCtrl2.text.length),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: textCtrl1,
                decoration: const InputDecoration(labelText: '输入框 1'),
                onChanged: (v) => controller.text.value = v,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textCtrl2,
                decoration: const InputDecoration(labelText: '输入框 2'),
                onChanged: (v) => controller.text.value = v,
              ),
              const SizedBox(height: 20),
              Text('你输入的是：${controller.text.value}'),
            ],
          );
        }),
      ),
    );
  }
}
