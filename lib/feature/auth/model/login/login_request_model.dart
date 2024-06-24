class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }

  Map<String, String> toJson() {
    final Map<String, String> _data = <String, String>{};
    _data["email"] = email ?? '';
    _data["password"] = password ?? '';
    return _data;
  }
}
