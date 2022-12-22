// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
   required this.idShFab,
    required  this.verHard,
    required this.verSoft,
    this.dateFab,
    this.dateOeuvre,
    this.zones,
    required this.label,
    required this.location,
  });

  String idShFab;
  String verHard;
  String verSoft;
  dynamic dateFab;
  dynamic dateOeuvre;
  dynamic zones;
  String label;
  String location;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    idShFab: json["idSHFab"],
    verHard: json["verHard"],
    verSoft: json["verSoft"],
    dateFab: json["dateFab"],
    dateOeuvre: json["dateOeuvre"],
    zones: json["zones"],
    label: json["label"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "idSHFab": idShFab,
    "verHard": verHard,
    "verSoft": verSoft,
    "dateFab": dateFab,
    "dateOeuvre": dateOeuvre,
    "zones": zones,
    "label": label,
    "location": location,
  };
}
