// To parse this JSON data, do
//
//     final allStageShowRes = allStageShowResFromJson(jsonString);

import 'dart:convert';

List<AllStageShowRes> allStageShowResFromJson(String str) => List<AllStageShowRes>.from(json.decode(str).map((x) => AllStageShowRes.fromJson(x)));

String allStageShowResToJson(List<AllStageShowRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllStageShowRes {
    AllStageShowRes({
        this.bookingCount,
        this.id,
        this.name,
        this.category,
        this.amount,
        this.description,
        this.imageArray,
        this.vdoFile,
        this.user,
    });

    int? bookingCount;
    String? id;
    String? name;
    String? category;
    int? amount;
    String? description;
    List<String>? imageArray;
    String? vdoFile;
    String? user;

    factory AllStageShowRes.fromJson(Map<String, dynamic> json) => AllStageShowRes(
        bookingCount: json["bookingCount"],
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        amount: json["amount"],
        description: json["description"],
        imageArray: json["imageArray"] == null ? [] : List<String>.from(json["imageArray"]!.map((x) => x)),
        vdoFile: json["vdoFile"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "bookingCount": bookingCount,
        "_id": id,
        "name": name,
        "category": category,
        "amount": amount,
        "description": description,
        "imageArray": imageArray == null ? [] : List<dynamic>.from(imageArray!.map((x) => x)),
        "vdoFile": vdoFile,
        "user": user,
    };
}
