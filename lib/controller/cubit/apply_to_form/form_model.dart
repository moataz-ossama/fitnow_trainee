// @dart=2.9
import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  FormModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
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
    this.packageId,
    this.age,
    this.height,
    this.diseases,
    this.weight,
    this.trainingTime,
    this.goal,
    this.foodAllergy,
    this.useSupplements,
    this.other,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String packageId;
  String age;
  String height;
  String diseases;
  String weight;
  String trainingTime;
  String goal;
  String foodAllergy;
  String useSupplements;
  String other;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    packageId: json["package_id"],
    age: json["age"],
    height: json["height"],
    diseases: json["diseases"],
    weight: json["weight"],
    trainingTime: json["training_time"],
    goal: json["goal"],
    foodAllergy: json["food_allergy"],
    useSupplements: json["use_supplements"],
    other: json["other"],
    userId: json["user_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "age": age,
    "height": height,
    "diseases": diseases,
    "weight": weight,
    "training_time": trainingTime,
    "goal": goal,
    "food_allergy": foodAllergy,
    "use_supplements": useSupplements,
    "other": other,
    "user_id": userId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
