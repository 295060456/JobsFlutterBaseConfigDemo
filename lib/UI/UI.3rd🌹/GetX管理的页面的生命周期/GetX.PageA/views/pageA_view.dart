import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GetX.PageB/views/pageB_view.dart';
import '../controllers/pageA_controllers.dart';

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
