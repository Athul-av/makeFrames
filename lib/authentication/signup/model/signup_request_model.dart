// To parse this JSON data, do
//
//     final signupReq = signupReqFromJson(jsonString);

import 'dart:convert';

SignupReqModel signupReqFromJson(String str) => SignupReqModel.fromJson(json.decode(str));

String signupReqToJson(SignupReqModel data) => json.encode(data.toJson());

class SignupReqModel {
    SignupReqModel({
        this.firstName,
        this.email,
        this.password,
        this.otp
    });
 
    String? firstName; 
    String? email;
    String? password;
    String? otp;

    factory SignupReqModel.fromJson(Map<String, dynamic> json) => SignupReqModel(
        firstName: json["firstName"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"]
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "email": email,
        "password": password,
        "otp":otp     
    };
}
