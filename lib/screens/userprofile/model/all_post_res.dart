// To parse this JSON data, do
//
//     final allPostRes = allPostResFromJson(jsonString);

import 'dart:convert';

List<AllPostRes> allPostResFromJson(String str) => List<AllPostRes>.from(json.decode(str).map((x) => AllPostRes.fromJson(x)));

String allPostResToJson(List<AllPostRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPostRes {
    AllPostRes({
        this.id,
        this.images,
        this.coments,
        this.user,
        this.v,
    });

    String? id;
    List<String>? images;
    String? coments;
    String? user;
    int? v;

    factory AllPostRes.fromJson(Map<String, dynamic> json) => AllPostRes(
        id: json["_id"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        coments: json["coments"],
        user: json["user"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "coments": coments,
        "user": user,
        "__v": v,
    };
}
