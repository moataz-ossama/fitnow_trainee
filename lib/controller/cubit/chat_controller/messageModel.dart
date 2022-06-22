import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel
{
  String? content;
  int? senderId;
  Map<String,dynamic>? seen;
  FieldValue? timestamp;


  MessageModel({
    this.senderId,
    this.content,
    this.seen,
    this.timestamp

  });

  MessageModel.fromJson(Map<String, dynamic> json){
    senderId      = json['sender_id'];
    content   = json['content'];
    seen  = json['seen'];
  }

  Map<String, dynamic> toMap (){
    return {
      'sender_id'    :senderId,
      'content' :content,
      'seen':seen,
      'timestamp'    :timestamp
    };
  }
}