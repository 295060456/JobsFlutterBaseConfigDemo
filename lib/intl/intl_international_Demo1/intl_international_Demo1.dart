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

  void _switchLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', ''), // Chinese, no country code
        Locale('en', ''), // English, no country code
        Locale('ja', ''), // Japanese, no country code
      ],
      locale: _locale,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intl Demo'),
          actions: [
            PopupMenuButton<Locale>(
              onSelected: _switchLanguage,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
                const PopupMenuItem<Locale>(
                  value: Locale('zh', ''),
                  child: Text('中文'),
                ),
                const PopupMenuItem<Locale>(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                const PopupMenuItem<Locale>(
                  value: Locale('ja', ''),
                  child: Text('日本語'),
                ),
              ],
              icon: const Icon(Icons.language),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _locale.languageCode == 'zh'
                    ? '你好'
                    : _locale.languageCode == 'ja'
                        ? 'こんにちは'
                        : 'Hello',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
