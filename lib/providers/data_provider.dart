import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  String paymentRequest = '';
  String paymentHash = '';
  String paymentAmount = '';
  String selectedDirection = '';
  int id = 0;

  String get paymentInfo => paymentRequest;
  String get paymentHashInfo => paymentHash;
  String get betDirection=> selectedDirection;
  String get betAmount => paymentAmount;
  int get getId => id;

  setParameters(int newId, String newPaymentHash, String newPaymentRequest, String newSelectedDirection, String newPaymentAmount) {
    paymentRequest = newPaymentRequest;
    id = newId;
    paymentHash = newPaymentHash;
    selectedDirection = newSelectedDirection;
    paymentAmount = newPaymentAmount;
    notifyListeners();
  }
}
