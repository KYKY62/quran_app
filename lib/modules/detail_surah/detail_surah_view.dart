import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/detail_surah/controller/detail_ayat_controller.dart';
import 'package:quran_app/theme/theme.dart';

class DetailSurah extends StatelessWidget {
  final homeC = Get.arguments;
  final detailayatC = Get.put(DetailAyatController());
  DetailSurah({
    required this.title,
    required this.verse,
    required this.translation,
    super.key,
  });

  final String title;
  final String verse;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(
                "assets/arrow_back_Icon.png",
                width: 20,
              ),
            ),
            const SizedBox(
              width: 13.0,
            ),
            Text(
              "Quran",
              style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  primaryTextStyle.copyWith(fontSize: 18.0, fontWeight: bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        verse,
                        style: primaryTextStyle.copyWith(fontSize: 13.0),
                      ),
                      Text(
                        translation,
                        style: primaryTextStyle.copyWith(fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/shareIcon.png",
                ),
                const SizedBox(
                  width: 32.0,
                ),
                Image.asset(
                  "assets/playIcon.png",
                ),
                const SizedBox(
                  width: 32.0,
                ),
                Image.asset(
                  "assets/bookmarkIcon.png",
                ),
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            FutureBuilder(
              future: detailayatC.getdata(homeC.toString()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: detailayatC.detailayat.data!.verses.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            detailayatC
                                .detailayat.data!.verses[index].text.arab,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            detailayatC
                                .detailayat.data!.verses[index].translation.id,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 27.0,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
