class CodeCheckRequest {
  String? code;
  String? email;

  CodeCheckRequest({
    this.code,
    this.email,
  });

  CodeCheckRequest.fromJson(dynamic json) {
    code = json['code'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['email'] = email;
    return map;
  }
}
