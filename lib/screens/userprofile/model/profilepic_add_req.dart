


// To parse this JSON data, do
//
//     final profilePicReq = profilePicReqFromJson(jsonString);

import 'dart:convert';

ProfilePicReq profilePicReqFromJson(String str) => ProfilePicReq.fromJson(json.decode(str));

String profilePicReqToJson(ProfilePicReq data) => json.encode(data.toJson());

class ProfilePicReq {
    ProfilePicReq({
        this.image,
        this.token,
    });

    String? image;
    String? token;

    factory ProfilePicReq.fromJson(Map<String, dynamic> json) => ProfilePicReq(
        image: json["image"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "token": token,
    };
}
