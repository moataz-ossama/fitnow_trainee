// @dart=2.9
// To parse this JSON data, do
//
//     final programsModel = programsModelFromJson(jsonString);

import 'dart:convert';

ProgramsModel programsModelFromJson(String str) => ProgramsModel.fromJson(json.decode(str));

String programsModelToJson(ProgramsModel data) => json.encode(data.toJson());

class ProgramsModel {
  ProgramsModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory ProgramsModel.fromJson(Map<String, dynamic> json) => ProgramsModel(
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
    this.programId,
    this.userId,
    this.traineeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.program,
    this.trainee,
  });

  int id;
  int programId;
  int userId;
  int traineeId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Program program;
  Trainee trainee;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    programId: json["program_id"],
    userId: json["user_id"],
    traineeId: json["trainee_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    program: Program.fromJson(json["program"]),
    trainee: Trainee.fromJson(json["trainee"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "program_id": programId,
    "user_id": userId,
    "trainee_id": traineeId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "program": program.toJson(),
    "trainee": trainee.toJson(),
  };
}

class Day {
  Day({
    this.id,
    this.dayNum,
    this.programId,
    this.workoutId,
    this.createdAt,
    this.updatedAt,
    this.workout,
  });

  int id;
  int dayNum;
  int programId;
  int workoutId;
  DateTime createdAt;
  DateTime updatedAt;
  Program workout;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    id: json["id"],
    dayNum: json["day_num"],
    programId: json["program_id"],
    workoutId: json["workout_id"] == null ? null : json["workout_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    workout: json["workout"] == null ? null : Program.fromJson(json["workout"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day_num": dayNum,
    "program_id": programId,
    "workout_id": workoutId == null ? null : workoutId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "workout": workout == null ? null : workout.toJson(),
  };
}

class Program {
  Program({
    this.id,
    this.title,
    this.description,
    this.weeks,
    this.userId,
    this.public,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.days,
    this.sections,
    this.workoutExercieses,
  });

  int id;
  String title;
  String description;
  int weeks;
  int userId;
  String public;
  String published;
  DateTime createdAt;
  DateTime updatedAt;
  List<Day> days;
  List<Section> sections;
  List<WorkoutExerciese> workoutExercieses;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    weeks: json["weeks"] == null ? null : json["weeks"],
    userId: json["user_id"],
    public: json["public"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    days: json["days"] == null ? null : List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
    sections: json["sections"] == null ? null : List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    workoutExercieses: json["workout_exercieses"] == null ? null : List<WorkoutExerciese>.from(json["workout_exercieses"].map((x) => WorkoutExerciese.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "weeks": weeks == null ? null : weeks,
    "user_id": userId,
    "public": public,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "days": days == null ? null : List<dynamic>.from(days.map((x) => x.toJson())),
    "sections": sections == null ? null : List<dynamic>.from(sections.map((x) => x.toJson())),
    "workout_exercieses": workoutExercieses == null ? null : List<dynamic>.from(workoutExercieses.map((x) => x.toJson())),
  };
}

class Section {
  Section({
    this.id,
    this.title,
    this.instruction,
    this.type,
    this.order,
    this.saveLibrary,
    this.workoutId,
    this.public,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.exercises,
  });

  int id;
  String title;
  dynamic instruction;
  String type;
  int order;
  int saveLibrary;
  int workoutId;
  String public;
  String published;
  DateTime createdAt;
  DateTime updatedAt;
  List<WorkoutExerciese> exercises;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    title: json["title"],
    instruction: json["instruction"],
    type: json["type"],
    order: json["order"],
    saveLibrary: json["save_library"],
    workoutId: json["workout_id"],
    public: json["public"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    exercises: List<WorkoutExerciese>.from(json["exercises"].map((x) => WorkoutExerciese.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "instruction": instruction,
    "type": type,
    "order": order,
    "save_library": saveLibrary,
    "workout_id": workoutId,
    "public": public,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
  };
}

class WorkoutExerciese {
  WorkoutExerciese({
    this.id,
    this.exerciseId,
    this.workoutId,
    this.workoutSectionId,
    this.order,
    this.notes,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.details,
    this.sets,
  });

  int id;
  int exerciseId;
  int workoutId;
  int workoutSectionId;
  int order;
  dynamic notes;
  String published;
  DateTime createdAt;
  DateTime updatedAt;
  Details details;
  List<Set> sets;

  factory WorkoutExerciese.fromJson(Map<String, dynamic> json) => WorkoutExerciese(
    id: json["id"],
    exerciseId: json["exercise_id"],
    workoutId: json["workout_id"],
    workoutSectionId: json["workout_section_id"] == null ? null : json["workout_section_id"],
    order: json["order"],
    notes: json["notes"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    details: Details.fromJson(json["details"]),
    sets: List<Set>.from(json["sets"].map((x) => Set.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exercise_id": exerciseId,
    "workout_id": workoutId,
    "workout_section_id": workoutSectionId == null ? null : workoutSectionId,
    "order": order,
    "notes": notes,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "details": details.toJson(),
    "sets": List<dynamic>.from(sets.map((x) => x.toJson())),
  };
}

class Details {
  Details({
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
  });

  int id;
  String title;
  String primaryFocus;
  String trackingFiled;
  String instructions;
  dynamic videoUrl;
  int userId;
  String public;
  String published;
  DateTime createdAt;
  DateTime updatedAt;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
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
  };
}

class Set {
  Set({
    this.id,
    this.workoutExerciesExerciseId,
    this.notes,
    this.time,
    this.rest,
    this.tempo,
    this.speed,
    this.reps,
    this.weight,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int workoutExerciesExerciseId;
  dynamic notes;
  int time;
  dynamic rest;
  int tempo;
  int speed;
  dynamic reps;
  int weight;
  DateTime createdAt;
  DateTime updatedAt;

  factory Set.fromJson(Map<String, dynamic> json) => Set(
    id: json["id"],
    workoutExerciesExerciseId: json["workout_exercies_exercise_id"],
    notes: json["notes"],
    time: json["time"],
    rest: json["rest"],
    tempo: json["tempo"] == null ? null : json["tempo"],
    speed: json["speed"],
    reps: json["reps"],
    weight: json["weight"] == null ? null : json["weight"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "workout_exercies_exercise_id": workoutExerciesExerciseId,
    "notes": notes,
    "time": time,
    "rest": rest,
    "tempo": tempo == null ? null : tempo,
    "speed": speed,
    "reps": reps,
    "weight": weight == null ? null : weight,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Trainee {
  Trainee({
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
    this.user,
  });

  int id;
  int userId;
  String gender;
  String status;
  dynamic mobile;
  String photo;
  dynamic birthdate;
  String country;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Trainee.fromJson(Map<String, dynamic> json) => Trainee(
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
    user: User.fromJson(json["user"]),
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
    "user": user.toJson(),
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

