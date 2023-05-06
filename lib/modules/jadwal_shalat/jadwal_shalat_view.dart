import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/jadwal_shalat/controller/jadwal_shalat_controller.dart';
import 'package:quran_app/modules/jadwal_shalat/utils/widget.dart';
import 'package:quran_app/theme/theme.dart';

class JadwalShalatView extends StatelessWidget {
  JadwalShalatView({super.key});
  final JadwalShalatController jadwalShalatC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            ),
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text(
            "Medan Johor",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.location_on,
                color: primaryColor,
              ),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      jadwalShalatC.dateHijriyah,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(jadwalShalatC.dateFormatID),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      "Waktu ${jadwalShalatC.prayerName} sudah lewat",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "± ${jadwalShalatC.timeDifference.value} Menit yang Lalu",
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    size: 12.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Medan Johor, Medan - Indonesia",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2.0,
                    color: primaryColor.withOpacity(0.1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      JadwalShalatWidget(
                        jadwal: "Subuh",
                        jadwalShalatC: jadwalShalatC.formattedfajrTime,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      JadwalShalatWidget(
                        jadwal: "Dzuhur",
                        jadwalShalatC: jadwalShalatC.formatteddhuhrTime,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      JadwalShalatWidget(
                        jadwal: "Ashar",
                        jadwalShalatC: jadwalShalatC.formattedasrTime,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      JadwalShalatWidget(
                        jadwal: "Maghrib",
                        jadwalShalatC: jadwalShalatC.formattedmaghribTime,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      JadwalShalatWidget(
                        jadwal: "Isya",
                        jadwalShalatC: jadwalShalatC.formattedishaTime,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
