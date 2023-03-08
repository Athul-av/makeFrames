import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/homescreen&search/model/alluser_resp.dart';

class AllUserService {
  Dio dio = Dio();

  Future<List<AllUsersDetailsRes>?>  getalluser(String token) async {
    String path = Apiconfig.baseUrl + Apiconfig.allusers;

    final option = Options(headers: {'Authorization': 'Bearer $token'}); 
    final queryparams = {'withCredentials': true};

    try {
      Response response =
          await dio.get(path, options: option, queryParameters: queryparams);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> json = response.data;
        final res = json.map((e) => AllUsersDetailsRes.fromJson(e)).toList();
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
