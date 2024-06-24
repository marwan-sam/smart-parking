class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;

  RegisterRequestModel(
      {this.name, this.email, this.password, this.confirmPassword, this.phone});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
    confirmPassword = json["confirmPassword"];
    phone = json["phone"];
  }

  Map<String, String> toJson() {
    final Map<String, String> _data = <String, String>{};
    _data["name"] = name ?? '';
    _data["email"] = email ?? '';
    _data["password"] = password ?? '';
    _data["confirmPassword"] = confirmPassword ?? '';
    _data["phone"] = phone ?? '';
    return _data;
  }
}
