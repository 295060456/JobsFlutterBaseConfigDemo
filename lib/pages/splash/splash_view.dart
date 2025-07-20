import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsSafeArea/JobsSafeArea.dart';
import '../home/home_page.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ 延迟跳转到首页
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAll(() => const HomePage());
    });

    return Scaffold(
      body: JobsSafeArea(
        body: Center(
          child: Text(
            '正在加载中...'.tr,
            style: TextStyle(fontSize: 50.sp),
          ),
        ),
      ),
    );
  }
}
