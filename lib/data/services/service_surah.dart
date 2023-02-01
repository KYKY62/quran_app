import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:quran_app/data/models/surah.dart';

class ServiceSurah {
  Future<Surah> getSurah() async {
    Surah surah;
    var url = Uri.parse("https://api.quran.gading.dev/surah/");

    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(response.body);
    surah = Surah.fromJson(data);

    return surah;
  }
}
