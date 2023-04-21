import 'dart:convert';

/// id : 1
/// name : "Akash"
/// eamil : "abc@gmail.com"

PostResponse postResponseFromJson(String str) =>
    PostResponse.fromJson(json.decode(str));

String postResponseToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse {
  PostResponse({
    num? id,
    String? name,
    String? eamil,
  }) {
    _id = id;
    _name = name;
    _eamil = eamil;
  }

  PostResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _eamil = json['eamil'];
  }

  num? _id;
  String? _name;
  String? _eamil;

  PostResponse copyWith({
    num? id,
    String? name,
    String? eamil,
  }) =>
      PostResponse(
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
    map['eamil'] = _eamil;
    return map;
  }
}
