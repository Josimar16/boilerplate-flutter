import 'dart:convert';

import 'package:frontend/app/search/domain/entities/result.dart';

class ResultModel extends Result {
  final String name;
  final String nickname;
  final String image;
  final String url;
  ResultModel({
    this.name,
    this.nickname,
    this.image,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'nickname': nickname,
      'url': url,
    };
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultModel(
      image: map['image'],
      name: map['name'],
      nickname: map['nickname'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultModel.fromJson(String source) =>
      ResultModel.fromMap(json.decode(source));
}
