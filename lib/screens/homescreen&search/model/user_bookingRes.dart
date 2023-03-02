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
        this.userId,
        this.isAccepted,
        this.rejected,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    ProgramId? programId;
    DateTime? date;
    String? time;
    String? address;
    String? mob;
    Mark? mark;
    String? userId;
    bool? isAccepted;
    bool? rejected;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory UserBookingsResp.fromJson(Map<String, dynamic> json) => UserBookingsResp(
        id: json["_id"],
        programId: json["program_id"] == null ? null : ProgramId.fromJson(json["program_id"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        address: json["address"],
        mob: json["mob"],
        mark: json["mark"] == null ? null : Mark.fromJson(json["mark"]),
        userId: json["userID"],
        isAccepted: json["isAccepted"],
        rejected: json["rejected"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "program_id": programId?.toJson(),
        "date": date?.toIso8601String(),
        "time": time,
        "address": address,
        "mob": mob,
        "mark": mark?.toJson(),
        "userID": userId,
        "isAccepted": isAccepted,
        "rejected": rejected,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class Mark {
    Mark({
        this.latitude,
        this.longitude,
        this.zoom,
    });

    double? latitude;
    double? longitude;
    int? zoom;

    factory Mark.fromJson(Map<String, dynamic> json) => Mark(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        zoom: json["zoom"],
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
        this.selectedDaates,
        this.category,
        this.amount,
        this.description,
        this.imageArray,
        this.vdoFile,
        this.booking,
        this.user,
        this.bookingCount,
    });

    String? id;
    String? name;
    List<dynamic>? selectedDaates;
    String? category;
    int? amount;
    String? description;
    List<String>? imageArray;
    String? vdoFile;
    List<dynamic>? booking;
    String? user;
    int? bookingCount;

    factory ProgramId.fromJson(Map<String, dynamic> json) => ProgramId(
        id: json["_id"],
        name: json["name"],
        selectedDaates: json["selectedDaates"] == null ? [] : List<dynamic>.from(json["selectedDaates"]!.map((x) => x)),
        category: json["category"],
        amount: json["amount"],
        description: json["description"],
        imageArray: json["imageArray"] == null ? [] : List<String>.from(json["imageArray"]!.map((x) => x)),
        vdoFile: json["vdoFile"],
        booking: json["booking"] == null ? [] : List<dynamic>.from(json["booking"]!.map((x) => x)),
        user: json["user"],
        bookingCount: json["bookingCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "selectedDaates": selectedDaates == null ? [] : List<dynamic>.from(selectedDaates!.map((x) => x)),
        "category": category,
        "amount": amount,
        "description": description,
        "imageArray": imageArray == null ? [] : List<dynamic>.from(imageArray!.map((x) => x)),
        "vdoFile": vdoFile,
        "booking": booking == null ? [] : List<dynamic>.from(booking!.map((x) => x)),
        "user": user,
        "bookingCount": bookingCount,
    };
}
