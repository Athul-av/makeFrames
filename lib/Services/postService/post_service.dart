import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/post_req.dart';

class Postservice{

Dio dio = Dio();

Future<bool?> addpost(PostReq model)async{

  String path = Apiconfig.baseUrl + Apiconfig.addpost;

  try {

    Response response = await dio.post(path,data: model);
    if(response.statusCode == 200 || response.statusCode == 201){
      return true;
    }else{
      return false;
    }
    
  }on DioError catch (e) {
    log(e.message);
  }
  return null;
}



}