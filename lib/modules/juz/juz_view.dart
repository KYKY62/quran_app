import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/modules/juz/controller/juz_controller.dart';

class JuzView extends StatefulWidget {
  const JuzView({super.key});

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
        if (!snapshot.hasData) {
          return const Text("tidak ada data");
        }
        return ListView.builder(
          itemCount: juzC.juz.length,
          itemBuilder: (context, index) {
            var detailJuz = juzC.juz[index];
            return Row(
              children: [
                Text("Juz ${detailJuz.data?.juz}"),
                const SizedBox(
                  width: 20.0,
                ),
                Text("${detailJuz.data?.juzStartInfo}"),
                Text("${detailJuz.data?.juzEndInfo}")
              ],
            );
          },
        );
      },
    );
  }
}
