import 'package:get/get.dart';

import '../controllers/pageB_controllers.dart';

class PageaBuinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageBControllers>(
      () => PageBControllers(),
    );
  }
}