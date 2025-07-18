import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart'; // 公共测试器路径
import 'BaseLifecycleStateful.dart';

void main() =>
    runApp(const JobsMaterialRunner(JobsPageDemo(), title: '生命周期的监听Demo'));

class JobsPageDemo extends BaseLifecycleStatefulWidget {
  const JobsPageDemo({super.key});

  @override
  State<JobsPageDemo> createState() => _JobsPageDemoState();
}

class _JobsPageDemoState
    extends BaseLifecycleStatefulWidgetState<JobsPageDemo> {
  String status = "等待状态变化".tr;

  @override
  void onAppResumed() {
    setState(() {
      status = "📲 回到前台".tr;
    });
    debugPrint("✅ App 已回到前台".tr);
  }

  @override
  void onAppPaused() {
    setState(() {
      status = "⏸️ 进入后台".tr;
    });
    debugPrint("⛔ App 进入后台".tr);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(status));
  }
}
