import 'package:flutter/material.dart';
import 'package:option_battles/providers/price_provider.dart';
import 'components/game_top_bar.dart';
import 'package:provider/provider.dart';
import 'components/price_chart.dart';

class OptionGame extends StatelessWidget {
  const OptionGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          Expanded(
            child: Consumer<PriceProvider>(
              builder: (context, priceProvider, child) {
                final inGamePrices = priceProvider.inGamePrices;
                final firstPrice = priceProvider.firstPrice;
                final price = priceProvider.price;
                if (inGamePrices.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return PriceChart(priceData: inGamePrices, firstPrice: firstPrice, currentPrice: price);
              },
            ),
          ),
        ],
      ),
    );
  }
}
