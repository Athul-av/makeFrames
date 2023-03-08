import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';

class GiveHypeService{

  Dio dio = Dio();

 Future<bool?> givehype(String token,String id)async{

    String path = Apiconfig.baseUrl+ Apiconfig.givehype;

    final option = Options(headers: {'Authorization':'Bearer $token'}); 
    

    try {
      Response response = await dio.post(path,options: option,data:{'userId':id});

      if(response.statusCode == 200 || response.statusCode ==201){
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