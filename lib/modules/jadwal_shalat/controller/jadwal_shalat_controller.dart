import 'dart:async';

import 'package:get/get.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart' as tz;

class JadwalShalatController extends GetxController {
  static final DateTime now = DateTime.now();
  static var nowHijriyah = HijriCalendar.now();
  String dateFormatID = DateFormat('dd MMMM yyyy', 'id_ID').format(now);
  var dateHijriyah = nowHijriyah.toFormat("dd MMMM yyyy");
  static final timezone = tz.getLocation('Asia/Jakarta');
  static final DateTime date = tz.TZDateTime.from(DateTime.now(), timezone);
  static final Coordinates coordinates = Coordinates(3.6422715, 98.5046801);
  static final CalculationParameters params = CalculationMethod.Singapore();
  static final PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);

  static final DateTime fajrTime =
      tz.TZDateTime.from(prayerTimes.fajr!, timezone);
  static final DateTime dhuhrTime =
      tz.TZDateTime.from(prayerTimes.dhuhr!, timezone);
  static final DateTime asrTime =
      tz.TZDateTime.from(prayerTimes.asr!, timezone);
  static final DateTime maghribTime =
      tz.TZDateTime.from(prayerTimes.maghrib!, timezone);
  static final DateTime ishaTime =
      tz.TZDateTime.from(prayerTimes.isha!, timezone);

  String formattedfajrTime = DateFormat('HH:mm').format(fajrTime);
  String formatteddhuhrTime = DateFormat('HH:mm').format(dhuhrTime);
  String formattedasrTime = DateFormat('HH:mm').format(asrTime);
  String formattedmaghribTime = DateFormat('HH:mm').format(maghribTime);
  String formattedishaTime = DateFormat('HH:mm').format(ishaTime);

  RxInt timeDifference = 0.obs;
  var prayerName = 'null'.obs;

  @override
  void onInit() {
    // Harus di onInit biar jalan
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Update Waktu
      DateTime currentTime = DateTime.now();
      // waktu setelah Shalat
      Duration difffajrTime = fajrTime.difference(currentTime);
      Duration diffdhuhrTime = dhuhrTime.difference(currentTime);
      Duration diffasrTime = asrTime.difference(currentTime);
      Duration diffmaghribTime = maghribTime.difference(currentTime);
      Duration diffishaTime = ishaTime.difference(currentTime);

      var fajrTimePassed = difffajrTime.inMinutes.abs();
      var dhuhrTimePassed = diffdhuhrTime.inMinutes.abs();
      var asrTimePassed = diffasrTime.inMinutes.abs();
      var maghribTimePassed = diffmaghribTime.inMinutes.abs();
      var ishaTimePassed = diffishaTime.inMinutes.abs();

      // Logika jika Waktu shalat telah berlalu
      if (currentTime.isAfter(fajrTime) && currentTime.isBefore(dhuhrTime)) {
        timeDifference.value = fajrTimePassed;
        prayerName.value = 'Subuh';
      } else if (currentTime.isAfter(dhuhrTime) &&
          currentTime.isBefore(asrTime)) {
        timeDifference.value = dhuhrTimePassed;
        prayerName.value = 'Dzuhur';
      } else if (currentTime.isAfter(asrTime) &&
          currentTime.isBefore(maghribTime)) {
        timeDifference.value = asrTimePassed;
        prayerName.value = 'Ashar';
      } else if (currentTime.isAfter(maghribTime) &&
          currentTime.isBefore(ishaTime)) {
        timeDifference.value = maghribTimePassed;
        prayerName.value = 'Maghrib';
      } else if (currentTime.isAfter(ishaTime)) {
        timeDifference.value = ishaTimePassed;
        prayerName.value = 'Isya';
      }
    });

    super.onInit();
  }
}
