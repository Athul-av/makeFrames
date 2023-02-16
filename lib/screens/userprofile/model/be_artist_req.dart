// To parse this JSON data, do
//
//     final beArtistReq = beArtistReqFromJson(jsonString);

import 'dart:convert';

BeArtistReq beArtistReqFromJson(String str) => BeArtistReq.fromJson(json.decode(str));

String beArtistReqToJson(BeArtistReq data) => json.encode(data.toJson());

class BeArtistReq {
    BeArtistReq({
        this.token,
        this.domain,
        this.about,
    });

    String? token;
    String? domain;
    String? about;

    factory BeArtistReq.fromJson(Map<String, dynamic> json) => BeArtistReq(
        token: json["token"],
        domain: json["domain"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "domain": domain,
        "about": about,
    };
}
