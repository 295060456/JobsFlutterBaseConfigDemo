import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

// PageA
class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/pageB');
          },
          child: const Text('Go to Page B'),
        ),
      ),
    );
  }
}

// PageB
class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page B')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/pageC');
          },
          child: const Text('Go to Page C'),
        ),
      ),
    );
  }
}

// PageC
class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page C')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 使用命名路由将 PageB 置于顶层，并关闭当前页面 PageC
            Get.offNamed('/pageB');
          },
          child: const Text('Back to Page B'),
        ),
      ),
    );
  }
}
