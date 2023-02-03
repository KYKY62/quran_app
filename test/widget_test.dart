// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:quran_app/data/models/detail_ayat.dart';
import 'package:quran_app/data/models/surah.dart';

void main() async {
  Surah surah;

  var url = Uri.parse("https://api.quran.gading.dev/surah/");

  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(response.body);
  // print(data['data'][0]);

  surah = Surah.fromJson(data);
  // print(surah);
  // print(surah.data[0].number);
  // print("-------------");
  // print(surah.data[0].sequence);
  // print("-------------");
  // print(surah.data[0].numberOfVerses);
  // print("-------------");
  // print(surah.data[0].name.long);

  var dataannas = (json.decode(response.body) as Map<String, dynamic>)['code'];
  // print(dataannas);

  Detailayat detailayat;

  int index = 113;
  var urldetail = Uri.parse("https://api.quran.gading.dev/surah/$index");

  var responseDetail = await http.get(
    urldetail,
    headers: {
      "Content-Type": "application/json",
    },
  );
  print(urldetail);
  // Map<String, dynamic> datas =
  //     (json.decode(responseDetail.body) as Map<String, dynamic>);

  var datas = jsonDecode(responseDetail.body);

  // print(datas['data']['verses'][0]['text']['arab']);

  detailayat = Detailayat.fromJson(datas);

  print(detailayat.data!.verses);
}
