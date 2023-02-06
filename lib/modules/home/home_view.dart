import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/home/controller/home_controller.dart';
import 'package:quran_app/modules/home/utils/surah_widget.dart';
import 'package:quran_app/modules/juz/controller/juz_controller.dart';
import 'package:quran_app/modules/juz/juz_view.dart';

import './utils/card_widget.dart';
import './utils/floating_widget.dart';
import '../../theme/theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeC = Get.put(HomeController());
  final juzC = Get.put(JuzController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FLoatingWidget(
              onTap: () {
                homeC.isSelected.value = 1;
              },
              size: homeC.isSelected.value == 1 ? 70 : 60,
              color: homeC.isSelected.value == 1 ? primaryColor : cardColor,
              imageAsset: homeC.isSelected.value == 1
                  ? 'assets/bookIcon_active.png'
                  : 'assets/bookIcon.png',
            ),
            const SizedBox(
              width: 60.0,
            ),
            FLoatingWidget(
              onTap: () {
                homeC.isSelected.value = 2;
              },
              size: homeC.isSelected.value == 2 ? 70 : 60,
              color: homeC.isSelected.value == 2 ? primaryColor : cardColor,
              imageAsset: homeC.isSelected.value == 2
                  ? 'assets/quranIcon_active.png'
                  : 'assets/quranIcon.png',
            ),
            const SizedBox(
              width: 60.0,
            ),
            FLoatingWidget(
              onTap: () {
                homeC.isSelected.value = 3;
              },
              size: homeC.isSelected.value == 3 ? 70 : 60,
              color: homeC.isSelected.value == 3 ? primaryColor : cardColor,
              imageAsset: homeC.isSelected.value == 3
                  ? 'assets/prayertimeIcon_active.png'
                  : 'assets/prayertimeIcon.png',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Image.asset(
          "assets/menuIcon.png",
          width: 10,
          height: 10,
        ),
        elevation: 0,
        title: Text(
          "Quran App",
          style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Asalamu Alaikum !!!",
                style: highlightTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              Text(
                "Hamba Allah",
                style:
                    primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
              const SizedBox(
                height: 29.0,
              ),
              const CardWidget(),
              const SizedBox(
                height: 23.0,
              ),
              TabBar(
                indicatorColor: hightlightColor,
                labelColor: primaryColor,
                unselectedLabelColor: hightlightColor,
                tabs: const [
                  Tab(text: "Surah"),
                  Tab(text: "Para"),
                  Tab(text: "Page"),
                  Tab(text: "Hijb"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const SurahWidget(),
                    JuzView(),
                    const Text("text"),
                    const Text("text"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
