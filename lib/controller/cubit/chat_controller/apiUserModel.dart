class ApiUserData {
  String? status;
  String? message;
  Data? data;

  ApiUserData({this.status, this.message, this.data});

  ApiUserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  TraineeProfile? traineeProfile;
  String? accessToken;

  Data({this.user, this.traineeProfile, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    traineeProfile = json['trainee_profile'] != null
        ? TraineeProfile.fromJson(json['trainee_profile'])
        : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.traineeProfile != null) {
      data['trainee_profile'] = this.traineeProfile!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? email;
  Null? emailVerifiedAt;
  String? type;
  Null? isAdmin;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.fullname,
        this.email,
        this.emailVerifiedAt,
        this.type,
        this.isAdmin,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['type'] = this.type;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TraineeProfile {
  int? id;
  int? userId;
  String? gender;
  String? status;
  String? mobile;
  String? photo;
  String? birthdate;
  String? country;
  String? createdAt;
  String? updatedAt;

  TraineeProfile(
      {this.id,
        this.userId,
        this.gender,
        this.status,
        this.mobile,
        this.photo,
        this.birthdate,
        this.country,
        this.createdAt,
        this.updatedAt});

  TraineeProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    gender = json['gender'];
    status = json['status'];
    mobile = json['mobile'];
    photo = json['photo'];
    birthdate = json['birthdate'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['gender'] = gender;
    data['status'] = status;
    data['mobile'] = mobile;
    data['photo'] = photo;
    data['birthdate'] = birthdate;
    data['country'] = country;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}