class ForgetPasswordResponseModel {
  String? message;
  String? stack;

  ForgetPasswordResponseModel({this.message, this.stack});

  ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
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
