// @dart=2.9
class LoginModel {

UserData userData;
String status;
String message;
List error;

String token;
  LoginModel.fromjson(Map<String, dynamic> json) {
     status=json['status'];
     message=json['message'];
     error=json['errors'];

    userData=json['data']!=null ? UserData.fromjson(json['data']):null;


  }
}

class UserData {
  int id ;
  String fullname;
  String email;
  int type;
  String is_admin;
  String access_token;

  UserData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    type = json['type'];
    is_admin=json['is_admin'];
    access_token=json['access_token'];

}}
