class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;

  Time({this.updated, this.updatedISO, this.updateduk});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
        updated: json['updated'],
        updatedISO: json['updatedISO'],
        updateduk: json['updateduk']);
  }
}
