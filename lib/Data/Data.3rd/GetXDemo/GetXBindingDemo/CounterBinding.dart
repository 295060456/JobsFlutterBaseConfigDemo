import 'package:get/get.dart';
import 'Controller.dart';

/// 注册 Controller
class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
