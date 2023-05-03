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
}
