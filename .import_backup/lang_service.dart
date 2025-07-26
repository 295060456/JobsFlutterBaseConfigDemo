import 'dart:ui';
import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/%E6%9C%AC%E5%9C%B0%E6%95%B0%E6%8D%AE%E5%AD%98%E5%8F%96/sp_util.dart';

/// 自动切换语言、持久化
class LangService {
  static final LangService instance = LangService._();
  LangService._();

  static const _langKey = 'app_language';

  Locale get defaultLocale => const Locale('zh');

  Future<void> init() async {
    final code = await SpUtil.getString(_langKey);
    if (code == null) return;
    updateLocale(Locale(code));
  }

  void updateLocale(Locale locale) {
    SpUtil.setString(_langKey, locale.languageCode);
  }
}
