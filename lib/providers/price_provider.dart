import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PriceProvider extends ChangeNotifier {
  double price = 0.0;
  List <double> inGamePrices = [];
  late Timer _timer;

  PriceProvider(){
    _updatePrice();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updatePrice();
      addPriceToChart(price);
    });
  }

  void addPriceToChart(double price) {
    inGamePrices.add(price);
    notifyListeners(); // Notify listeners to rebuild the widget when the data changes.
  }

  Future<double> _fetchPrice() async {
    final response = await http.get(
      Uri.parse('https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final double price = double.parse(data['price']);
      return price;
    } else {
      throw Exception('Failed to load Bitcoin price');
    }
  }

  Future<void> _updatePrice() async {
    _fetchPrice().then((currentPrice) {
      price = currentPrice;
      notifyListeners();
    });
  }
}