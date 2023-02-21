// // To parse this JSON data, do
// //
// //     final postEntity = postEntityFromJson(jsonString);

// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'dart:convert';

// PostEntity postEntityFromJson(String str) => PostEntity.fromJson(json.decode(str));

import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? id;
  final String title;
  final String body;

  const PostEntity({ this.id, required this.title, required this.body});

  @override
  List<Object?> get props => [id, title, body];
}








// String postEntityToJson(PostEntity data) => json.encode(data.toJson());

// class PostEntity {
//     PostEntity({
//         required this.userId,
//         required this.id,
//         required this.title,
//         required this.body,
//     });

//     final int userId;
//     final int id;
//     final String title;
//     final String body;

//     factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//     );

//     Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//     };
// }
