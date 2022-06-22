import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
  String? iD;
  String? userName;
  String? avatar;


    UserModel({
    this.iD,
    this.userName,
    this.avatar,
});

  UserModel.fromJson(Map<String, dynamic>? json){
   iD = json!['_id'];
   userName = json['username'];
  avatar = json['avatar'];
  }

  Map<String, dynamic> toMap (){
    return {
      '_id': iD,
      'userName':userName,
      'avatar':avatar,
    };
  }
}