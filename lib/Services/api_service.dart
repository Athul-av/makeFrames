
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/constant/Apiconfig.dart';
import 'package:makeframes/models/login_request_model.dart';
import 'package:makeframes/models/otp_model.dart';
import 'package:makeframes/models/signup_request_model.dart';


class ApiService{

  var dio = Dio();

  Future<bool?> login(LoginreqModel model)async{
 
  String path = Apiconfig.baseUrl+Apiconfig.loginApi;
    
  try {
    var response =await dio.post(path,data: jsonEncode(model.toJson()));
    log(response.data.toString());    
      if(response.data["isuser"] == true && response.data["isPass"] == true){     
        return true;
      }else{ 
        return false ;   
      }
    
  }on DioError catch (e) {
    log(e.message.toString());
  }
      
     
  }



  Future<bool?>signup(SignupReqModel model)async{

   String path = Apiconfig.baseUrl+Apiconfig.signupApi;
   
  try {
    final Response response = await dio.post(
  path,
  data: jsonEncode(model.toJson()),
 
    );
    if(response.statusCode == 200 || response.statusCode==201){
      log(response.data.toString()); 
      if(response.data["is"]==true){
        return false;  
      }else if(response.data["is"]== false && response.data["serverOtp"]==true){
        return true; 
      }else{ 

      }
    }
    
  }on DioError catch (e) {
    log(e.message.toString());
  }

   
  }





  Future<bool> otpGenerate (OtpModel model)async{

    String path = Apiconfig.baseUrl+Apiconfig.otp;

    var response = await dio.post(path,data: jsonEncode(model.toJson()));
    log(response.data.toString()); 
    if(response.data["messaged"]==false){
      return false;
    }else{
      return true;
    }
  }
}