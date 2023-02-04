import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/constant/Apiconfig.dart';
import 'package:makeframes/models/login_request_model.dart';
import 'package:makeframes/models/login_response_model.dart';
import 'package:makeframes/models/logincheck_respons.dart';
import 'package:makeframes/models/signup_request_model.dart';
import 'package:makeframes/models/signup_response.dart';

class ApiService {
    var dio = Dio();

// login service 
    Future<LoginResp?> login(LoginreqModel model) async {
    String path = Apiconfig.baseUrl + Apiconfig.loginApi;

    try {
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()),
          queryParameters: ApiQueryParameter.queryParameter);
           if(response.statusCode==200|| response.statusCode==201){
      log(response.data.toString());
      final LoginResp loginmodl = LoginResp.fromJson(response.data);
      return loginmodl;
           } 
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }



//signup service
  Future<SignupRes?> signup(SignupReqModel model) async {
    String path = Apiconfig.baseUrl + Apiconfig.signupApi;

    try {
      final  response = await dio.post(path,
          data: jsonEncode(
            model.toJson(),
          ),
         );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final  signupmodl = SignupRes.fromJson(response.data);
        return signupmodl;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }



// otp getting service
  Future<bool?> otpGet(String email) async {
    try {
      final Response response =
          await dio.post(Apiconfig.baseUrl + Apiconfig.otp, data: {
        "email": email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['messaged'] == true) {
          return true;
        } else {
          return false;
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  } 



//checking the token 
  Future<LoginCheckResp?> checktoken (String token ) async{
    try {
      final response = await dio.post(Apiconfig.baseUrl+Apiconfig.loginCheck,
      data:{"token":token});

      if(response.statusCode==200|| response.statusCode==201){
        log(response.data.toString());

        final tokencheck = LoginCheckResp.fromJson(response.data);
        return tokencheck;
      }
      
    }on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
