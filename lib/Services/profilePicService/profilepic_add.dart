import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';

import '../../screens/userprofile/model/profilepic_add_req.dart';

class ProfilePicAddService {
  Dio dio = Dio();

  Future<bool?> addProfilepic(ProfilePicReq model) async {
    String path = Apiconfig.baseUrl + Apiconfig.profilePicAdd;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()));

      if (response.data['add'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
