import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin class MoneyFormat {
  NumberFormat currencyFormat({int decimalDigits = 0, String symbol = '₦'}) =>
      NumberFormat.currency(symbol: symbol, decimalDigits: decimalDigits);

  NumberFormat get percentageFormat => NumberFormat('.00');

  DateFormat get transactionDateFormat => DateFormat('yyyy-MM-dd • hh:mm');
}

mixin class UiUtils {
  void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
