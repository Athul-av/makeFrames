// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
    LoginResp({
        this.isuser,
        this.isPass,
        this.token,
    });

    bool? isuser;
    bool? isPass;
    String? token;

    factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
        isuser: json["isuser"],
        isPass: json["isPass"],
        token: json["token"],
    ); 

    Map<String, dynamic> toJson() => {
        "isuser": isuser,
        "isPass": isPass,
        "token": token,
    };
}
