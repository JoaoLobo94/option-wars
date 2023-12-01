import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';
import 'package:option_battles/providers/price_provider.dart';
import 'components/game_top_bar.dart';
import 'package:provider/provider.dart';
import 'components/price_chart.dart';

class OptionGame extends StatefulWidget {
  const OptionGame({Key? key}) : super(key: key);

  @override
  _OptionGameState createState() => _OptionGameState();
}

class _OptionGameState extends State<OptionGame> {
  int countdown = 5;
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    playSound();
    startCountdown();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer.cancel();
      }
    });
  }

  void playSound() async {
    final player = AudioPlayer();
    await player.setAsset('lib/assets/1911.mp3');
    await player.play();
  }

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
            child: countdown > 0
                ? Center(
              child: Text(
                '$countdown',
                style: const TextStyle(fontSize: 100, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            )
                : Consumer<PriceProvider>(
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
