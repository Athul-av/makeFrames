import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/singleuser_detailsres.dart';

class SingleUserService{
  Dio dio = Dio();

  Future<List<dynamic>?> getsingleuser(String id,String token)async{

    String path = Apiconfig.baseUrl + Apiconfig.singleuser;

    final option  = Options(headers:  {'Authorization':'Bearer $token'});
    try {
      Response response = await dio.post(path,data: {"id":id},options: option); 

      if (response.statusCode == 200 || response.statusCode == 201) {

         var json = response.data;
         final  res =json["hype"] as List<dynamic>;  
         return res; 
      } 
      
    }on DioError catch (e) {
      log(e.message); 
    }
    return null;

  }




  Future<SingleUserDetailsRes?> getsingleuserdetails(String id,String token)async{

    String path = Apiconfig.baseUrl + Apiconfig.singleuser;

    final option  = Options(headers:  {'Authorization':'Bearer $token'});
    try {
      Response response = await dio.post(path,data: {"id":id},options: option); 

      if (response.statusCode == 200 || response.statusCode == 201) {

         
       final res = SingleUserDetailsRes.fromJson(response.data); 
      
       return res;
      } 
      
    }on DioError catch (e) {
      log(e.message); 
    }
    return null;

  }
}