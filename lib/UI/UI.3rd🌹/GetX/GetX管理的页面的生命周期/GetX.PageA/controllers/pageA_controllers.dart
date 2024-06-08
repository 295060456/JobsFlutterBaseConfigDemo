import 'package:get/get.dart';

class PageAControllers extends GetxController {

  final ok = true.obs; 

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void reverse (){
    ok.value = !ok.value;
  }

  String changeText() {
    return "qqq";
  }
}
