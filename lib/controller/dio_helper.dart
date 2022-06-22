// @dart=2.9
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DioHelper {
 static String token = getToken().toString();
 static Future<String> getToken() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('access_token');
   print("get token =" +token);
 return token.toString();
 }
  static Dio dio= dio = Dio(BaseOptions(
    baseUrl: "https://api.fitsnow.xyz/api",
    receiveDataWhenStatusError: true,

  ));

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://api.fitsnow.xyz/api",
      receiveDataWhenStatusError: true,

    ));
  }

   static Future<Response> getdata(
      String url, Map<String, dynamic> query) async{
     String x="Bearer "+token;
     dio.options.headers={

       HttpHeaders.authorizationHeader: x};
   return await  dio.get(
      url,
      queryParameters: query,
    );
  }

   static Future<Response> postdata(
      String url, Map<String, dynamic> data ) async{

    print("hello this is my token"+token.toString());
   String x="Bearer "+token;
   dio.options.headers={

       HttpHeaders.authorizationHeader: x};
    return await  dio.post(
      url,

      data: data,
    );
  }
 static Future<Response> getdatatoken(
     @required String url) async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   token = await prefs.getString('access_token');
    String x="Bearer "+token;
   dio.options.headers={

     HttpHeaders.authorizationHeader: x};
   return await  dio.get(
     url,

   );
 }

 static Future<Response> postdatatoken(
     @required String url, @required Map<String, dynamic> data ) async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   token = await prefs.getString('access_token');
   print("hello this is my token"+token.toString());
   String x="Bearer "+token;
   dio.options.headers={

     HttpHeaders.authorizationHeader: x};
   return await  dio.post(
     url,

     data: data,
   );
 }
}
