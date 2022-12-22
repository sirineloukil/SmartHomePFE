// To parse this JSON data, do
//
//     final device = deviceFromJson(jsonString);

import 'dart:convert';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

class Device {
  Device({
    required this.idD,
    required this.ref,
  });

  String idD;
  String ref;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    idD: json["idD"],
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "idD": idD,
    "ref": ref,
  };
}
