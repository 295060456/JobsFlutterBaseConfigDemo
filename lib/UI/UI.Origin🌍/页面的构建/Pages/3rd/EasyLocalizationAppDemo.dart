import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('zh')],
      path: 'assets/translations', // 👈 你需要准备 json 翻译文件
      fallbackLocale: const Locale('en'),
      child: const EasyLocalizationAppDemo(),
    ),
  );
}

class EasyLocalizationAppDemo extends StatelessWidget {
  const EasyLocalizationAppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('EasyLocalization')),
        body: Center(
          child: Text(
            '🌐 EasyLocalization 提供多语言支持\n'
            '• 使用 context.tr() 自动翻译\n'
            '• 配置 path 和 Locale 即可',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
