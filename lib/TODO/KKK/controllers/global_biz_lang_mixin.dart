
import 'package:get/get.dart';

//多语言相关mixin,
mixin GlobalBizLangMixin{
  final langType = 2.obs;

  ///是否是中文
  bool isChinese() {
    return langType.value == 1;
  }

  ///是否是越南语
  bool isVi() {
    return langType.value == 4;
  }

  ///是否是泰语
  bool isThai() {
    return langType.value == 5;
  }

  ///是否是葡语
  bool isPt() {
    return langType.value == 3;
  }

  ///是否是印度语
  bool isHi() {
    return langType.value == 6;
  }




  String getLangString() {
    if (langType.value == 1) {
      return 'zh_CN';
    } else if (langType.value == 2) {
      return 'en_US';
    } else if (langType.value == 3) {
      return 'pt_BR';
    } else if (langType.value == 4) {
      return 'vi_VN';
    } else if (langType.value == 5) {
      return 'th_TH';
    } else if (langType.value == 6) {
      return 'hi_IN';
    } else {
      return 'en_US';
    }
  }

  String getLangSimpleString() {
    if (langType.value == 1) {
      return 'zh';
    } else if (langType.value == 2) {
      return 'en';
    } else if (langType.value == 3) {
      return 'pt';
    } else if (langType.value == 4) {
      return 'vi';
    } else if (langType.value == 5) {
      return 'th';
    } else if (langType.value == 6) {
      return 'hi';
    } else {
      return 'en';
    }
  }

  String getLangCode() {
    if (langType.value == 1) {
      return '+86';
    } else if (langType.value == 2) {
      return '+1';
    } else if (langType.value == 3) {
      return '+55';
    } else if (langType.value == 4) {
      return '+84';
    } else if (langType.value == 5) {
      return '+66';
    } else if (langType.value == 6) {
      return '+91';
    } else {
      return '+1';
    }
  }
}