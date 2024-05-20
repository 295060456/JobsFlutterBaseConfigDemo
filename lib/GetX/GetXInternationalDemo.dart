import 'package:flutter/material.dart';
import 'package:get/get.dart';
// 利用GetX做国际化
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Internationalization Demo',
      translations: MyTranslations(), // 指定翻译文件
      locale: const Locale('en', 'US'), // 设置默认语言
      fallbackLocale: const Locale('en', 'US'), // 如果没有指定语言，使用的默认语言
      home: const HomeScreen(),
    );
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World!',
          'greet': 'Welcome, %s!',
        },
        'es_ES': {
          'hello': '¡Hola Mundo!',
          'greet': '¡Bienvenido, %s!',
        },
      };
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internationalization Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello'.tr, // 使用GetX的.tr函数获取翻译后的字符串
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'greet'.trArgs(['John']), // 使用GetX的.trArgs函数传递参数
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

