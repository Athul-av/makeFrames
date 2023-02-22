// To parse this JSON data, do
//
//     final artistCreatedShowRes = artistCreatedShowResFromJson(jsonString);

import 'dart:convert';

List<ArtistCreatedShowRes> artistCreatedShowResFromJson(String str) => List<ArtistCreatedShowRes>.from(json.decode(str).map((x) => ArtistCreatedShowRes.fromJson(x)));

String artistCreatedShowResToJson(List<ArtistCreatedShowRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistCreatedShowRes {
    ArtistCreatedShowRes({
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
    List<dynamic>? imageArray;
    String? vdoFile;
    String? user;

    factory ArtistCreatedShowRes.fromJson(Map<String, dynamic> json) => ArtistCreatedShowRes(
        bookingCount: json["bookingCount"],
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        amount: json["amount"],
        description: json["description"],
        imageArray: json["imageArray"] == null ? [] : List<dynamic>.from(json["imageArray"]!.map((x) => x)),
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
