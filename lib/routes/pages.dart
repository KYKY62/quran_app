import 'package:get/get.dart';
import 'package:quran_app/bindings/jadwal_shalat_binding.dart';
import 'package:quran_app/modules/home/home_view.dart';
import 'package:quran_app/modules/intro/intro_view.dart';
import 'package:quran_app/modules/jadwal_shalat/jadwal_shalat_view.dart';
import 'package:quran_app/modules/menu/menu.dart';
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
    GetPage(
      name: Routes.menu,
      page: () => const MenuView(),
    ),
    GetPage(
      name: Routes.jadwalShalat,
      page: () => JadwalShalatView(),
      binding: JadwalShalatBinding(),
    ),
  ];
}
