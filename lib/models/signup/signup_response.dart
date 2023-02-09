// To parse this JSON data, do
//
//     final signupRes = signupResFromJson(jsonString);

import 'dart:convert';

SignupRes signupResFromJson(String str) => SignupRes.fromJson(json.decode(str));

String signupResToJson(SignupRes data) => json.encode(data.toJson());

class SignupRes {
    SignupRes({
        this.signupResIs,
        this.token,
        this.serverOtp,
    });

    bool? signupResIs;
    String? token;
    bool? serverOtp; 

    factory SignupRes.fromJson(Map<String, dynamic> json) => SignupRes(
        signupResIs: json["is"],
        token: json["token"],
        serverOtp: json["serverOtp"],
    );

    Map<String, dynamic> toJson() => { 
        "is": signupResIs,
        "token": token,
        "serverOtp": serverOtp,
    };
}
