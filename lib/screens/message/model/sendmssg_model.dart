// To parse this JSON data, do
//
//     final sendMessage = sendMessageFromJson(jsonString);


class SendMssg {
    SendMssg({
        this.from,
        this.to,
        this.message,
    });

    String? from;
    String? to;
    String? message;

    factory SendMssg.fromJson(Map<String, dynamic> json) => SendMssg(
        from: json["from"],
        to: json["to"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "message": message,
    };
}
