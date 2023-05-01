import 'package:flutter/material.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class JadwalShalatView extends StatelessWidget {
  const JadwalShalatView({super.key});

  @override
  Widget build(BuildContext context) {
    final timezone = tz.getLocation('Asia/Jakarta');
    DateTime date = tz.TZDateTime.from(DateTime.now(), timezone);
    Coordinates coordinates = Coordinates(3.6422715, 98.5046801);
    CalculationParameters params = CalculationMethod.Singapore();
    params.madhab = Madhab.Shafi;

    PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);

    DateTime fajrTime = tz.TZDateTime.from(prayerTimes.fajr!, timezone);
    DateTime dhuhrTime = tz.TZDateTime.from(prayerTimes.dhuhr!, timezone);
    DateTime asrTime = tz.TZDateTime.from(prayerTimes.asr!, timezone);
    DateTime maghribTime = tz.TZDateTime.from(prayerTimes.maghrib!, timezone);
    DateTime ishaTime = tz.TZDateTime.from(prayerTimes.isha!, timezone);

    String formattedfajrTime = DateFormat('HH:mm').format(fajrTime);
    String formatteddhuhrTime = DateFormat('HH:mm').format(dhuhrTime);
    String formattedasrTime = DateFormat('HH:mm').format(asrTime);
    String formattedmaghribTime = DateFormat('HH:mm').format(maghribTime);
    String formattedishaTime = DateFormat('HH:mm').format(ishaTime);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Subuh"),
              Text(formattedfajrTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dzuhur"),
              Text(formatteddhuhrTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ashar"),
              Text(formattedasrTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Maghrib"),
              Text(formattedmaghribTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Isya"),
              Text(formattedishaTime),
            ],
          ),
        ],
      ),
    );
  }
}
