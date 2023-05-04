class CurrencyModel {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  CurrencyModel(
      {this.code, this.symbol, this.rate, this.description, this.rateFloat});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'],
      symbol: json['symbol'],
      rate: json['rate'],
      description: json['description'],
      rateFloat: json['rate_float'],
    );
  }
}
