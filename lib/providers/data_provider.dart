import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  String paymentHash = '';
  String paymentAmount = '';
  String selectedDirection = '';

  String get paymentInfo => paymentHash;  // Define paymentInfo as a method
  String get betDirection=> selectedDirection;
  String get betAmount => paymentAmount;

  setParameters(String newPaymentHash, String newSelectedDirection, String newPaymentAmount) {
    paymentHash = newPaymentHash;
    selectedDirection = newSelectedDirection;
    paymentAmount = newPaymentAmount;
    notifyListeners();
  }
}
