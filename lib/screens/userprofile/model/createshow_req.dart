// To parse this JSON data, do
//
//     final createShowReq = createShowReqFromJson(jsonString);

import 'dart:convert';

CreateShowReq createShowReqFromJson(String str) => CreateShowReq.fromJson(json.decode(str));

String createShowReqToJson(CreateShowReq data) => json.encode(data.toJson());

class CreateShowReq {
    CreateShowReq({
        this.token,
        this.name,
        this.category,
        this.amount,
        this.description,
        this.videoUrl,
        this.imageArray,
    });

    String? token;
    String? name;
    String? category;
    num? amount; 
    String? description;
    String? videoUrl;
    List<String>? imageArray;

    factory CreateShowReq.fromJson(Map<String, dynamic> json) => CreateShowReq(
        token: json["token"],
        name: json["name"],
        category: json["category"],
        amount: json["amount"],
        description: json["description"],
        videoUrl: json["videoUrl"],
        imageArray: json["imageArray"] == null ? [] : List<String>.from(json["imageArray"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "category": category,
        "amount": amount, 
        "description": description,
        "videoUrl": videoUrl,
        "imageArray": imageArray == null ? [] : List<dynamic>.from(imageArray!.map((x) => x)),
    };
}
