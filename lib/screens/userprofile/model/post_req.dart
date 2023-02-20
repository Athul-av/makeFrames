// To parse this JSON data, do
//
//     final postReq = postReqFromJson(jsonString);

import 'dart:convert';

PostReq postReqFromJson(String str) => PostReq.fromJson(json.decode(str));

String postReqToJson(PostReq data) => json.encode(data.toJson());

class PostReq {
    PostReq({
        this.images,
        this.coments,
        this.token,
    });

    String? images;
    String? coments;
    String? token;

    factory PostReq.fromJson(Map<String, dynamic> json) => PostReq(
        images: json["images"],
        coments: json["coments"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "images": images,
        "coments": coments,
        "token": token,
    };
}
