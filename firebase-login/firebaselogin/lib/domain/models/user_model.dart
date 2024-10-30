import 'dart:convert';

// Metodo que devuelve una lista de usuarios desde una lista de usuarios json.
List<UserModel> userModelListFromJsonMap(String str) {
  return List<UserModel>.from(
      json.decode(str).map((x) => UserModel.fromJsonMap(x)));
}

/*
* Clase modelo usuario para recuperar dtos de gsheet.
*/
class UserModel {
  String email;

  UserModel({required this.email});

  factory UserModel.fromJsonMap(Map<String, dynamic> json) {
    return UserModel(email: json["email"]);
  }
}
