import 'package:get/get.dart';

import '../../controllers/global_state_controller.dart';
import 'logic.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashLogic());
    Get.put(GlobalStateController());
  }
}
