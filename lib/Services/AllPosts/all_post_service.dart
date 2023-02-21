import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/all_post_res.dart';

class AllPostService {
  Dio dio = Dio();

  Future<List<AllPostRes>?> getallpost(String token) async {
    String path = Apiconfig.baseUrl + Apiconfig.allpost;

    try {
      Response response = await dio.post(path, data: {'token': token});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = response.data;
        final users = data.map((json) => AllPostRes.fromJson(json)).toList();
        return users;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
