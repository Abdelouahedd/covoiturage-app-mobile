import 'dart:convert';

import 'package:covoiturage_app/services/Util.dart';

class User {
  String _id;
  String username;
  String email;
  String city;
  DateTime birthDay;
  String profileImg;
  String _password;
  double rank;

  User(
      {String id,
      this.username,
      this.email,
      String password,
      this.city,
      this.birthDay,
      this.profileImg,
      this.rank = 0})
      : _id = id,
        _password = password;

  String get id => _id;

  void setId(String uuid) => _id = uuid;

  String get password => _password;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        city: json["city"],
        birthDay: Util.convertToDateTime(json["birthDay"]),
        profileImg: json["profileImg"] == null ? null : json["profileImg"],
        rank: json["rank"],
      );
  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username,
        "email": email,
        "password": password,
        "city": city,
        "birthDay": birthDay,
        "profileImg": profileImg == null ? null : profileImg,
        "rank": rank,
      };

  @override
  String toString() {
    return 'User : $username - $email ';
  }
}
