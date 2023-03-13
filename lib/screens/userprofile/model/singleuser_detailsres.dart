// To parse this JSON data, do
//
//     final singleUserDetailsRes = singleUserDetailsResFromJson(jsonString);

import 'dart:convert';

SingleUserDetailsRes singleUserDetailsResFromJson(String str) => SingleUserDetailsRes.fromJson(json.decode(str));

String singleUserDetailsResToJson(SingleUserDetailsRes data) => json.encode(data.toJson());

class SingleUserDetailsRes {
    SingleUserDetailsRes({
        this.dpimage,
        this.id,
        this.firstName,
        this.email,
        this.password,
        this.isArtist,
        this.domain,
        this.bookings,
        this.hype,
        this.connection,
        this.hypeCount,
        this.messagedPeople,
        this.isProducer,
        this.isBlocked,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    dynamic dpimage;
    String? id;
    String? firstName;
    String? email;
    String? password;
    bool? isArtist;
    String? domain;
    List<dynamic>? bookings;
    List<dynamic>? hype;
    List<dynamic>? connection;
    int? hypeCount;
    List<dynamic>? messagedPeople;
    bool? isProducer;
    bool? isBlocked;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory SingleUserDetailsRes.fromJson(Map<String, dynamic> json) => SingleUserDetailsRes(
        dpimage: json["dpimage"],
        id: json["_id"],
        firstName: json["firstName"],
        email: json["email"],
        password: json["password"],
        isArtist: json["isArtist"],
        domain: json["domain"],
        bookings: json["bookings"] == null ? [] : List<dynamic>.from(json["bookings"]!.map((x) => x)),
        hype: json["hype"] == null ? [] : List<dynamic>.from(json["hype"]!.map((x) => x)),
        connection: json["connection"] == null ? [] : List<dynamic>.from(json["connection"]!.map((x) => x)),
        hypeCount: json["hypeCount"],
        messagedPeople: json["MessagedPeople"] == null ? [] : List<dynamic>.from(json["MessagedPeople"]!.map((x) => x)),
        isProducer: json["isProducer"],
        isBlocked: json["isBlocked"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "dpimage": dpimage,
        "_id": id,
        "firstName": firstName,
        "email": email,
        "password": password,
        "isArtist": isArtist,
        "domain": domain,
        "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x)),
        "hype": hype == null ? [] : List<dynamic>.from(hype!.map((x) => x)),
        "connection": connection == null ? [] : List<dynamic>.from(connection!.map((x) => x)),
        "hypeCount": hypeCount,
        "MessagedPeople": messagedPeople == null ? [] : List<dynamic>.from(messagedPeople!.map((x) => x)),
        "isProducer": isProducer,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
