import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../pages/page_a.dart';
import '../pages/page_b.dart';
import '../pages/page_c.dart';

class MyTabController extends GetxController {
  var currentIndex = 0.obs;
  final Map<int, Widget> _pages = {};

  Widget get currentWidget => _pages[currentIndex.value] ?? _loadWidget(currentIndex.value);

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  Widget _loadWidget(int index) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const PageA();
        break;
      case 1:
        widget = const PageB();
        break;
      case 2:
        widget = const PageC();
        break;
      default:
        widget = const PageA();
    }
    _pages[index] = widget;
    return widget;
  }
}
