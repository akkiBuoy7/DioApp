import 'dart:convert';

/// name : "Akash"
/// email : "abc@gmail.com"

PutModel postModelFromJson(String str) => PutModel.fromJson(json.decode(str));

String putModelToJson(PutModel data) => json.encode(data.toJson());

class PutModel {
  PutModel({
    String? name,
    String? email,
  }) {
    _name = name;
    _email = email;
  }

  PutModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
  }

  String? _name;
  String? _email;

  PutModel copyWith({
    String? name,
    String? email,
  }) =>
      PutModel(
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
