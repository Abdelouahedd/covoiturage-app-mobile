import 'dart:convert';

import 'package:covoiturage_app/services/Util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'User.dart';

class Post {
  String _id;
  String from;
  String to;
  TimeOfDay time;
  DateTime date;
  String price;
  String description;
  String imgDesc;
  User user;
  Post(
      {String id,
      this.from,
      this.to,
      this.time,
      this.date,
      this.description,
      this.imgDesc,
      this.user,
      this.price})
      : _id = id;
  String get id => _id;

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        time: Util.convertToTime(json["time"]),
        date: Util.convertToDateTime(json["date"]),
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        imgDesc: json["imgDesc"] == null ? null : json["imgDesc"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "from": from == null ? null : from,
        "to": to == null ? null : to,
        "time": time == null ? null : time,
        "date": date == null ? null : Util.convertDateToString(date),
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "imgDesc": imgDesc == null ? null : imgDesc,
        "user": user == null ? null : user.toJson(),
      };
}
