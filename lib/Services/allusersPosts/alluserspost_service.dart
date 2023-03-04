import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/homescreen&search/model/alluserpost_res.dart';

class AllPostOfUsers {
  Dio dio = Dio();

  Future<List<AllUsersPostsRes>?> getuserpost(String token, String id) async {
    String path = Apiconfig.baseUrl + Apiconfig.userspost;
    final option = Options(headers: {'cookie': token});
    final payload = {"id": id, "withCredentials": true};

    try {
      Response response = await dio.post(path, data: payload, options: option);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> json = response.data;
        final data = json.map((e) => AllUsersPostsRes.fromJson(e)).toList();
        return data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
