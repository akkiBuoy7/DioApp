// To parse this JSON data, do
//
//     final patchModel = patchModelFromJson(jsonString);

import 'dart:convert';

PatchModel patchModelFromJson(String str) => PatchModel.fromJson(json.decode(str));

String patchModelToJson(PatchModel data) => json.encode(data.toJson());

class PatchModel {
  PatchModel({
     this.userId,
     this.title,
     this.body,
     this.id,
  });

  int? userId;
  String? title;
  String? body;
  int? id;

  factory PatchModel.fromJson(Map<String, dynamic> json) => PatchModel(
    userId: json["userId"],
    title: json["title"],
    body: json["body"],
    id: json["id"],
  );

  int? _userId;
  String? _title;
  String? _body;
  int? _id;

  PatchModel copyWith({
    int? userId,
    String? title,
    String? body,
    int? id
  }) =>
      PatchModel(
        userId: userId??_userId,
        title: title ?? _title,
        body: body ?? _body,
        id: id ?? _id
      );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "title": title,
    "body": body,
    "id": id,
  };
}
