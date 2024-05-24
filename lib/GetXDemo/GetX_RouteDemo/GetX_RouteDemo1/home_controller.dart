import 'package:get/get.dart';
// 包含一个可观察的变量count和一个方法increment来增加count的值
class HomeController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}
