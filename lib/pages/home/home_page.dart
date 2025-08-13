import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/string_ext.dart';
import 'package:provider/provider.dart';
import '../../notifier/locale_notifier.dart';
import '../../services/theme_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// J0bs
    final localeNotifier = context.read<LocaleNotifier>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("首页".add("Jobs").tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newLocale = Get.locale?.languageCode == 'zh'
                  ? const Locale('en')
                  : const Locale('zh');
              localeNotifier.updateLocale(newLocale);
              /// J0bs
              Get.updateLocale(newLocale);
            },
          ),
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              final newMode = isDark ? ThemeMode.light : ThemeMode.dark;
              ThemeService.instance.updateTheme(newMode);
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          '欢迎使用统一架构 Flutter App',
          style: TextStyle(fontSize: 50.sp),
        ),
      ),
    );
  }
}
