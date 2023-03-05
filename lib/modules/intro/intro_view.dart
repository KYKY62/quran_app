import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/routes/routes.dart';

import '../../theme/theme.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quran App",
              style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              "Learn Quran every day and\nrecite once everyday",
              style: highlightTextStyle.copyWith(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 41.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 488,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    width: double.infinity,
                    height: 437,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor,
                          blurRadius: 0.5,
                          spreadRadius: 0.3,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/mosque.png",
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 90,
                    child: Material(
                      color: hightlightColor,
                      borderRadius: BorderRadius.circular(40),
                      child: InkWell(
                        onTap: () => Get.offNamed(Routes.home),
                        borderRadius: BorderRadius.circular(40),
                        child: SizedBox(
                          width: 183,
                          height: 51,
                          child: Center(
                            child: Text(
                              "Get started",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
