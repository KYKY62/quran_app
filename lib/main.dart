import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran_app/routes/pages.dart';
import 'package:quran_app/routes/routes.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/date_symbol_data_local.dart';

void main() {
  tz.initializeTimeZones();
  initializeDateFormatting("id_ID", null).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.intro,
      getPages: AppPages.pages,
    );
  }
}
