import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../pages/page_a.dart';
import '../pages/page_b.dart';
import '../pages/page_c.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  Widget? pageA;
  Widget? pageB;
  Widget? pageC;

  @override
  void onInit() {
    super.onInit();
    // 初始加载第一页
    changeTabIndex(0);
  }

  void changeTabIndex(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        pageA ??= const PageA();
        break;
      case 1:
        pageB ??= const PageB();
        break;
      case 2:
        pageC ??= const PageC();
        break;
    }
  }
}
