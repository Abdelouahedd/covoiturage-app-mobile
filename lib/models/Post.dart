import 'dart:convert';

import 'package:covoiturage_app/services/Util.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  void setId(String uuid) => _id = uuid;

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        time: Util.convertToTime(json["time"]),
        date: (json["date"] as Timestamp).toDate(),
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        imgDesc: json["imgDesc"] == null ? null : json["imgDesc"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "time": Util.convertTimeToString(time),
        "date": date,
        "price": price,
        "description": description,
        "imgDesc": imgDesc??' ' ,
        "user": user.toJson(),
      };

  @override
  String toString() {
    return """
   Post { \n
      $id
      $from --> $to\n
      $date --> at $time\n
      $description\n
      image  : $imgDesc
      --------- user ------\n   }
   \n
     """;
  }
}
