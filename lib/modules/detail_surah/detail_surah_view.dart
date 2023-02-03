import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/theme/theme.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({
    required this.title,
    required this.verse,
    required this.translation,
    required this.verseCount,
    super.key,
  });

  final String title;
  final String verse;
  final String translation;
  final int verseCount;

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
            Expanded(
              child: ListView.builder(
                itemCount: verseCount,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "مِيحِرَّلٱ نِٰـمَحْرَّلٱ هِلَّلٱ مِسْبِ",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "In the Name of Allah-the Most Compassionate, Most Merciful",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 27.0,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
