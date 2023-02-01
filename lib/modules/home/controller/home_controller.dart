import 'package:get/get.dart';
import 'package:quran_app/data/models/surah.dart';
import 'package:quran_app/data/services/service_surah.dart';

class HomeController extends GetxController {
  var isSelected = 2.obs;

  Surah surah = Surah(
    data: [],
  );

  getdata() async {
    await ServiceSurah().getSurah().then((value) {
      surah = value;
    });
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
