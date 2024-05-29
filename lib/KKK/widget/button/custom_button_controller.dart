import 'package:flutter/foundation.dart';

class CustomButtonController {
  final List<VoidCallback> listeners = [];
  bool isShowAnimation = false;

  Future<void> showAnimation() async {
    isShowAnimation = true;
    for (VoidCallback listener in listeners) {
      listener();
    }
  }

  Future<void> hideAnimation() async {
    isShowAnimation = false;
    for (VoidCallback listener in listeners) {
      listener();
    }
  }

  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  void removeListener() {
    listeners.clear();
  }
}
