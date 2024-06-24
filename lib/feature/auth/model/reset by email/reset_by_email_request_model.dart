class RequestCodeModel {
  String? email;

  RequestCodeModel({this.email});

  RequestCodeModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    return _data;
  }
}
