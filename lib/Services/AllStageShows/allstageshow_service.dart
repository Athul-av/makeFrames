import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/stageShow/model/allstageshow_res.dart';

class AllStageShowService {
  Dio dio = Dio();

  Future<List<AllStageShowRes>?> getallshows(String token) async {
    String path = Apiconfig.baseUrl + Apiconfig.allstageshow;

    try {
      Response response = await dio.post(path, data: {'token': token});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = response.data;
        final res = data.map((e) => AllStageShowRes.fromJson(e)).toList();
        return res;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
