// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJsonMap(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String id;
  String nombre;
  String clave;

  UserModel({
    required this.id,
    required this.nombre,
    required this.clave,
  });

  factory UserModel.fromJsonMap(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      nombre: json["nombre"],
      clave: json["clave"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "clave": clave,
      };
}
