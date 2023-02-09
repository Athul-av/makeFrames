// To parse this JSON data, do
//
//     final loginreq = loginreqFromJson(jsonString);

import 'dart:convert';

LoginreqModel loginreqFromJson(String str) => LoginreqModel.fromJson(json.decode(str));

String loginreqToJson(LoginreqModel data) => json.encode(data.toJson());

class LoginreqModel {
    LoginreqModel({
        this.email,
        this.password, 
    });

    String? email;
    String? password;

    factory LoginreqModel.fromJson(Map<String, dynamic> json) => LoginreqModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
