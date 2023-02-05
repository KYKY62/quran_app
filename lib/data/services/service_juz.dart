import 'dart:convert';

import 'package:quran_app/data/models/juz.dart';
import "package:http/http.dart" as http;

class ServiceJuz {
  Future<List<Juz>> getJuz() async {
    List<Juz> alljuz = [];
    for (int listJuz = 1; listJuz <= 30; listJuz++) {
      var url = Uri.parse("https://api.quran.gading.dev/juz/$listJuz");

      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = jsonDecode(response.body);
      Juz juz = Juz.fromJson(data);
      alljuz.add(juz);
    }
    return alljuz;
  }
}
