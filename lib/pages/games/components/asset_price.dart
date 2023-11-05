import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AssetPrice extends StatefulWidget {
  const AssetPrice({Key? key}) : super(key: key);

  @override
  State<AssetPrice> createState() => _PriceState();
}

class _PriceState extends State<AssetPrice> {
  double bitcoinPrice = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _fetchAndUpdatePrice();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _fetchAndUpdatePrice();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _fetchAndUpdatePrice() {
    fetchBitcoinPrice().then((price) {
      setState(() {
        bitcoinPrice = price;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${bitcoinPrice.toStringAsFixed(2)}",
      style: TextStyle(color: Colors.white, fontSize: 20));
  }
}

Future<double> fetchBitcoinPrice() async {
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