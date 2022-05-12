
import 'package:json_annotation/json_annotation.dart';

import 'package:json_serializable/json_serializable.dart';


import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  const Post({
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map< String, dynamic> toJson() => _$PostToJson(this);

  final String title;
  final String body;

  Post copyWith({String? id, String? phoneNumber}) {
    return Post(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'Post(title: $title, body: $body)';
  }
}





// @freezed
// class FApiData with _$FApiData {
//   factory FApiData({
//     String? title,
//     String? body,
//   }) = _FApiData;
//
//   factory FApiData.fromJson(Map<String, dynamic> json) => _$FApiDataFromJson(json);
// }