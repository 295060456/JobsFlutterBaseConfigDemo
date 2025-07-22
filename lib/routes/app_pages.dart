import 'package:get/get.dart';
import '../pages/Home/home_page.dart';
import '../pages/Splash/splash_view.dart';

class AppPages {
  static const initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => const SplashView()),
    GetPage(name: '/home', page: () => const HomePage()),
  ];
}
