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
        switch (tabController.currentIndex.value) {
          case 0:
            return tabController.pageA ??= const LazyLoadWidget('PageA');
          case 1:
            return tabController.pageB ??= const LazyLoadWidget('PageB');
          case 2:
            return tabController.pageC ??= const LazyLoadWidget('PageC');
          default:
            return tabController.pageA ??= const LazyLoadWidget('PageA');
        }
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

class LazyLoadWidget extends StatelessWidget {
  final String page;

  const LazyLoadWidget(this.page, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (page == 'PageA') {
            return const PageA();
          } else if (page == 'PageB') {
            return const PageB();
          } else if (page == 'PageC') {
            return const PageC();
          } else {
            return const Center(child: Text('Unknown page'));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page A'),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page B'),
    );
  }
}

class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page C'),
    );
  }
}
