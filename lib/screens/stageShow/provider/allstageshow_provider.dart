import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/services/allStageShows/allstageshow_service.dart';
import 'package:makeframes/screens/stageShow/model/allstageshow_res.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AllStageShowProvider with ChangeNotifier {
  List<AllStageShowRes>? data;
  List<AllStageShowRes>? alldata;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late VideoPlayerController contrlr;
  bool isplay = false;

  Future<void> getallstage() async {
    String? token = await storage.read(key: 'token');

    await AllStageShowService().getallshows(token!).then((value) {
      data = value;
      alldata = value;
      notifyListeners();
    });
   
  }

//all show search
  void search(String keyboard) {
    if (keyboard.isEmpty) {
      data = alldata;
      notifyListeners();
    } else {
      data = alldata!
          .where((element) => element.category!
              .toLowerCase()
              .contains(keyboard.toLowerCase().trim()))
          .toList();
      notifyListeners();
    }
  }

//to get the thumbnail image
  Future<Uint8List?> getThumbnail(String videoUrl) async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoUrl,
      imageFormat: ImageFormat.JPEG,
      quality: 50,
    );
    return uint8list;
  }

  videoplayerinitialize(String vdeo) {
    contrlr = VideoPlayerController.network(vdeo)..initialize();
    notifyListeners();
  }

  playvdo() {
    if (contrlr.value.isPlaying) {
      contrlr.pause();
      isplay = false;
      notifyListeners();
    } else {
      contrlr.play();
      isplay = true;
      notifyListeners();
    }
  }
}
