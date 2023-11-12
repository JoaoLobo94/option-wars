import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'dart:async';

class PriceProvider extends ChangeNotifier {
  double price = 0.0;
  List<double> inGamePrices = [];
  List <double> firstPrice = [];
  final StreamController<double> _priceStreamController = StreamController<double>();

  PriceProvider() {
    final wsUrl = Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade');
    var channel = WebSocketChannel.connect(wsUrl);
    channel.stream.listen((message) {
      if (message == null) return;
      final Map<String, dynamic> data = json.decode(message);
      price = double.parse(data['p']);
      if (firstPrice.isEmpty) {
        firstPrice.add(price);
        notifyListeners();
      }
      addPriceToChart(price);
      _priceStreamController.add(price);
    });
  }

  Stream<double> get priceStream => _priceStreamController.stream;

  void addPriceToChart(double price) {
    if (price == 0.0) return;
    if (inGamePrices.length > 10) {
      inGamePrices.removeAt(0);
    }
      inGamePrices.add(price);
      notifyListeners();
  }
}