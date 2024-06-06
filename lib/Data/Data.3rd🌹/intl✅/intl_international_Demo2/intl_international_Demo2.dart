import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('zh', '');

  void _switchLanguage() {
    setState(() {
      _locale = _locale == const Locale('zh', '')
          ? const Locale('en', '')
          : const Locale('zh', '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        // 提供 Material 设计组件的本地化资源。包括诸如按钮、对话框、日期选择器等在内的各种组件的本地化字符串。
        GlobalMaterialLocalizations.delegate,
        // 提供基本的小部件（widget）的本地化支持。这些小部件包括 TextField 的提示文本等。
        GlobalWidgetsLocalizations.delegate,
        // 提供 Cupertino（iOS 风格）组件的本地化支持。包括 iOS 风格的日期选择器、对话框等的本地化字符串。
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', ''), // Chinese, no country code
        Locale('en', ''), // English, no country code
      ],
      locale: _locale,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intl Demo'),
          actions: [
            IconButton(
              onPressed: _switchLanguage,
              icon: const Icon(Icons.language),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                // Use localeName for API levels below 33
                _locale.languageCode == 'zh' ? '你好' : 'Hello',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}