import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.Origin%F0%9F%8C%8D/TabBar%E5%88%87%E6%8D%A2/Common/MyTabCtrl.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTabCtrl>(() => MyTabCtrl());
  }
}
