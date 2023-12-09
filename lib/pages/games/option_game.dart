import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../providers/data_provider.dart';
import '../../providers/jwt_provider.dart';
import '../../services/api.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
import 'package:option_battles/providers/price_provider.dart';
import 'components/game_top_bar.dart';
import 'components/price_chart.dart';
import 'components/game_outcome.dart';

class OptionGame extends StatefulWidget {
  const OptionGame({Key? key}) : super(key: key);

  @override
  _OptionGameState createState() => _OptionGameState();
}

class _OptionGameState extends State<OptionGame> {
  int countdown = 5;
  int gameDuration = 5;
  late Timer countdownTimer;
  late Timer gameTimer;
  bool betCreated = false;

  @override
  void initState() {
    super.initState();
    playSound();
    startCountdown();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    gameTimer.cancel();
    super.dispose();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        countdownTimer.cancel();
        gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            gameDuration--;
          });
          if (gameDuration == 0) {
            gameTimer.cancel();
          }
        });
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
          Center(
            child: Text(
              '$gameDuration',
              style: const TextStyle(fontSize: 100, color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: countdown > 0
                ? Center(
              child: Text(
                '$countdown',
                style: const TextStyle(fontSize: 100, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            )
                : Builder(
              builder: (context) {
                final priceProvider = Provider.of<PriceProvider>(context);
                final inGamePrices = priceProvider.inGamePrices;
                final firstPrice = priceProvider.firstPrice;
                final price = priceProvider.price;

                if (inGamePrices.isEmpty && countdown == 0) {
                  return const Center(child: CircularProgressIndicator());
                }
                else {
                  if (!betCreated && firstPrice != 0.0) {
                    createBet(context, firstPrice);
                    betCreated = true;
                  }
                  if (gameDuration == 0) {
                    if (getFreeReplay(context)) {
                      return const FreeReplay();
                    } else {
                      return PlayAgain(win: getWinner(context));
                    }
                  }
                  return PriceChart(priceData: inGamePrices, firstPrice: firstPrice, currentPrice: price);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

bool getFreeReplay(BuildContext context) {
  return Provider.of<DataProvider>(context, listen: false).getFreeReplay;
}

bool getWinner(BuildContext context) {
  return Provider.of<DataProvider>(context, listen: false).getWinner;
}

String getPaymentAmount(BuildContext context) {
  final dataProvider = Provider.of<DataProvider>(context, listen: false);
  return dataProvider.getPaymentAmount;
}

String getDirection(BuildContext context) {
  return Provider.of<DataProvider>(context, listen: false).getSelectedDirection;
}

String getUserName(BuildContext context) {
  final dataProvider = Provider.of<DataProvider>(context, listen: false);
  return dataProvider.getUsername;
}

Future<bool> createBet(BuildContext context, double startPrice) async {
  String? baseUrl = dotenv.env['BASE_URL'];
  JwtProvider jwtProvider = Provider.of<JwtProvider>(context, listen: false);
  String jwt = jwtProvider.jwt!;

  if (baseUrl != null) {
    ApiService apiService = ApiService(baseUrl);
    try {
      ApiResult result = await apiService.createBet(
        direction: getDirection(context),
        amount: getPaymentAmount(context),
        username: getUserName(context),
        startPrice: startPrice,
        path: 'bets',
        token: jwt,
      );
      if (result.success) {
        final dataProvider = Provider.of<DataProvider>(context, listen: false);
        dataProvider.setBetId(result.data['id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  } else {
    return Future.value(false);
  }
}