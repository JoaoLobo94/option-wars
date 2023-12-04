import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier {
  String _paymentRequest = '';
  String _paymentHash = '';
  String _paymentAmount = '';
  String _selectedDirection = '';
  int _invoiceId = 0;
  String _username = '';
  String _lnurl = '';
  int _betId = 0;
  double _startPrice = 0.0;
  double _userBalance = 0.0;

  DataProvider() {
    loadPersistedData();
  }

  String get getUsername => _username;
  String get getPaymentRequest => _paymentRequest;
  String get getPaymentHash => _paymentHash;
  String get getPaymentAmount => _paymentAmount;
  String get getSelectedDirection => _selectedDirection;
  String get getLnurl => _lnurl;
  int get getInvoiceId => _invoiceId;
  int get getBetId => _betId;
  double get getStartPrice => _startPrice;
  double get getUserBalance => _userBalance;

  Future<void> loadPersistedData() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username') ?? '';
    _lnurl = prefs.getString('lnurl') ?? '';
    _userBalance = prefs.getDouble('userBalance') ?? 0.0;
    notifyListeners();
  }

  Future<void> setPaymentRequest(String newPaymentRequest) async {
    _paymentRequest = newPaymentRequest;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('paymentRequest', _paymentRequest);
    notifyListeners();
  }

  Future<void> setPaymentHash(String newPaymentHash) async {
    _paymentHash = newPaymentHash;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('paymentHash', _paymentHash);
    notifyListeners();
  }

  Future<void> setPaymentAmount(String newPaymentAmount) async {
    _paymentAmount = newPaymentAmount;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('paymentAmount', _paymentAmount);
    notifyListeners();
  }

  Future<void> setSelectedDirection(String newSelectedDirection) async {
    _selectedDirection = newSelectedDirection;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedDirection', _selectedDirection);
    notifyListeners();
  }

  Future<void> setInvoiceId(int newInvoiceId) async {
    _invoiceId = newInvoiceId;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('invoiceId', _invoiceId);
    notifyListeners();
  }

  Future<void> setUsername(String newUsername) async {
    _username = newUsername;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _username);
    notifyListeners();
  }

  Future<void> setLnurl(String newLnurl) async {
    _lnurl = newLnurl;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lnurl', _lnurl);
    notifyListeners();
  }

  Future<void> setBetId(int newBetId) async {
    _betId = newBetId;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('betId', _betId);
    notifyListeners();
  }

  Future<void> setStartPrice(double newStartPrice) async {
    _startPrice = newStartPrice;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('startPrice', _startPrice);
    notifyListeners();
  }

  Future<void> setUserBalance(double newUserBalance) async {
    _userBalance = newUserBalance;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('userBalance', _userBalance);
    notifyListeners();
  }
}
