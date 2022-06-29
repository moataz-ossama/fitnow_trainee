// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  PaymentModel({
    this.status,
    this.redirect,
    this.message,
  });

  int status;
  String redirect;
  String message;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    status: json["status"],
    redirect: json["redirect"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "redirect": redirect,
    "message": message,
  };
}
