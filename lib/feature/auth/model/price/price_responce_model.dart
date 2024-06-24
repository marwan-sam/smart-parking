class PriceResponseModel {
  double? prediction;

  PriceResponseModel({
    this.prediction,
  });

  PriceResponseModel.fromJson(dynamic json) {
    prediction = json['prediction'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prediction'] = prediction;
    return map;
  }
}
