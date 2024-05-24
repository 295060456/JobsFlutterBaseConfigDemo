import 'package:get/get.dart';

import '../controllers/global_state_controller.dart';

class LangUtil {
  final GlobalStateController globaController = Get.find<GlobalStateController>();
  String getLangType() {
    return globaController.getLangString();
  }

  bool isZhCn() {
    return globaController.getLangString() == "zh_CN" ? true : false;
  }

  ///葡萄牙语
  bool isPtBr() {
    return globaController.getLangString() == "pt_BR" ? true : false;
  }

  ///越南语
  bool isViVn() {
    return globaController.getLangString() == "vi_VN" ? true : false;
  }

  ///泰语
  bool isTh() {
    return globaController.getLangString() == "th_TH" ? true : false;
  }

  ///印度
  bool isHiIN() {
    return globaController.getLangString() == "hi_IN" ? true : false;
  }


  bool isEnIn() {
    return globaController.getLangString() == "en_US" ? true : false;
  }
}
