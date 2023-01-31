import 'package:flutter/material.dart';
import 'package:quran_app/theme/theme.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 144,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 78.0, vertical: 23),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Al-Fatiah",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          "Verse 7",
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "(The Opener)",
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "ةحَتِافَلْا",
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                ],
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
  }
}
