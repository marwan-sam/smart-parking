class RegisterResponseModel {
  String? message;
  String? stack;

  RegisterResponseModel({this.message, this.stack});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    stack = json["stack"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["stack"] = stack;
    return _data;
  }
}
