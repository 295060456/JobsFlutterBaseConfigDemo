import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bet/constant/app_cache_key.dart';
import 'package:flutter_bet/utils/sp_util.dart';
import 'package:get/get.dart';

import '../model/language/lang_config_api_model.dart';

class LangService {
  factory LangService() => _getInstance();

  static LangService get sharedInstance => _getInstance();
  static LangService? _instance;
  LangType _langType = LangType.en;

  LangService._internal() {
    // 初始化
    initAsync();
  }

  // 获取对象
  static LangService _getInstance() {
    _instance ??= LangService._internal();
    return _instance!;
  }

  /// 异步初始化
  Future initAsync() async {
    ///先读缓存
    int? cacheType = SPUtil().getInt(CacheKey.langType);
    if (cacheType != null) {
      if (cacheType == LangType.zhCN.toValue) {
        _langType = LangType.zhCN;
      } else if (cacheType == LangType.en.toValue) {
        _langType = LangType.en;
      } else if (cacheType == LangType.vi.toValue) {
        _langType = LangType.vi;
      } else if (cacheType == LangType.pt.toValue) {
        _langType = LangType.pt;
      } else if (cacheType == LangType.th.toValue) {
        _langType = LangType.th;
      } else if (cacheType == LangType.hi.toValue) {
        _langType = LangType.hi;
      } else {
        _langType = LangType.en;
      }
      return;
    } else {
      ///首次登录
      String deviceLocale = Get.deviceLocale.toString();
      if (deviceLocale.contains('zh')) {
        _langType = LangType.zhCN;
      } else if (deviceLocale.contains('en')) {
        _langType = LangType.en;
      } else if (deviceLocale.contains('pt')) {
        _langType = LangType.pt;
      } else if (deviceLocale.contains('vi')) {
        _langType = LangType.vi;
      } else if (deviceLocale.contains('th')) {
        _langType = LangType.th;
      } else if (deviceLocale.contains('IN')) {
        _langType = LangType.hi;
      } else {
        _langType = LangType.en;
      }
      SPUtil().setInt(CacheKey.langType, lang.toValue);
      SPUtil().setString(CacheKey.langString, lang.toDisplayName);
    }
  }

  LangType get lang {
    return _langType;
  }

  ///判断是否是中文
  bool get isChinese => _langType == LangType.zhCN;

  ///判断是中文 或者英文
  bool get isChOrEn => _langType == LangType.zhCN || _langType == LangType.en;

  ///判断是越南 或者泰语【多语言适配 有时需要到】
  bool get isViOrTh => _langType == LangType.vi || _langType == LangType.th;

  bool get isVi => _langType == LangType.vi;

  bool get isTh => _langType == LangType.th;

  ///是否印度语
  bool get isHi => _langType == LangType.hi;

  ///判断是否非中文
  bool get isNonChinese => _langType != LangType.zhCN;

  ///切换语言
  Future<void> switchLang(LangType type) async {
    _langType = type;
  }

  String getConfigLabel(LangConfigApiModel configModel) {
    String result = "";
    switch (_langType) {
      case LangType.zhCN:
        result = configModel.zhCn ?? "";
        break;
      case LangType.pt:
        result = configModel.ptBr ?? "";
        break;
      case LangType.vi:
        result = configModel.viVn ?? "";
        break;
      case LangType.th:
        result = configModel.thTh ?? "";
        break;
      case LangType.en:
        result = configModel.enUs ?? "";
        break;
      case LangType.hi:
        result = configModel.hiIn ?? "";
        break;
      default:
        result = configModel.enUs ?? "";
        break;
    }
    return result;
  }
}

enum LangType {
  zhCN(label: zh_CN_label), //中文
  en(label: en_US_label), //英文
  pt(label: pt_BR_label), //葡萄牙
  vi(label: vi_VN_label), //越南
  th(label: th_TH_label), //泰语
  hi(label: hi_IN_label); //印地语

  // * 处理跳转自定义链接
  // * 1.没带http开头的链接，前端自己将当前域名+语言+自定义链接组合成完整的url
  // * 2.带了http开头的链接，不需要组合
  static const String zh_CN_label = "zh_CN";
  static const String pt_BR_label = "pt_BR";
  static const String vi_VN_label = "vi_VN";
  static const String th_TH_label = "th_TH";
  static const String en_US_label = "en_US";
  static const String hi_IN_label = "hi_IN";
  final String label;

  const LangType({required this.label});
}

extension LangTypeExtension on LangType {
  int get toValue {
    switch (this) {
      case LangType.zhCN:
        return 1;
      case LangType.en:
        return 2;
      case LangType.pt:
        return 3;
      case LangType.vi:
        return 4;
      case LangType.th:
        return 5;
      case LangType.hi:
        return 6;
      default:
        return 2;
    }
  }

  String get toDisplayName {
    switch (this) {
      case LangType.zhCN:
        return '中文';
      case LangType.en:
        return 'English';
      case LangType.pt:
        return 'Português';
      case LangType.vi:
        return 'Tiếng Việt';
      case LangType.th:
        return 'ภาษาไทย';
      case LangType.hi:
        return 'हिंदी';
      default:
        return 'English';
    }
  }

  Locale get toLocaleValue {
    switch (this) {
      case LangType.zhCN:
        return const Locale("zh", "CN");
      case LangType.en:
        return const Locale("en", "US");
      case LangType.pt:
        return const Locale("pt", "BR");
      case LangType.vi:
        return const Locale("vi", "VN");
      case LangType.th:
        return const Locale("th", "TH");
      case LangType.hi:
        return const Locale("hi", "IN");
      default:
        return const Locale("en", "US");
    }
  }

  String get toTimeZoneValue {
    switch (this) {
      case LangType.zhCN:
        return LangType.zh_CN_label;
      case LangType.en:
        return LangType.en_US_label;
      case LangType.pt:
        return LangType.pt_BR_label;
      case LangType.vi:
        return LangType.vi_VN_label;
      case LangType.th:
        return LangType.th_TH_label;
      case LangType.hi:
        return LangType.hi_IN_label;
      default:
        return LangType.en_US_label;
    }
  }
}

typedef AccountServiceOnLangChange = Function();

class AccountServiceListener {
  AccountServiceOnLangChange? accountServiceOnLangChange;

  AccountServiceListener({this.accountServiceOnLangChange});
}
