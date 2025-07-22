import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.3rd%F0%9F%8C%B9/GetX/GetXTool.dart'
    show getOrPut;
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.Origin%F0%9F%8C%8D/TabBar%E5%88%87%E6%8D%A2/Common/MyTabCtrl.dart';

void main() {
  runApp(JobsGetRunner.builder(
    title: '简单测试'.tr,
    bindings: BindingsBuilder(() {
      Get.put(MyTabCtrl(), permanent: true); // ✅ 注册为全局唯一控制器
    }),
    builder: (ctx) => Center(
      child: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  late final MyTabCtrl tabController = getOrPut(() => MyTabCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: tabController.currentIndex.value,
          children: [
            tabController.pageA ?? Container(),
            tabController.pageB ?? Container(),
            tabController.pageC ?? Container(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: tabController.currentIndex.value,
            onTap: tabController.changeTabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A'),
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'B'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'C'),
            ],
          )),
    );
  }
}
