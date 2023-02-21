import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/be_artist_req.dart';

class BeArtistService {
  Dio dio = Dio();

// BE AN ARTIST SERVICE
  Future<bool?> beArtist(BeArtistReq model) async {
    String path = Apiconfig.baseUrl + Apiconfig.beartist;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()));

      if (response.data['artistDone'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
