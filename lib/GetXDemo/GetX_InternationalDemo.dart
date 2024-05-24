import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void changeLanguage(Locale locale) {
    Get.updateLocale(locale); // 更新应用语言
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App多语言国际化Demo',
      translations: MyTranslations(), // 指定翻译文件
      locale: const Locale('en', 'US'), // 设置默认语言
      fallbackLocale: const Locale('en', 'US'), // 如果没有指定语言，使用的默认语言
      home: const HomeScreen(key: Key('home')),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: key, // 将 key 赋值给 Scaffold 的 key 参数
      appBar: AppBar(
        title: const Text('Internationalization Demo'),
      ),
      body: GetBuilder<LanguageController>(
        init: LanguageController(), // 初始化GetBuilder并传入控制器
        builder: (controller) {
          return Center(
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
                ElevatedButton(
                  onPressed: () {
                    // 点击按钮时切换语言
                    controller.changeLanguage();
                  },
                  child: const Text('Switch Language'), // 切换语言
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LanguageController extends GetxController {
  void changeLanguage() {
    // 获取当前语言
    var currentLocale = Get.locale;
    // 如果当前语言是英语，则切换到西班牙语，否则切换回英语
    Get.updateLocale(currentLocale!.languageCode == 'en' ? const Locale('es', 'ES') : const Locale('en', 'US'));
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
