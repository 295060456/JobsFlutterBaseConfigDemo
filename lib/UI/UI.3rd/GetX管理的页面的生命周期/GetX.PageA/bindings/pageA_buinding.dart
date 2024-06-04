import 'package:get/get.dart';

import '../controllers/pageA_controllers.dart';

class PageaBuinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageAControllers>(
      () => PageAControllers(),
    );
  }
}