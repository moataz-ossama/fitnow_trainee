// To parse this JSON data, do
//
//     final proposalsModel = proposalsModelFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

ProposalsModel proposalsModelFromJson(String str) => ProposalsModel.fromJson(json.decode(str));

String proposalsModelToJson(ProposalsModel data) => json.encode(data.toJson());

class ProposalsModel {
  ProposalsModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory ProposalsModel.fromJson(Map<String, dynamic> json) => ProposalsModel(
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
    this.id,
    this.title,
    this.description,
    this.price,
    this.userId,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.skills,
    this.proposles,
  });

  int id;
  String title;
  String description;
  int price;
  int userId;
  String published;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> skills;
  List<Proposle> proposles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    userId: json["user_id"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    skills: List<dynamic>.from(json["skills"].map((x) => x)),
    proposles: List<Proposle>.from(json["proposles"].map((x) => Proposle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "user_id": userId,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "proposles": List<dynamic>.from(proposles.map((x) => x.toJson())),
  };
}

class Proposle {
  Proposle({
    this.id,
    this.coverletter,
    this.jobId,
    this.userId,
    this.packageId,
    this.createdAt,
    this.updatedAt,
    this.coach,
    this.package,
  });

  int id;
  String coverletter;
  int jobId;
  int userId;
  int packageId;
  DateTime createdAt;
  DateTime updatedAt;
  Coach coach;
  Package package;

  factory Proposle.fromJson(Map<String, dynamic> json) => Proposle(
    id: json["id"],
    coverletter: json["coverletter"],
    jobId: json["job_id"],
    userId: json["user_id"],
    packageId: json["package_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    coach: Coach.fromJson(json["coach"]),
    package: Package.fromJson(json["package"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "coverletter": coverletter,
    "job_id": jobId,
    "user_id": userId,
    "package_id": packageId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "coach": coach.toJson(),
    "package": package.toJson(),
  };
}

class Coach {
  Coach({
    this.id,
    this.fullname,
    this.email,
    this.emailVerifiedAt,
    this.type,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
    this.coachProfile,
  });

  int id;
  String fullname;
  String email;
  DateTime emailVerifiedAt;
  String type;
  dynamic isAdmin;
  DateTime createdAt;
  DateTime updatedAt;
  CoachProfile coachProfile;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    id: json["id"],
    fullname: json["fullname"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    type: json["type"],
    isAdmin: json["is_admin"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    coachProfile: CoachProfile.fromJson(json["coach_profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "type": type,
    "is_admin": isAdmin,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "coach_profile": coachProfile.toJson(),
  };
}

class CoachProfile {
  CoachProfile({
    this.id,
    this.title,
    this.bio,
    this.videointro,
    this.photo,
    this.birthdate,
    this.userId,
    this.gender,
    this.status,
    this.mobile,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String bio;
  dynamic videointro;
  String photo;
  DateTime birthdate;
  int userId;
  String gender;
  String status;
  String mobile;
  String country;
  DateTime createdAt;
  DateTime updatedAt;

  factory CoachProfile.fromJson(Map<String, dynamic> json) => CoachProfile(
    id: json["id"],
    title: json["title"],
    bio: json["bio"],
    videointro: json["videointro"],
    photo: json["photo"],
    birthdate: DateTime.parse(json["birthdate"]),
    userId: json["user_id"],
    gender: json["gender"],
    status: json["status"],
    mobile: json["mobile"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "bio": bio,
    "videointro": videointro,
    "photo": photo,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "user_id": userId,
    "gender": gender,
    "status": status,
    "mobile": mobile,
    "country": country,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Package {
  Package({
    this.id,
    this.title,
    this.description,
    this.images,
    this.price,
    this.weeks,
    this.type,
    this.paymentType,
    this.userId,
    this.published,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String description;
  dynamic images;
  int price;
  int weeks;
  dynamic type;
  String paymentType;
  int userId;
  String published;
  DateTime createdAt;
  DateTime updatedAt;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    images: json["images"],
    price: json["price"],
    weeks: json["weeks"],
    type: json["type"],
    paymentType: json["payment_type"],
    userId: json["user_id"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "images": images,
    "price": price,
    "weeks": weeks,
    "type": type,
    "payment_type": paymentType,
    "user_id": userId,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
