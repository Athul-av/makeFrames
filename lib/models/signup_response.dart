

import 'dart:convert';

SignupRes signupResFromJson(String str) => SignupRes.fromJson(json.decode(str));

String signupResToJson(SignupRes data) => json.encode(data.toJson());
 
class SignupRes {
    SignupRes({
        this.isUser,
    });

    IsUser? isUser;

    factory SignupRes.fromJson(Map<String, dynamic> json) => SignupRes(
        isUser: json["isUser"] == null ? null : IsUser.fromJson(json["isUser"]),
    );

    Map<String, dynamic> toJson() => {
        "isUser": isUser?.toJson(),
    };
}

class IsUser {
    IsUser({
        this.token,
        this.isUserIs,
        this.serverOtp
    });

    String? token;
    String? isUserIs;
    int? serverOtp;

    factory IsUser.fromJson(Map<String, dynamic> json) => IsUser(
        token: json["token"],
        isUserIs: json["is"],
        serverOtp:json["serverOtp"]
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "is": isUserIs,
        "serverOtp":serverOtp
    };
}
