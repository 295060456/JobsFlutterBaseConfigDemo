

import 'dart:ui';

enum AppLanguageType{
  language_cn(type: 1,name:"中文",locale: Locale('zh","CN')),
  language_english(type: 2,name:"English",locale: Locale('en","US')),
  language_portuguese(type: 3,name:"Portuguese",locale: Locale('zh","CN')),
  language_vietnamese(type: 4,name:"Vietnamese",locale: Locale('zh","CN'));
  final int type;
  final String name;
  final Locale locale;
  const AppLanguageType({required this.type, required this.name, required this.locale});
}