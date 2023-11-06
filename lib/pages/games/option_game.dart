import 'package:flutter/material.dart';
import 'package:option_battles/providers/price_provider.dart';
import 'components/game_top_bar.dart';
import 'components/button_row.dart';
import 'package:provider/provider.dart';
import 'components/price_chart.dart';

class OptionGame extends StatelessWidget {
  const OptionGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<double> bitcoinPrices = [];


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
          const Text(
            "You are playing against the XXX",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(
            child: Consumer<PriceProvider>(
              builder: (context, priceProvider, child) {
                final inGamePrices = priceProvider.inGamePrices;

                // Replace 'PriceChart' with your chart widget and pass in inGamePrices
                return PriceChart(priceData: inGamePrices);
              },
            ),
          ),
          const ButtonRow(buttonLabels: ["10 sats", "100 sats", "1000 sats", "10000 sats"]),
          const ButtonRow(buttonLabels: ["go up", "go down"]),
          const ButtonRow(buttonLabels: ["Play"]),
        ],
      ),
    );
  }
}
