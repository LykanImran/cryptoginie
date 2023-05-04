import 'package:cryptoginie/models/bpi_model.dart';
import 'package:cryptoginie/models/time_model.dart';

class BitDataModel {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  BitDataModel({this.time, this.disclaimer, this.chartName, this.bpi});

  factory BitDataModel.fromJson(Map<String, dynamic> json) {
    return BitDataModel(
        time: json['time'] != null ? Time.fromJson(json['time']) : null,
        disclaimer: json['disclaimer'],
        chartName: json['chartName'],
        bpi: json['bpi'] != null ? Bpi.fromJson(json['bpi']) : null);
  }
}
