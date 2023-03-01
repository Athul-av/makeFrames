// To parse this JSON data, do
//
//     final allUsersPostsRes = allUsersPostsResFromJson(jsonString);

import 'dart:convert';

List<AllUsersPostsRes> allUsersPostsResFromJson(String str) => List<AllUsersPostsRes>.from(json.decode(str).map((x) => AllUsersPostsRes.fromJson(x)));

String allUsersPostsResToJson(List<AllUsersPostsRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllUsersPostsRes {
    AllUsersPostsRes({
        this.id,
        this.images,
        this.coments,
        this.user,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    List<String>? images;
    String? coments;
    String? user;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory AllUsersPostsRes.fromJson(Map<String, dynamic> json) => AllUsersPostsRes(
        id: json["_id"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        coments: json["coments"],
        user: json["user"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "coments": coments,
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
