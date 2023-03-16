// To parse this JSON data, do
//
//     final getMessgRes = getMessgResFromJson(jsonString);

import 'dart:convert';

List<GetMessgRes> getMessgResFromJson(String str) => List<GetMessgRes>.from(json.decode(str).map((x) => GetMessgRes.fromJson(x)));

String getMessgResToJson(List<GetMessgRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMessgRes {
    GetMessgRes({
        this.myself,
        this.message,
        this.hr,
        this.min,
    });

    bool? myself;
    String? message;
    int? hr;
    int? min;

    factory GetMessgRes.fromJson(Map<String, dynamic> json) => GetMessgRes(
        myself: json["myself"],
        message: json["message"],
        hr: json["hr"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "myself": myself,
        "message": message,
        "hr": hr,
        "min": min,
    };
}
