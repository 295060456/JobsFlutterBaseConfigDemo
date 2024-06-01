import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyTabController extends GetxController {
  var currentIndex = 0.obs;
  Widget? pageA;
  Widget? pageB;
  Widget? pageC;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
