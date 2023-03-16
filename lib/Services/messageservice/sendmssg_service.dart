import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/message/model/sendmssg_model.dart';

class SendMessageService{
  Dio dio = Dio();

  Future<void> sendmssg(String token , SendMssg model)async{
 
 String path = Apiconfig.baseUrl + Apiconfig.sendmssg;
  final option = Options(headers: {'Authorization':'Bearer $token'});  

 try {

Response response = await dio.post(path,data:jsonEncode(model.toJson()),options: option);

if(response.statusCode ==200 || response.statusCode ==201){
  log("sendmessage");
}else{
  log("notsent");
}
   
 }on DioError catch (e) {
   log(e.message);
 }
  }
}