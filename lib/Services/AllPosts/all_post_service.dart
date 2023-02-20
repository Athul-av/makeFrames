
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/all_post_res.dart';

class AllPostService{

  Dio dio = Dio();

  Future<List<AllPostRes>?> getallpost(String token)async{

    String path = Apiconfig.baseUrl + Apiconfig.allpost;

    try {
      
      Response response = await dio.post(path,data: {'token':token});  
      if(response.statusCode == 200 || response.statusCode == 201){
      log(response.data.toString());
        final List<AllPostRes> res = allPostResFromJson(response.data);
        return res;  
        
      }    
      else{
        return null;  
      }
    }on DioError catch (e) {
      log(e.message);
    }
      return null;
  } 
}