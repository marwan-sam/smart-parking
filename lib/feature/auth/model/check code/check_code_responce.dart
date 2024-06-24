class CodeCheckResponse {
  String? error;

  CodeCheckResponse({
    this.error,
  });

  CodeCheckResponse.fromJson(dynamic json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    return map;
  }
}
