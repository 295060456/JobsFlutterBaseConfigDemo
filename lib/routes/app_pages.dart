import 'package:get/get.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_view.dart';

class AppPages {
  static const initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => const SplashView()),
    GetPage(name: '/home', page: () => const HomePage()),
  ];
}
