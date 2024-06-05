import 'package:get/get.dart';

import '../controllers/pageB_controllers.dart';

class PagebBuinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageBControllers>(
      () => PageBControllers(),
    );
  }
}