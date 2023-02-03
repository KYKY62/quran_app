import 'package:get/get.dart';
import 'package:quran_app/data/models/detail_ayat.dart';
import 'package:quran_app/data/services/service_detail_ayat.dart';
import 'package:quran_app/modules/home/controller/home_controller.dart';

class DetailAyatController extends GetxController {
  final homeC = Get.put(HomeController());

  Detailayat detailayat = Detailayat();

  getdata(String id) async {
    await ServiceDetailAyat().getDetailSurah(id).then((value) {
      detailayat = value;
    });
  }
}
