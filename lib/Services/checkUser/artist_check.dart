import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/userprofile/model/checkartist_rep.dart';

class ArtistCheck {

  var dio =Dio();

 Future<CheckartistRes?> checkartist(String token)async{

   String path = Apiconfig.baseUrl + Apiconfig.checkartist;
  try {
    
     Response response = await dio.post(path,data:{"token":token});
    if(response.statusCode==200 || response.statusCode == 201 ){
      log(response.data.toString());
      final CheckartistRes res = CheckartistRes.fromJson(response.data);
      return res;
    } 

}on DioError catch (e) {
   log(e.message.toString()); 
  }
  return null;

 }

}