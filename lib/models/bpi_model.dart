import 'package:cryptoginie/models/currency_model.dart';

class Bpi {
  CurrencyModel? uSD;
  CurrencyModel? gBP;
  CurrencyModel? eUR;

  Bpi({this.uSD, this.gBP, this.eUR});

  factory Bpi.fromJson(Map<String, dynamic> json) {
    return Bpi(
        uSD: json['USD'] != null ? CurrencyModel.fromJson(json['USD']) : null,
        gBP: json['GBP'] != null ? CurrencyModel.fromJson(json['GBP']) : null,
        eUR: json['EUR'] != null ? CurrencyModel.fromJson(json['EUR']) : null);
  }
}
