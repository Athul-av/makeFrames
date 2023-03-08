// To parse this JSON data, do
//
//     final userBookingsResp = userBookingsRespFromJson(jsonString);

import 'dart:convert';

List<UserBookingsResp> userBookingsRespFromJson(String str) => List<UserBookingsResp>.from(json.decode(str).map((x) => UserBookingsResp.fromJson(x)));

String userBookingsRespToJson(List<UserBookingsResp> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserBookingsResp {
    UserBookingsResp({
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
        this.v,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    ProgramId? programId;
    dynamic date;
    String? time;
    String? address;
    String? mob;
    CurrentLocation? mark;
    CurrentLocation? currentLocation;
    String? userId;
    bool? isAccepted;
    bool? rejected;
    int? v;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory UserBookingsResp.fromJson(Map<String, dynamic> json) => UserBookingsResp(
        id: json["_id"],
        programId: json["program_id"] == null ? null : ProgramId.fromJson(json["program_id"]),
        date: json["date"],
        time: json["time"],
        address: json["address"],
        mob: json["mob"],
        mark: json["mark"] == null ? null : CurrentLocation.fromJson(json["mark"]),
        currentLocation: json["currentLocation"] == null ? null : CurrentLocation.fromJson(json["currentLocation"]),
        userId: json["userID"],
        isAccepted: json["isAccepted"],
        rejected: json["rejected"],
        v: json["__v"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "program_id": programId?.toJson(),
        "date": date,
        "time": time,
        "address": address,
        "mob": mob,
        "mark": mark?.toJson(),
        "currentLocation": currentLocation?.toJson(),
        "userID": userId,
        "isAccepted": isAccepted,
        "rejected": rejected,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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

class ProgramId {
    ProgramId({
        this.id,
        this.name,
      
        this.category,
        this.amount,
        this.description,
        this.imageArray,
        this.vdoFile,
        this.booking,
        this.user,
        this.bookingCount,
        this.isBlocked,
        this.v,
    });

    String? id;
    String? name;
    List<DateTime>? selectedDaates;
    String? category;
    int? amount;
    String? description;
    List<String>? imageArray;
    String? vdoFile;
    List<dynamic>? booking;
    String? user;
    int? bookingCount;
    bool? isBlocked;
    int? v;

    factory ProgramId.fromJson(Map<String, dynamic> json) => ProgramId(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        amount: json["amount"],
        description: json["description"],
        imageArray: json["imageArray"] == null ? [] : List<String>.from(json["imageArray"]!.map((x) => x)),
        vdoFile: json["vdoFile"],
        booking: json["booking"] == null ? [] : List<dynamic>.from(json["booking"]!.map((x) => x)),
        user: json["user"],
        bookingCount: json["bookingCount"],
        isBlocked: json["isBlocked"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "category": category,
        "amount": amount,
        "description": description,
        "imageArray": imageArray == null ? [] : List<dynamic>.from(imageArray!.map((x) => x)),
        "vdoFile": vdoFile,
        "booking": booking == null ? [] : List<dynamic>.from(booking!.map((x) => x)),
        "user": user,
        "bookingCount": bookingCount,
        "isBlocked": isBlocked,
        "__v": v,
    };
}
