import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../UI.3rd🌹/GetX管理的页面的生命周期/GetX.PageB/views/pageB_view.dart';
import '../../../../UI.3rd🌹/GetX管理的页面的生命周期/GetX.PageA/controllers/pageA_controllers.dart';

class PageAView extends GetView<PageAControllers> {
  const PageAView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const PageBView());
          },
          child: const Text('Go to Page B'),
        ),
      ),
    );
  }
}
