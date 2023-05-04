import 'package:intl/intl.dart';

String getIndianCurrency(var num) {
  String tempText = '';

  final indianRupeesFormat = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    decimalDigits: 2, // change it to get decimal places
    symbol: '₹',
  );

  var format = NumberFormat.currency(locale: 'HI');
  print(format.format(num)); //10,00,00,000.00
  tempText = indianRupeesFormat.format(num);
  return tempText;
}

String getShortDecimal(double num) {
  String converted = '';
  converted = num.toStringAsFixed(2);
  return converted;
}
