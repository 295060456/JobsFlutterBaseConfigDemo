import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/pages/Others/Pages.dart';

// 从 PageA 导航到 PageB 使用 Get.to 方法。
// 从 PageB 导航到 PageC 使用 Get.to 方法。
// 在 PageC 中，通过点击按钮，使用 Get.off 方法将 PageB 置于顶层，并关闭当前页面 PageC。
// 这样，PageB 就被置于顶层，PageC 被移除。
void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => const PageA()),
      GetPage(name: '/pageB', page: () => const PageB()),
      GetPage(name: '/pageC', page: () => const PageC()),
    ],
  ));
}
