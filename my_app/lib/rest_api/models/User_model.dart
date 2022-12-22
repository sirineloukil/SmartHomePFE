// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.idUser,
    required  this.name,
    required this.lastname,
    required this.email,
    required this.address,
    required this.role,
  });

  String idUser;
  String name;
  String lastname;
  String email;
  String address;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["idUser"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    address: json["address"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "idUser": idUser,
    "name": name,
    "lastname": lastname,
    "email": email,
    "address": address,
    "role": role,
  };
}
