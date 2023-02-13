import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/juz/controller/juz_controller.dart';
import 'package:quran_app/modules/juz/controller/juz_detail_controller.dart';

import '../../../theme/theme.dart';

class JuzDetailView extends StatelessWidget {
  JuzDetailView({super.key});
  final detailJuz = Get.arguments;
  final ayatC = Get.put(JuzController());
  final coba = Get.put(JuzDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Juz ${detailJuz.juz}",
          style: primaryTextStyle,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: detailJuz.verses.length,
        itemBuilder: (context, index) {
          print(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailJuz.verses[index].number.inSurah == 1
                  ? SizedBox(
                      width: Get.width,
                      height: 70,
                      child: Center(
                        child: Text(
                          "Awalan Surah",
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: hightlightColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "${detailJuz.verses[index].number.inSurah}",
                                  style: primaryTextStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                        GetBuilder<JuzController>(
                          builder: (_) => Row(
                            children: [
                              Image.asset(
                                "assets/shareIcon.png",
                              ),
                              const SizedBox(
                                width: 32.0,
                              ),
                              (detailJuz.verses?[index].isAudio == 'stop')
                                  ? GestureDetector(
                                      onTap: () {
                                        coba.playAudioSurah(
                                            detailJuz.verses[index]);
                                      },
                                      child: Image.asset(
                                        "assets/playIcon.png",
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        detailJuz.verses![index].isAudio ==
                                                'playing'
                                            ? GestureDetector(
                                                onTap: () {
                                                  coba.pauseAudioSurah(coba
                                                      .juz[index]
                                                      .data!
                                                      .verses![index]);
                                                },
                                                child: const Icon(Icons.pause))
                                            : GestureDetector(
                                                onTap: () {
                                                  coba.resumeAudioSurah(coba
                                                      .juz[index]
                                                      .data!
                                                      .verses![index]);
                                                },
                                                child: const Icon(
                                                    Icons.play_arrow),
                                              ),
                                        const SizedBox(
                                          width: 32.0,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            coba.stopAudioSurah(coba.juz[index]
                                                .data!.verses![index]);
                                          },
                                          child: const Icon(Icons.stop),
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
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        "${detailJuz.verses[index].text.arab}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        detailJuz.verses[index].text.transliteration.en,
                        textAlign: TextAlign.end,
                        style: primaryTextStyle.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  detailJuz.verses[index].translation.id,
                  textAlign: TextAlign.justify,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16.0,
                  ),
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
  }
}
