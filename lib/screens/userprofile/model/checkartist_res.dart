// To parse this JSON data, do
//
//     final checkartistRes = checkartistResFromJson(jsonString);

import 'dart:convert';

CheckartistRes checkartistResFromJson(String str) => CheckartistRes.fromJson(json.decode(str));

String checkartistResToJson(CheckartistRes data) => json.encode(data.toJson());

class CheckartistRes {
    CheckartistRes({
        this.timeOut,
        this.isArtist,
    });

    bool? timeOut;
    bool? isArtist;

    factory CheckartistRes.fromJson(Map<String, dynamic> json) => CheckartistRes(
        timeOut: json["timeOut"],
        isArtist: json["isArtist"],
    );

    Map<String, dynamic> toJson() => {
        "timeOut": timeOut,
        "isArtist": isArtist,
    };
}
