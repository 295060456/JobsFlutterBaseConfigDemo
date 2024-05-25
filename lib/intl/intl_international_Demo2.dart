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
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
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