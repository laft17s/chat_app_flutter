// class User {
//   bool online;
//   String email;
//   String name;
//   String userId;

//   User({
//     required this.online,
//     required this.email,
//     required this.name,
//     required this.userId,
//   });
// }

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.userStatus,
    required this.userName,
    required this.userEmail,
    required this.userId,
  });

  bool userStatus;
  String userName;
  String userEmail;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userStatus: json["userStatus"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userStatus": userStatus,
        "userName": userName,
        "userEmail": userEmail,
        "userId": userId,
      };
}
