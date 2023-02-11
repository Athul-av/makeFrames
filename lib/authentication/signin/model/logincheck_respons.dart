// To parse this JSON data, do
//
//     final loginCheckResp = loginCheckRespFromJson(jsonString);

import 'dart:convert';

LoginCheckResp loginCheckRespFromJson(String str) => LoginCheckResp.fromJson(json.decode(str));

String loginCheckRespToJson(LoginCheckResp data) => json.encode(data.toJson());

class LoginCheckResp {
    LoginCheckResp({
        this.user,
        this.firstName,
        this.lastName,
    });

    bool? user;
    String? firstName;
    String? lastName;

    factory LoginCheckResp.fromJson(Map<String, dynamic> json) => LoginCheckResp(
        user: json["user"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "firstName": firstName,
        "lastName": lastName,
    };
}
