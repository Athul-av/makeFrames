import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/homescreen&search/model/user_bookingRes.dart';

class UserBookedShowListService{

  Dio dio = Dio();

Future<List<UserBookingsResp>?>  getuserbookedshow (String token)async{

  String path =Apiconfig.baseUrl + Apiconfig.userbookedshows;

  try {
    Response response = await dio.post(path,data:{'token':token});

    if(response.statusCode == 200 || response.statusCode == 201){
      final List<dynamic>  json = response.data;
      final List<UserBookingsResp> res = json.map((e) =>  UserBookingsResp.fromJson(e)).toList(); 
      return res; 
    }
  }on DioError catch (e) {
    log(e.message);
  }
  return null;
}
}