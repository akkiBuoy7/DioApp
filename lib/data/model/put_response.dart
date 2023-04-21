import 'dart:convert';

/// id : 1
/// name : "Akash"
/// eamil : "abc@gmail.com"

PutResponse postResponseFromJson(String str) =>
    PutResponse.fromJson(json.decode(str));

String putResponseToJson(PutResponse data) => json.encode(data.toJson());

class PutResponse {
  PutResponse({
    num? id,
    String? name,
    String? eamil,
  }) {
    _id = id;
    _name = name;
    _eamil = eamil;
  }

  PutResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _eamil = json['email'];
  }

  num? _id;
  String? _name;
  String? _eamil;

  PutResponse copyWith({
    num? id,
    String? name,
    String? eamil,
  }) =>
      PutResponse(
        id: id ?? _id,
        name: name ?? _name,
        eamil: eamil ?? _eamil,
      );

  num? get id => _id;

  String? get name => _name;

  String? get eamil => _eamil;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _eamil;
    return map;
  }
}
