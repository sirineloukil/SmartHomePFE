// To parse this JSON data, do
//
//     final zone = zoneFromJson(jsonString);

import 'dart:convert';

Zone zoneFromJson(String str) => Zone.fromJson(json.decode(str));

String zoneToJson(Zone data) => json.encode(data.toJson());

class Zone {
  Zone({
    required this.idZ,
    required this.label,
    this.devices,
    this.pairings,
  });

  String idZ;
  String label;
  dynamic? devices;
  dynamic? pairings;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    idZ: json["idZ"],
    label: json["label"],
    devices: json["devices"],
    pairings: json["pairings"],
  );

  Map<String, dynamic> toJson() => {
    "idZ": idZ,
    "label": label,
    "devices": devices,
    "pairings": pairings,
  };
}
