import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/screens/message/model/getmssg_res.dart';

class GetMessageService{
  Dio dio = Dio();

Future<List<GetMessgRes>?>getallmssg(String token,String fromid,String toid)async{
  String path = Apiconfig.baseUrl + Apiconfig.getmssg;

  final option = Options( headers: {'Authorization':'Bearer $token'});

  try {
    
    Response response = await dio.post(path,data: {"userid1":fromid,"userid2":toid},options: option);
    if (response.statusCode == 200|| response.statusCode ==201) {
      final List<dynamic> json = response.data;
      final res = json.map((e) => GetMessgRes.fromJson(e)).toList();
      return res;
    }
    
  }on DioError catch (e) {
    log(e.message);
  }
  return null;
}
}