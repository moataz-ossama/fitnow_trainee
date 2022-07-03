// @dart=2.9
import 'dart:convert';

ExerciseModel exerciseModelFromJson(String str) => ExerciseModel.fromJson(json.decode(str));

String exerciseModelToJson(ExerciseModel data) => json.encode(data.toJson());

class ExerciseModel {
  ExerciseModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
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
    this.primaryFocus,
    this.trackingFiled,
    this.instructions,
    this.videoUrl,
    this.userId,
    this.public,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.trackingFileds,
    this.media,
  });

  int id;
  String title;
  String primaryFocus;
  String trackingFiled;
  String instructions;
  String videoUrl;
  int userId;
  String public;
  String published;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> images;
  List<TrackingFiled> trackingFileds;
  List<Media> media;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    primaryFocus: json["primary_focus"],
    trackingFiled: json["tracking_filed"],
    instructions: json["instructions"],
    videoUrl: json["video_url"],
    userId: json["user_id"],
    public: json["public"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    images: List<String>.from(json["images"].map((x) => x)),
    trackingFileds: List<TrackingFiled>.from(json["tracking_fileds"].map((x) => TrackingFiled.fromJson(x))),
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "primary_focus": primaryFocus,
    "tracking_filed": trackingFiled,
    "instructions": instructions,
    "video_url": videoUrl,
    "user_id": userId,
    "public": public,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x)),
    "tracking_fileds": List<dynamic>.from(trackingFileds.map((x) => x.toJson())),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String modelType;
  int modelId;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    modelType: json["model_type"],
    modelId: json["model_id"],
    collectionName: json["collection_name"],
    name: json["name"],
    fileName: json["file_name"],
    mimeType: json["mime_type"],
    disk: json["disk"],
    size: json["size"],
    manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
    customProperties: List<dynamic>.from(json["custom_properties"].map((x) => x)),
    responsiveImages: List<dynamic>.from(json["responsive_images"].map((x) => x)),
    orderColumn: json["order_column"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "model_id": modelId,
    "collection_name": collectionName,
    "name": name,
    "file_name": fileName,
    "mime_type": mimeType,
    "disk": disk,
    "size": size,
    "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
    "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
    "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class TrackingFiled {
  TrackingFiled({
    this.id,
    this.name,
    this.uint,
    this.exerciesId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String uint;
  int exerciesId;
  DateTime createdAt;
  DateTime updatedAt;

  factory TrackingFiled.fromJson(Map<String, dynamic> json) => TrackingFiled(
    id: json["id"],
    name: json["name"],
    uint: json["uint"],
    exerciesId: json["exercies_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "uint": uint,
    "exercies_id": exerciesId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
