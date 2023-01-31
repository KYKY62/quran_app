import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(21),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/lastreadIcon.png",
                      ),
                      const SizedBox(
                        width: 13.0,
                      ),
                      Text(
                        "Last Read",
                        style: primaryTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "Al-Fatiah",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    "Ayah no. 1",
                    style: primaryTextStyle.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/lastreadbookIcon.png",
            ),
          ],
        ),
      ),
    );
  }
}
