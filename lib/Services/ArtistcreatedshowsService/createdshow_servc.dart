import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/createdshow_res.dart';

class CreatedShowService with ChangeNotifier{


  Dio dio = Dio();

  Future<List<ArtistCreatedShowRes>?> artiststagePrograms(String token)async{

    String path = Apiconfig.baseUrl + Apiconfig.artistcreatedshow;

    try {
      Response response = await dio.post(path,data: {'token':token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsondata = response.data;
        final res = jsondata.map((e) =>ArtistCreatedShowRes.fromJson(e)).toList();
        return res;   
      }
    }on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}