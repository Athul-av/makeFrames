// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
    LoginResp({
        this.status,
    });

    Status? status;

    factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
    };
}

class Status {
    Status({
        this.isuser,
        this.isPass,
        this.token,
    });

    String? isuser;
    String? isPass;
    String? token;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
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
