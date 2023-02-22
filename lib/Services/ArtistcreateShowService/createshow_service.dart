import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/createshow_req.dart';

class CreateShowService {
  Dio dio = Dio();

  Future<bool?> uploadStageShow(CreateShowReq model) async {
    String path = Apiconfig.baseUrl + Apiconfig.createshow;

    try {
      Response response = await dio.post(path, data: model);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['Program'] == true) {
          return true;
        } else {
          return false;
        }
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
