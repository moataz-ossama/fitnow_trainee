// To parse this JSON data, do
//
//     final viewProfileModel = viewProfileModelFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

ViewProfileModel viewProfileModelFromJson(String str) => ViewProfileModel.fromJson(json.decode(str));

String viewProfileModelToJson(ViewProfileModel data) => json.encode(data.toJson());

class ViewProfileModel {
  ViewProfileModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory ViewProfileModel.fromJson(Map<String, dynamic> json) => ViewProfileModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.user,
    this.traineeProfile,
    this.accessToken,
  });

  User user;
  TraineeProfile traineeProfile;
  String accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    traineeProfile: TraineeProfile.fromJson(json["trainee_profile"]),
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "trainee_profile": traineeProfile.toJson(),
    "access_token": accessToken,
  };
}

class TraineeProfile {
  TraineeProfile({
    this.id,
    this.userId,
    this.gender,
    this.status,
    this.mobile,
    this.photo,
    this.birthdate,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String gender;
  String status;
  dynamic mobile;
  dynamic photo;
  dynamic birthdate;
  dynamic country;
  DateTime createdAt;
  DateTime updatedAt;

  factory TraineeProfile.fromJson(Map<String, dynamic> json) => TraineeProfile(
    id: json["id"],
    userId: json["user_id"],
    gender: json["gender"],
    status: json["status"],
    mobile: json["mobile"],
    photo: json["photo"],
    birthdate: json["birthdate"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "gender": gender,
    "status": status,
    "mobile": mobile,
    "photo": photo,
    "birthdate": birthdate,
    "country": country,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  User({
    this.id,
    this.fullname,
    this.email,
    this.emailVerifiedAt,
    this.type,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String fullname;
  String email;
  dynamic emailVerifiedAt;
  String type;
  dynamic isAdmin;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullname: json["fullname"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    type: json["type"],
    isAdmin: json["is_admin"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "type": type,
    "is_admin": isAdmin,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
