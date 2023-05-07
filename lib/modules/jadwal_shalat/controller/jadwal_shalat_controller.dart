import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/timezone.dart' as tz;

class JadwalShalatController extends GetxController {
  static final DateTime now = DateTime.now();
  static var nowHijriyah = HijriCalendar.now();
  String dateFormatID = DateFormat('dd MMMM yyyy', 'id_ID').format(now);
  var dateHijriyah = nowHijriyah.toFormat("dd MMMM yyyy");
  static final timezone = tz.getLocation('Asia/Jakarta');
  static final DateTime date = tz.TZDateTime.from(DateTime.now(), timezone);
  static final CalculationParameters params = CalculationMethod.Singapore();
  static final PrayerTimes prayerTimes = PrayerTimes(coordinates, date, params);
  static final Coordinates coordinates = Coordinates(3.6422715, 98.5046801);

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
  var locationName = 'Pilih Lokasi'.obs;
  var locationDesc = 'Pilih Lokasi'.obs;

  // Untuk mengubah Medan City menjadi Medan
  final Map<String, String> cityNames = {
    'Medan City': 'Medan',
    'Kota Medan': 'Medan',
    "Kabupaten Deli Serdang": "Deli Serdang",
    'Deli Serdang Regency': 'Deli Serdang',
    // tambahkan daftar kota atau wilayah lainnya yang ingin Anda terjemahkan
  };

  final Map<String, String> districtNames = {
    "Kecamatan Medan Johor": "Medan Johor",
    'Kecamatan Pancur Batu': 'Pancur Batu',
  };

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      LocationPermission permissionChecker = await Geolocator.checkPermission();
      if (permissionChecker == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        Placemark placemark = placemarks[0];
        String subDistrict = '${placemark.locality}';
        String city = '${placemark.subAdministrativeArea}';
        String country = '${placemark.country}';
        locationName.value = districtNames[subDistrict] ?? subDistrict;
        locationDesc.value =
            '${districtNames[subDistrict] ?? subDistrict}, ${cityNames[city] ?? city} - $country';
        print(cityNames[city] ?? city);
        print(districtNames[subDistrict] ?? subDistrict);
        saveLocationtoStorage();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Shared Preferences
  Future<void> saveLocationtoStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("locationName", locationName.value);
    await prefs.setString("locationDesc", locationDesc.value);
  }

  Future<void> getLocationFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String locationNamePref = prefs.getString("locationName") ?? 'Pilih Lokasi';
    String locationDescPref = prefs.getString("locationDesc") ?? 'Pilih Lokasi';

    locationName.value = locationNamePref;
    locationDesc.value = locationDescPref;
  }

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
    getLocationFromStorage();
    super.onInit();
  }
}
