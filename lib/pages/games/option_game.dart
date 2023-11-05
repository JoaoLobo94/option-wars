import 'package:flutter/material.dart';
import 'components/game_top_bar.dart';
import 'components/price_chart.dart'; // Import the PriceChart widget
import 'components/button_row.dart';
import 'components/asset_price.dart';

class OptionGame extends StatelessWidget {
  const OptionGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<double> bitcoinPrices = [1,3];

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
              ),
            ),
            child: const GameTopBar(),
          ),
          Text(
            "You are playing against the XXX",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),

          // Expanded(
          //   child: Text(AssetPrice().bitcoinPrice.toString()),
          // ),
          const ButtonRow(buttonLabels: ["10 sats", "100 sats", "1000 sats", "10000 sats"]),
          const ButtonRow(buttonLabels: ["go up", "go down"]),
          const ButtonRow(buttonLabels: ["Play"]),
        ],
      ),
    );
  }
}
