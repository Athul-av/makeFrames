// To parse this JSON data, do
//
//     final userDetailsRes = userDetailsResFromJson(jsonString);

import 'dart:convert';

UserDetailsRes userDetailsResFromJson(String str) => UserDetailsRes.fromJson(json.decode(str));

String userDetailsResToJson(UserDetailsRes data) => json.encode(data.toJson());

class UserDetailsRes {
    UserDetailsRes({
        this.dpimage,
        this.id,
        this.firstName,
        this.lastName,
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
        this.about,
    });

    dynamic dpimage;
    String? id;
    String? firstName;
    String? lastName;
    String? email;
    String? password;
    bool? isArtist;
    String? domain;
    List<dynamic>? bookings;
    List<String>? hype;
    List<dynamic>? connection;
    int? hypeCount;
    List<dynamic>? messagedPeople;
    bool? isProducer;
    bool? isBlocked;
    String? about;

    factory UserDetailsRes.fromJson(Map<String, dynamic> json) => UserDetailsRes(
        dpimage: json["dpimage"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        isArtist: json["isArtist"],
        domain: json["domain"],
        bookings: json["bookings"] == null ? [] : List<dynamic>.from(json["bookings"]!.map((x) => x)),
        hype: json["hype"] == null ? [] : List<String>.from(json["hype"]!.map((x) => x)),
        connection: json["connection"] == null ? [] : List<dynamic>.from(json["connection"]!.map((x) => x)),
        hypeCount: json["hypeCount"],
        messagedPeople: json["MessagedPeople"] == null ? [] : List<dynamic>.from(json["MessagedPeople"]!.map((x) => x)),
        isProducer: json["isProducer"],
        isBlocked: json["isBlocked"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "dpimage": dpimage,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
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
        "about": about,
    };
}
