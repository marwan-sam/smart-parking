class PriceRequestModel {
  String? hourIn;
  String? minuteIn;
  String? hourOut;
  String? minuteOut;
  String? day;
  String? month;

  PriceRequestModel({
    this.hourIn,
    this.minuteIn,
    this.hourOut,
    this.minuteOut,
    this.day,
    this.month,
  });

  PriceRequestModel.fromJson(dynamic json) {
    hourIn = json['Hour_in'];
    minuteIn = json['Minute_in'];
    hourOut = json['Hour_out'];
    minuteOut = json['Minute_out'];
    day = json['day'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Hour_in'] = hourIn;
    map['Minute_in'] = minuteIn;
    map['Hour_out'] = hourOut;
    map['Minute_out'] = minuteOut;
    map['day'] = day;
    map['month'] = month;
    return map;
  }
}
