import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';

class HypeStatusService{

  Dio dio = Dio();

 Future<bool?> hypestatus(String token , String id)async{

    String path = Apiconfig.baseUrl + Apiconfig.hypestatus;
    final option = Options(headers: {'Authorization':'Bearer $token'}); 
        
    try {

      Response response = await dio.post(path,options: option,data: {'userId':id});
      if (response.statusCode ==200 || response.statusCode ==201) {
        if (response.data['hype']== true) {
          return true;
        }else{
          return false;
        }
      }
      
    }on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}