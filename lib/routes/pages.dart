import 'package:get/get.dart';
import 'package:quran_app/modules/home/home_view.dart';
import 'package:quran_app/modules/intro/intro_view.dart';
import 'package:quran_app/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.intro,
      page: () => const IntroView(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
    ),
  ];
}
