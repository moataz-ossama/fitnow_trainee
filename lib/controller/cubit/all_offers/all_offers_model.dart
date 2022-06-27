// @dart=2.9

import 'dart:convert';

AllOffersModel allOffersModelFromJson(String str) => AllOffersModel.fromJson(json.decode(str));

String allOffersModelToJson(AllOffersModel data) => json.encode(data.toJson());

class AllOffersModel {
  AllOffersModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory AllOffersModel.fromJson(Map<String, dynamic> json) => AllOffersModel(
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
    this.data,
    this.pagination,
  });

  List<Datum> data;
  Pagination pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.price,
    this.notes,
    this.packageId,
    this.userId,
    this.traineeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.package,
    this.coach,
  });

  int id;
  int price;
  String notes;
  int packageId;
  int userId;
  int traineeId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Package package;
  Coach coach;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    price: json["price"],
    notes: json["notes"],
    packageId: json["package_id"],
    userId: json["user_id"],
    traineeId: json["trainee_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    package: Package.fromJson(json["package"]),
    coach: Coach.fromJson(json["coach"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "notes": notes,
    "package_id": packageId,
    "user_id": userId,
    "trainee_id": traineeId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "package": package.toJson(),
    "coach": coach.toJson(),
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
  });

  int id;
  String fullname;
  String email;
  dynamic emailVerifiedAt;
  String type;
  dynamic isAdmin;
  DateTime createdAt;
  DateTime updatedAt;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
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

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}
