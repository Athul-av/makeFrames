import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:makeframes/core/api/apiconfig.dart';
import 'package:makeframes/authentication/signin/model/login_request_model.dart';
import 'package:makeframes/authentication/signin/model/login_response_model.dart';
import 'package:makeframes/authentication/signin/model/logincheck_respons.dart';
import 'package:makeframes/authentication/signup/model/signup_request_model.dart';
import 'package:makeframes/authentication/signup/model/signup_response.dart';

class AuthApiService {
  var dio = Dio();

// LOGIN API SERVICE
  Future<LoginResp?> login(LoginreqModel model) async {
    String path = Apiconfig.baseUrl + Apiconfig.loginApi;

    try {
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()),
          queryParameters: ApiQueryParameter.queryParameter);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final LoginResp loginmodl = LoginResp.fromJson(response.data);  
        return loginmodl;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }

//SIGNUP API SERVICE
  Future<SignupRes?> signup(SignupReqModel model) async {
    String path = Apiconfig.baseUrl + Apiconfig.signupApi;

    try {
      final response = await dio.post(
        path,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final signupmodl = SignupRes.fromJson(response.data);
        return signupmodl;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }

// API SERVICE FOR OTP TO THE EMAIL
  Future<bool?> otpGet(String email) async {

    try {
      final Response response =
          await dio.post(Apiconfig.baseUrl + Apiconfig.otp, data: {
        "email": email,
      });
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data);   
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

// CHECKING TOKEN VALID OR NOT API SERVICE
  Future<LoginCheckResp?>checktoken(String token) async {
    try {
      final response = await dio.post(Apiconfig.baseUrl + Apiconfig.loginCheck,
          data: {"token": token});

      if (response.statusCode == 200 || response.statusCode == 201) {

        final tokencheck = LoginCheckResp.fromJson(response.data);
        return tokencheck;
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}


