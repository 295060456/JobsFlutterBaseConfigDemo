import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.3rd%F0%9F%8C%B9/GetX/%F0%9F%92%A5GetX%E7%9A%84%E5%80%BC%E5%8F%8C%E5%90%91%E7%BB%91%E5%AE%9A/Counter/jobs_binding.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.3rd%F0%9F%8C%B9/GetX/%F0%9F%92%A5GetX%E7%9A%84%E5%80%BC%E5%8F%8C%E5%90%91%E7%BB%91%E5%AE%9A/Counter/jobs_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/jobs',
      getPages: [
        GetPage(
          name: '/jobs',
          page: () => const JobsPage(),
          binding: JobsBinding(),
        ),
      ],
    ),
  );
}
