import 'package:get/get.dart';

import '../Data/Data.3rd/GetXDemo✅/GetX_RouteDemo/GetX_RouteDemo1/home_binding.dart';
import '../Data/Data.3rd/GetXDemo✅/GetX_RouteDemo/GetX_RouteDemo1/home_view.dart';
// import '页面合集/splash/binding.dart';
// import '页面合集/splash/view.dart';

abstract class Routes {
  ///入口模块
  static const String splashPage = '/splash';
  ///页面合集
  static final routePage = [
    // GetPage(
    //     name: splashPage,
    //     page: () => SplashPage(),
    //     binding: SplashBinding(),
    //     transition: Transition.noTransition),
    GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: HomeBinding(),
          transition: Transition.noTransition
        ),
  ];
}
