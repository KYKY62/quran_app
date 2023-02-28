import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/data/models/detail_ayat.dart';
import 'package:quran_app/data/services/service_detail_ayat.dart';
import 'package:quran_app/modules/home/controller/home_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class DetailAyatController extends GetxController {
  final homeC = Get.put(HomeController());
  final scroolcontroller = AutoScrollController();
  final player = AudioPlayer();
  Verse? lastVerse;

  Detailayat detailayat = Detailayat();

  getdata(String id) async {
    await ServiceDetailAyat().getDetailSurah(id).then((value) {
      detailayat = value;
    });
  }

  void stopAudioSurah(Verse ayat) async {
    try {
      await player.stop();
      ayat.isAudio = 'stop';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: e.message.toString(),
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Connection aborted ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat stop audio",
      );
    }
  }

  void resumeAudioSurah(Verse ayat) async {
    try {
      ayat.isAudio = 'playing';
      update();
      await player.play();
      ayat.isAudio = 'stop';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: e.message.toString(),
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Connection aborted ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat resume audio",
      );
    }
  }

  void pauseAudioSurah(Verse ayat) async {
    try {
      await player.pause();
      ayat.isAudio = 'pause';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: e.message.toString(),
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Connection aborted ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat pause audio",
      );
    }
  }

  void playAudioSurah(Verse? ayat) async {
    if (ayat?.audio.primary != null) {
      lastVerse ??= ayat;
      lastVerse!.isAudio = 'stop';
      lastVerse = ayat;
      lastVerse!.isAudio = 'stop';
      try {
        await player.stop();
        await player.setUrl(ayat!.audio.primary);
        ayat.isAudio = 'playing';
        update();
        await player.play();
        ayat.isAudio = 'stop';
        await player.stop();
        update();
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Connection aborted ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat memutar audio",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Url audio tidak ada / tidak dapat diakses",
      );
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
