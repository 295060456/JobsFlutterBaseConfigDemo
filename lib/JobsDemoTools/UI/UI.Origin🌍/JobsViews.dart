import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/AnyExtensions/onString.dart';

Widget JobsNoMoreView() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Center(
      child: Text("- ".append("没有更多了".tr).append(" -"),
          style: const TextStyle(color: Color(0xFF9AA3B2), fontSize: 12)),
    ),
  );
}

Widget JobsLoadingView() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: Center(
      child: SizedBox(
        height: 18,
        width: 18,
        child:
            CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFFFD8A6)),
      ),
    ),
  );
}

// Widget JobsEmptyView() {
//   return Container(
//     height: 500.h,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(30.r),
//     ),
//     child: Column(
//       children: [
//         SizedBox(height: 50.h),
//         SvgPicture.asset(
//           Assets.theme1.images.home.iconListEmpty,
//           width: 300.w,
//         ),
//         Text(
//           '暂无数据'.tr,
//           style: TextStyle(color: Colors.white, fontSize: 40.sp),
//         ),
//       ],
//     ),
//   );
// }

// Widget JobsEmptyWhiteView() {
//   return Container(
//     height: 500.h,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(30.r),
//     ),
//     child: Column(
//       children: [
//         SizedBox(height: 50.h),
//         SvgPicture.asset(
//           Assets.theme1.images.home.iconListEmpty,
//           width: 300.w,
//         ),
//         Text(
//           '暂无数据',
//           style: TextStyle(fontSize: 40.sp),
//         ),
//       ],
//     ),
//   );
// }

// Widget JobsBuildEmptyView() {
//   return Container(
//     height: 700.h,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Get.context?.customTheme?.pageTwoBg,
//       borderRadius: BorderRadius.circular(30.r),
//     ),
//     child: Column(
//       children: [
//         SizedBox(height: 50.h),
//         SvgPicture.asset(
//           Assets.theme1.images.home.iconListEmpty,
//           width: 300.w,
//         ),
//         Text(
//           '暂无数据'.tr,
//           style: TextStyle(fontSize: 40.sp),
//         ),
//       ],
//     ),
//   );
// }

// Widget buildEmptyView() {
//   return Container(
//     height: 700.h,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(30.r),
//     ),
//     child: Column(
//       children: [
//         SizedBox(height: 50.h),
//         SvgPicture.asset(
//           Assets.theme1.images.home.iconListEmpty,
//           width: 300.w,
//         ),
//         Text(
//           '暂无数据'.tr,
//           style: TextStyle(fontSize: 40.sp),
//         ),
//       ],
//     ),
//   );
// }
