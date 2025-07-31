import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/GetXDemo/GetxController%E7%9A%84%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F/LifecycleController.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/GetXDemo/GetxController%E7%9A%84%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F/SecondPage.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';

void main() =>
    runApp(JobsGetRunner(LifecycleDemoPage(), title: 'GetxController的生命周期演示'));

class LifecycleDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LifecycleController>(
      init: LifecycleController(),
      builder: (_) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => SecondPage());
            },
            child: Text('跳转到第二页'),
          ),
        );
      },
    );
  }
}



