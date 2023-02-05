import 'package:get/get.dart';
import 'package:quran_app/data/models/juz.dart';
import 'package:quran_app/data/services/service_juz.dart';

class JuzController extends GetxController {
  List<Juz> juz = [];
  Future<List<Juz>> getJuz() async {
    return await ServiceJuz().getJuz().then((value) {
      return juz = value;
    });
  }
}
