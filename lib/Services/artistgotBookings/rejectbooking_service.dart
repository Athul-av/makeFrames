import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';

class RejectBookingService {

  Dio dio = Dio();

  Future<bool?>rejectshow(String id, String token)async {

    String path = Apiconfig.baseUrl +Apiconfig.denyshow; 
    final option = Options(headers: {'Authorization':'Bearer $token'});
     
 
    try {

      Response response = await dio.post(path,data:{'id':id,'withCredentials':true},options: option); 

      if(response.statusCode == 200 || response.statusCode == 201){
       return true;
      }
      

    }on DioError catch (e) {
      log(e.message);
    }
    return null;

  }
}