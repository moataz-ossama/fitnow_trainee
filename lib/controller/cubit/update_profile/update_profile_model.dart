class UpdateProfileModel {
  UpdateProfileModel({
    required this.status,
    required this.message,
    required this.errors,
  });
  late final String status;
  late final String message;
  late final List<String> errors;

  UpdateProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    errors = List.castFrom<dynamic, String>(json['errors']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['errors'] = errors;
    return _data;
  }
}