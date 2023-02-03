import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:quran_app/data/models/detail_ayat.dart';

class ServiceDetailAyat {
  Future<Detailayat> getDetailSurah(String id) async {
    Detailayat detailayat;
    var url = Uri.parse("https://api.quran.gading.dev/surah/$id");

    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(response.body);
    detailayat = Detailayat.fromJson(data);

    return detailayat;
  }
}
