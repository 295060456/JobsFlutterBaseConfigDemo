import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_tab_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final MyTabController tabController = Get.put(MyTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return tabController.currentWidget;
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: tabController.currentIndex.value,
            onTap: tabController.changeTabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A'),
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'B'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'C'),
            ],
          )),
    );
  }
}
