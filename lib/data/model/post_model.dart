import 'dart:convert';

/// name : "Akash"
/// email : "abc@gmail.com"

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    String? name,
    String? email,
  }) {
    _name = name;
    _email = email;
  }

  PostModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
  }

  String? _name;
  String? _email;

  PostModel copyWith({
    String? name,
    String? email,
  }) =>
      PostModel(
        name: name ?? _name,
        email: email ?? _email,
      );

  String? get name => _name;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    return map;
  }
}
