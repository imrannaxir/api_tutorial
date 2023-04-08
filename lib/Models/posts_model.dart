// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class PostsModel {
//   PostsModel({
//     int? userId,
//     int? id,
//     String? title,
//     String? body,
//   }) {
//     _userId = userId;
//     _id = id;
//     _title = title;
//     _body = body;
//   }

//   PostsModel.fromJson(dynamic json) {
//     _userId = json['userId'];
//     _id = json['id'];
//     _title = json['title'];
//     _body = json['body'];
//   }
//   int? _userId;
//   int? _id;
//   String? _title;
//   String? _body;

//   int? get userId => _userId;
//   int? get id => _id;
//   String? get title => _title;
//   String? get body => _body;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['userId'] = _userId;
//     map['id'] = _id;
//     map['title'] = _title;
//     map['body'] = _body;
//     return map;
//   }
// }

class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}





// class PostsModel {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;
//   PostsModel({
//     this.userId,
//     this.id,
//     this.title,
//     this.body,
//   });

//   PostsModel copyWith({
//     int? userId,
//     int? id,
//     String? title,
//     String? body,
//   }) {
//     return PostsModel(
//       userId: userId ?? this.userId,
//       id: id ?? this.id,
//       title: title ?? this.title,
//       body: body ?? this.body,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'userId': userId,
//       'id': id,
//       'title': title,
//       'body': body,
//     };
//   }

//   factory PostsModel.fromMap(Map<String, dynamic> map) {
//     return PostsModel(
//       userId: map['userId'] != null ? map['userId'] as int : null,
//       id: map['id'] != null ? map['id'] as int : null,
//       title: map['title'] != null ? map['title'] as String : null,
//       body: map['body'] != null ? map['body'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory PostsModel.fromJson(String source) =>
//       PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'PostsModel(userId: $userId, id: $id, title: $title, body: $body)';
//   }

//   @override
//   bool operator ==(covariant PostsModel other) {
//     if (identical(this, other)) return true;

//     return other.userId == userId &&
//         other.id == id &&
//         other.title == title &&
//         other.body == body;
//   }

//   @override
//   int get hashCode {
//     return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
//   }
// }
