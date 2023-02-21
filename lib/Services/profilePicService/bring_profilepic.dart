import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';

class BringProfilePicService {
  Dio dio = Dio();

  Future<String?> bringDP(String token) async {
    String path = Apiconfig.baseUrl + Apiconfig.bringDP;

    try {
      Response response = await dio.post(path, data: {'token': token});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['dpimage'];
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
