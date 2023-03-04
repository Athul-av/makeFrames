// To parse this JSON data, do
//
//     final artistGotBookingRes = artistGotBookingResFromJson(jsonString);

import 'dart:convert';

ArtistGotBookingRes artistGotBookingResFromJson(String str) => ArtistGotBookingRes.fromJson(json.decode(str));

String artistGotBookingResToJson(ArtistGotBookingRes data) => json.encode(data.toJson());

class ArtistGotBookingRes {
    ArtistGotBookingRes({
        this.pend,
        this.acc,
        this.his,
    });

    List<Acc>? pend;
    List<Acc>? acc;
    List<Acc>? his;

    factory ArtistGotBookingRes.fromJson(Map<String, dynamic> json) => ArtistGotBookingRes(
        pend: json["pend"] == null ? [] : List<Acc>.from(json["pend"]!.map((x) => Acc.fromJson(x))),
        acc: json["acc"] == null ? [] : List<Acc>.from(json["acc"]!.map((x) => Acc.fromJson(x))),
        his: json["his"] == null ? [] : List<Acc>.from(json["his"]!.map((x) => Acc.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pend": pend == null ? [] : List<dynamic>.from(pend!.map((x) => x.toJson())),
        "acc": acc == null ? [] : List<dynamic>.from(acc!.map((x) => x.toJson())),
        "his": his == null ? [] : List<dynamic>.from(his!.map((x) => x.toJson())),
    };
}

class Acc {
    Acc({
        this.id,
        this.programId,
        this.date,
        this.time,
        this.address,
        this.mob,
        this.mark,
        this.currentLocation,
        this.userId,
        this.isAccepted,
        this.rejected,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? programId;
    dynamic date;
    String? time;
    String? address;
    String? mob;
    CurrentLocation? mark;
    CurrentLocation? currentLocation;
    String? userId;
    bool? isAccepted;
    bool? rejected;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Acc.fromJson(Map<String, dynamic> json) => Acc(
        id: json["_id"],
        programId: json["program_id"],
        date: json["date"],
        time: json["time"],
        address: json["address"],
        mob: json["mob"],
        mark: json["mark"] == null ? null : CurrentLocation.fromJson(json["mark"]),
        currentLocation: json["currentLocation"] == null ? null : CurrentLocation.fromJson(json["currentLocation"]),
        userId: json["userID"],
        isAccepted: json["isAccepted"],
        rejected: json["rejected"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "program_id": programId,
        "date": date,
        "time": time,
        "address": address,
        "mob": mob,
        "mark": mark?.toJson(),
        "currentLocation": currentLocation?.toJson(),
        "userID": userId,
        "isAccepted": isAccepted,
        "rejected": rejected,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class CurrentLocation {
    CurrentLocation({
        this.latitude,
        this.longitude,
        this.zoom,
    });

    double? latitude;
    double? longitude;
    double? zoom;

    factory CurrentLocation.fromJson(Map<String, dynamic> json) => CurrentLocation(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        zoom: json["zoom"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "zoom": zoom,
    };
}
