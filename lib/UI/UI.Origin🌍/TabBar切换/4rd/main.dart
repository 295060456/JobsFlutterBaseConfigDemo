import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final HomeController homeController;
    if (Get.isRegistered<HomeController>()) {
      homeController = Get.find<HomeController>();
    }
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: homeController.currentIndex.value,
          children: [
            homeController.pageA ?? Container(),
            homeController.pageB ?? Container(),
            homeController.pageC ?? Container(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: homeController.currentIndex.value,
            onTap: (index) {
              homeController.changeTabIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A'),
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'B'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'C'),
            ],
          )),
    );
  }
}
