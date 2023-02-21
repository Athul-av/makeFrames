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
        this.image,
    });

    String? token;
    String? name;
    String? category;
    num? amount;
    String? description;
    String? videoUrl;
    List<String>? image;

    factory CreateShowReq.fromJson(Map<String, dynamic> json) => CreateShowReq(
        token: json["token"],
        name: json["name"],
        category: json["category"],
        amount: json["amount"],
        description: json["description"],
        videoUrl: json["videoUrl"],
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "category": category,
        "amount": amount,
        "description": description,
        "videoUrl": videoUrl,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    };
}
