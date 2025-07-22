import 'package:get/get.dart';

/// 自动注册或获取 Controller（立即创建并返回）
/// 用法：
///   final c = getOrPut(() => MyController());
T getOrPut<T extends GetxController>(
  T Function() creator, {
  bool permanent = false,
}) {
  if (Get.isRegistered<T>()) {
    return Get.find<T>();
  } else {
    return Get.put<T>(creator(), permanent: permanent);
  }
}

/// 自动懒加载注册或获取 Controller（第一次用时才创建）
/// 用法：
///   final c = getOrLazyPut(() => MyController(), fenix: true);
T getOrLazyPut<T extends GetxController>(
  T Function() creator, {
  bool fenix = false,
}) {
  if (Get.isRegistered<T>()) {
    return Get.find<T>();
  } else {
    Get.lazyPut<T>(creator, fenix: fenix);
    return Get.find<T>();
  }
}
