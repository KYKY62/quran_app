import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/detail_surah/detail_surah_view.dart';
import 'package:quran_app/modules/home/controller/home_controller.dart';
import 'package:quran_app/theme/theme.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());
    return FutureBuilder(
      future: homeC.getdata(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: homeC.surah.data.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DetailSurah(
                        title: homeC.surah.data[index].name.transliteration.id,
                        verse:
                            "Verse ${homeC.surah.data[index].numberOfVerses}",
                        translation:
                            homeC.surah.data[index].name.translation.en,
                        verseCount: homeC.surah.data[index].numberOfVerses,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 78.0, vertical: 23),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeC.surah.data[index].name.transliteration.id,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "Verse ${homeC.surah.data[index].numberOfVerses}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                homeC.surah.data[index].name.translation.en,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          homeC.surah.data[index].name.short,
                          style: arabicTextStyle.copyWith(
                            fontSize: 28,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: hightlightColor,
                  thickness: 1,
                )
              ],
            );
          },
        );
      },
    );
  }
}
