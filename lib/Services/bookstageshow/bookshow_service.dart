import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/stageShow/model/bookstage_Req.dart';

class BookStageShowService {
  Dio dio = Dio();


 Future<bool?> bookshow ( BookStageReqst model)async{

  String path = Apiconfig.baseUrl + Apiconfig.bookshow;

try {
  
  Response response = await dio.post(path,data: model);
  if(response.statusCode == 200 || response.statusCode == 201){
    if(response.data['booked']== true){
      return true;
    }
  }else{
    return false;
  }
}on DioError catch (e) {
  log(e.message); 
}
return null;
 }
}