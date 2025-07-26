import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/PopScope%E7%9B%91%E5%90%AC%E5%92%8C%E8%87%AA%E5%AE%9A%E4%B9%89%E8%BF%94%E5%9B%9E%E6%8C%89%E9%92%AE%E8%A1%8C%E4%B8%BA/PopConfirmWrapper.dart';
import 'package:jobs_flutter_base_config/core/app_config.dart';
import 'package:jobs_flutter_base_config/pages/Others/Pages.dart';

// 点击按钮以后：跳转到 PageC
// 在PageC点击导航栏返回键，会出现一个弹窗，点击确定才可以真正的返回
void main() => runApp(JobsGetRunner(const MyPage(), title: '自定义 PopScope 示例'));

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopConfirmWrapper(
      child: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(() => const PageC()),
          child: Text('跳转到 PageC', style: normalTextStyle()),
        ),
      ),
    );
  }
}
