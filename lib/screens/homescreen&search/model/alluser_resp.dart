// To parse this JSON data, do
//
//     final allUsersDetailsRes = allUsersDetailsResFromJson(jsonString);

import 'dart:convert';

List<AllUsersDetailsRes> allUsersDetailsResFromJson(String str) => List<AllUsersDetailsRes>.from(json.decode(str).map((x) => AllUsersDetailsRes.fromJson(x)));

String allUsersDetailsResToJson(List<AllUsersDetailsRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllUsersDetailsRes {
    AllUsersDetailsRes({
        this.connection,
        this.hypeCount,
        this.messagedPeople,
        this.id,
        this.firstName,
        this.email,
        this.password,
        this.isArtist,
        this.domain,
        this.bookings,
        this.v,
        this.about,
        this.hype,
        this.dpimage,
        this.lastName,
    });

    List<dynamic>? connection;
    int? hypeCount;
    List<dynamic>? messagedPeople;
    String? id;
    String? firstName;
    String? email;
    String? password;
    bool? isArtist;
    String? domain;
    List<dynamic>? bookings;
    int? v;
    String? about;
    List<String>? hype;
    String? dpimage;
    String? lastName;

    factory AllUsersDetailsRes.fromJson(Map<String, dynamic> json) => AllUsersDetailsRes(
        connection: json["connection"] == null ? [] : List<dynamic>.from(json["connection"]!.map((x) => x)),
        hypeCount: json["hypeCount"],
        messagedPeople: json["MessagedPeople"] == null ? [] : List<dynamic>.from(json["MessagedPeople"]!.map((x) => x)),
        id: json["_id"],
        firstName: json["firstName"],
        email: json["email"],
        password: json["password"],
        isArtist: json["isArtist"],
        domain: json["domain"],
        bookings: json["bookings"] == null ? [] : List<dynamic>.from(json["bookings"]!.map((x) => x)),
        v: json["__v"],
        about: json["about"],
        hype: json["hype"] == null ? [] : List<String>.from(json["hype"]!.map((x) => x)),
        dpimage: json["dpimage"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "connection": connection == null ? [] : List<dynamic>.from(connection!.map((x) => x)),
        "hypeCount": hypeCount,
        "MessagedPeople": messagedPeople == null ? [] : List<dynamic>.from(messagedPeople!.map((x) => x)),
        "_id": id,
        "firstName": firstName,
        "email": email,
        "password": password,
        "isArtist": isArtist,
        "domain": domain,
        "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x)),
        "__v": v,
        "about": about,
        "hype": hype == null ? [] : List<dynamic>.from(hype!.map((x) => x)),
        "dpimage": dpimage,
        "lastName": lastName,
    };
}
 