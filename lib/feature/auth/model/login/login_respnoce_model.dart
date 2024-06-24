class LoginResponseModel {
  String? message;

  LoginResponseModel({this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    return _data;
  }
}

class LoginResponseError {
  String? message;
  String? stack;

  LoginResponseError({this.message, this.stack});

  LoginResponseError.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["stack"] is String) {
      stack = json["stack"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["stack"] = stack;
    return _data;
  }
}
