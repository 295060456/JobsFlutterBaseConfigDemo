import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/pages/Others/Pages.dart';

class MyTabCtrl extends GetxController {
  var currentIndex = 0.obs;
  Widget? pageA = PageA();
  Widget? pageB = PageB();
  Widget? pageC = PageC();
  final Map<int, Widget> _pages = {};

  Widget get currentWidget =>
      _pages[currentIndex.value] ?? _loadWidget(currentIndex.value);

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // 初始加载第一页
    changeTabIndex(0);
  }

  Widget _loadWidget(int index) {
    Widget widget;
    switch (index) {
      case 0:
        widget = PageA(
          onTap: () {
            if (Get.isRegistered<MyTabCtrl>()) {
              Get.find<MyTabCtrl>().changeTabIndex(1); // 跳转到 PageB tab
            }
            Future.microtask(() {
              Get.to(() => const PageB()); // 👈 免路由表跳转
            });
          },
          buttonChild: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward),
              SizedBox(width: 8),
              Text('跳转到 B 页面'.tr),
            ],
          ),
        );
        break;
      case 1:
        widget = PageB(
          onTap: () {
            if (Get.isRegistered<MyTabCtrl>()) {
              Get.find<MyTabCtrl>().changeTabIndex(2); // 跳转到 PageB tab
            }
            Future.microtask(() {
              Get.to(() => const PageC()); // 👈 免路由表跳转
            });
          },
          buttonChild: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward),
              SizedBox(width: 8),
              Text('跳转到 C 页面'.tr),
            ],
          ),
        );
        break;
      case 2:
        widget = PageC(
          onTap: () {
            if (Get.isRegistered<MyTabCtrl>()) {
              Get.find<MyTabCtrl>().changeTabIndex(0); // 跳转到 PageB tab
              Get.to(() => const PageA()); // 👈 免路由表跳转
            }
          },
          buttonChild: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward),
              SizedBox(width: 8),
              Text('跳转到 B 页面'.tr),
            ],
          ),
        );
        break;
      default:
        widget = PageA(
          onTap: () {
            if (Get.isRegistered<MyTabCtrl>()) {
              Get.find<MyTabCtrl>().changeTabIndex(1); // 跳转到 PageB tab
            }
            Future.microtask(() {
              Get.to(() => const PageB()); // 👈 免路由表跳转
            });
          },
          buttonChild: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward),
              SizedBox(width: 8),
              Text('跳转到 B 页面'.tr),
            ],
          ),
        );
    }
    _pages[index] = widget;
    return widget;
  }
}
