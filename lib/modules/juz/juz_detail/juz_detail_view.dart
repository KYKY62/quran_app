import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';

class JuzDetailView extends StatelessWidget {
  JuzDetailView({super.key});
  final detailJuz = Get.arguments;

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailJuz.verses[index].number.inSurah == 1
                  ? Container(
                      width: Get.width,
                      height: 70,
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: const Center(
                        child: Text("Ini awal surah"),
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${detailJuz.verses[index].number.inQuran}",
                      style: primaryTextStyle,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
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
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  detailJuz.verses[index].text.transliteration.en,
                  textAlign: TextAlign.justify,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
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
