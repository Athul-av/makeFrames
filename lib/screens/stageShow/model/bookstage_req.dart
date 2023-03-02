// To parse this JSON data, do
//
//     final bookStageReqst = bookStageReqstFromJson(jsonString);

import 'dart:convert';

BookStageReqst bookStageReqstFromJson(String str) => BookStageReqst.fromJson(json.decode(str));

String bookStageReqstToJson(BookStageReqst data) => json.encode(data.toJson());

class BookStageReqst {
    BookStageReqst({
        this.token,
        this.program_id,
        this.date,
        this.time,
        this.address,
        this.mob,
        this.mark,
    });

    String? token;
    String? program_id;
    String? date;
    String? time;
    String? address;
    String? mob;
    Mark? mark;

    factory BookStageReqst.fromJson(Map<String, dynamic> json) => BookStageReqst(
        token: json["token"],
        program_id: json["program_id"],
        date: json["date"],
        time: json["time"],
        address: json["address"],
        mob: json["mob"],
        mark: json["mark"] == null ? null : Mark.fromJson(json["mark"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "program_id": program_id,
        "date": date,
        "time": time,
        "address": address,
        "mob": mob,
        "mark": mark?.toJson(),
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
