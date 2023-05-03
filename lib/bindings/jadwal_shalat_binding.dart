import 'package:get/get.dart';
import 'package:quran_app/modules/jadwal_shalat/controller/jadwal_shalat_controller.dart';

class JadwalShalatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(JadwalShalatController());
  }
}
