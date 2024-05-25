import 'package:flutter/material.dart';

List<PopupMenuEntry<Locale>> getLocaleMenuItems() {
  return const <PopupMenuEntry<Locale>>[
    PopupMenuItem<Locale>(
      value: Locale('zh', ''),
      child: Text('中文'),
    ),
    PopupMenuItem<Locale>(
      value: Locale('en', ''),
      child: Text('English'),
    ),
    PopupMenuItem<Locale>(
      value: Locale('ja', ''),
      child: Text('日本語'),
    ),
  ];
}