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
        this.selectedDaates,
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
    List<DateTime>? selectedDaates;
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
        selectedDaates: json["selectedDaates"] == null ? [] : List<DateTime>.from(json["selectedDaates"]!.map((x) => DateTime.parse(x))),
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
        "selectedDaates": selectedDaates == null ? [] : List<dynamic>.from(selectedDaates!.map((x) => x.toIso8601String())),
        "category": category,
        "amount": amount,
        "description": description,
        "imageArray": imageArray == null ? [] : List<dynamic>.from(imageArray!.map((x) => x)),
        "vdoFile": vdoFile,
        "user": user,
    };
}
