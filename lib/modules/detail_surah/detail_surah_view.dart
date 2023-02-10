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
            Material(
              color: hightlightColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Get.defaultDialog(
                    title: "Tafsir $title",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    content: Text(
                      "${detailayatC.detailayat.data?.tafsir.id}",
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: primaryTextStyle.copyWith(
                            fontSize: 18.0, fontWeight: bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$verse | $translation",
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 13.0),
                                ),
                                Text(
                                  "Tekan Untuk melihat Tafsir",
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 13.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                      final detailAyat =
                          detailayatC.detailayat.data!.verses[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: hightlightColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/border.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${detailAyat.number.inSurah}",
                                            style: primaryTextStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GetBuilder<DetailAyatController>(
                                    builder: (_) => Row(
                                      children: [
                                        Image.asset(
                                          "assets/shareIcon.png",
                                        ),
                                        const SizedBox(
                                          width: 32.0,
                                        ),
                                        (detailAyat.isAudio == 'stop')
                                            ? GestureDetector(
                                                onTap: () {
                                                  detailayatC.playAudioSurah(
                                                      detailAyat);
                                                },
                                                child: Image.asset(
                                                  "assets/playIcon.png",
                                                ),
                                              )
                                            : Row(
                                                children: [
                                                  detailAyat.isAudio ==
                                                          'playing'
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            detailayatC
                                                                .pauseAudioSurah(
                                                                    detailAyat);
                                                          },
                                                          child: const Icon(
                                                              Icons.pause))
                                                      : GestureDetector(
                                                          onTap: () {
                                                            detailayatC
                                                                .resumeAudioSurah(
                                                                    detailAyat);
                                                          },
                                                          child: const Icon(
                                                              Icons.play_arrow),
                                                        ),
                                                  const SizedBox(
                                                    width: 32.0,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      detailayatC
                                                          .stopAudioSurah(
                                                              detailAyat);
                                                    },
                                                    child:
                                                        const Icon(Icons.stop),
                                                  ),
                                                ],
                                              ),
                                        const SizedBox(
                                          width: 32.0,
                                        ),
                                        Image.asset(
                                          "assets/bookmarkIcon.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  detailAyat.text.arab,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(detailAyat.translation.id,
                                textAlign: TextAlign.justify,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16.0,
                                )),
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
