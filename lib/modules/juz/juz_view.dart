import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/juz/controller/juz_controller.dart';
import 'package:quran_app/modules/juz/juz_detail/juz_detail_view.dart';
import 'package:quran_app/theme/theme.dart';

class JuzView extends StatefulWidget {
  const JuzView({
    super.key,
  });

  @override
  State<JuzView> createState() => _JuzViewState();
}

class _JuzViewState extends State<JuzView>
    with AutomaticKeepAliveClientMixin<JuzView> {
  final juzC = Get.put(JuzController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: juzC.getJuz(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 20),
              Text("Mohon tunggu Sebentar")
            ],
          );
        }

        return ListView.builder(
          itemCount: juzC.juz.length,
          itemBuilder: (context, index) {
            var detailJuz = juzC.juz[index];
            return detailJuz.data?.juz == null
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      Get.to(
                        () => JuzDetailView(),
                        arguments: detailJuz.data,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 40.0),
                      child: Row(
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
                                Center(
                                  child: Text(
                                    "${detailJuz.data?.juz}",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 13, fontWeight: bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Juz ${detailJuz.data?.juz}",
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: bold,
                                  )),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Mulai di ${detailJuz.data?.juzStartInfo}",
                                style: primaryTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
