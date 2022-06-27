// @dart=2.9
class PackagesModel {
  String status;
  Packagedata data;
  
  PackagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =  Packagedata.fromJson(json['data']) ;
  }
}
class Packagedata{
  List <Userdata> listdata=[];
  Packagedata.fromJson(Map<String, dynamic> json)
  {
json['data'].forEach((e) {
  listdata.add(Userdata.fromJson(e));
});
  }
}
class Userdata{
  String title;
  String description;
  int price;
  int weeks;
  String type;
  int id;
  Userdata.fromJson(Map<String, dynamic> json) {
    title=json['title'];
    description=json['description'];
    price=json['price'];
    weeks=json['weeks'];
    type=json['type'];
    id=json['id'];
  }
}

