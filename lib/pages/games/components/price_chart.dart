import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:option_battles/providers/data_provider.dart';
import 'package:option_battles/providers/jwt_provider.dart';
import 'package:option_battles/services/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';


class PriceChart extends StatefulWidget {
  final List<double> priceData;
  final double firstPrice;
  final double currentPrice;


  const PriceChart({super.key, required this.priceData, required this.firstPrice, required this.currentPrice});

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  late Timer gameTimer;
  int gameDuration = 5;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    gameTimer.cancel();
    super.dispose();
  }

  void startCountdown() {
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        gameDuration--;
      });
      if (gameDuration == 0) {
        settleBet(context, widget.firstPrice, widget.currentPrice);
        gameTimer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        minY: evaluateBoundDown(widget.firstPrice, widget.currentPrice),
        maxY: evaluateBoundUp(widget.firstPrice, widget.currentPrice),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(widget.priceData.length, (index) {
              return FlSpot(index.toDouble(), widget.priceData[index]);
            }),
            dotData: const FlDotData(
              show: false,
            ),
            isCurved: true,
            color: _getColor(widget.priceData.last, widget.firstPrice, false),
            belowBarData: BarAreaData(show: true, color: _getColor(widget.priceData.last, widget.firstPrice, true), ),
          ),
        ],
        borderData: FlBorderData(
          show: false,
          border: const Border(
            bottom: BorderSide(
              color: Colors.transparent,
            ),
            left: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: true,
          horizontalLines: [
            HorizontalLine(
              y: widget.firstPrice + 5,
              color: Colors.greenAccent,
              strokeWidth: 2,
              dashArray: [10, 2],
              label: HorizontalLineLabel(
                show: true,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 5, bottom: 5),
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
                labelResolver: (line) => '${getDirection(context) == 'up' ? 'You win from here' : 'You loose from here'}: ${line.y}',
              ),
            ),
            HorizontalLine(
              y: widget.firstPrice,
              color: Colors.blue,
              strokeWidth: 2,
              dashArray: [10, 2],
              label: HorizontalLineLabel(
                show: true,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 5, bottom: 5),
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
                labelResolver: (line) => 'Start Price: ${line.y}',
              ),
            ),
            HorizontalLine(
              y: widget.firstPrice - 5,
              color: Colors.red,
              strokeWidth: 2,
              dashArray: [10, 2],
              label: HorizontalLineLabel(
                show: true,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 5, bottom: 5),
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
                labelResolver: (line) => '${getDirection(context) == 'down' ? 'You win from here' : 'You loose from here'}: ${line.y}',
              ),
            ),
          ],
        ),
        gridData: FlGridData(show: false,
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: 2.5,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Colors.grey,
              strokeWidth: 1,
              dashArray: [5, 2],
            );
          },
        ),
        titlesData: FlTitlesData(show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                reservedSize: 46,
                getTitlesWidget: leftTitleWidgets,
              ),
            )
        ),
      ),
    );
  }

  Color _getColor(double priceData, double firstPrice, bool hasOpacity) {
    if (priceData > firstPrice) {
      return hasOpacity ? Colors.green.withOpacity(0.2) : Colors.greenAccent;
    } else if (priceData < firstPrice) {
      return hasOpacity ? Colors.red.withOpacity(0.2) : Colors.redAccent;
    } else {
      return hasOpacity ? Colors.blue.withOpacity(0.2) : Colors.blueAccent;
    }
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: _getColor(value,widget.firstPrice, false),
      fontSize: 10,
    );

    String text = '$value';

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }
}

String getDirection(BuildContext context) {
  return Provider.of<DataProvider>(context, listen: false).getSelectedDirection;
}

double evaluateBoundUp(double firstPrice, double currentPrice) {
  if (currentPrice > firstPrice + 25) {
    return firstPrice + 100;
  } else {
    return firstPrice + 25;
  }
}

double evaluateBoundDown(double firstPrice, double currentPrice) {
  if (currentPrice < firstPrice - 25) {
    return firstPrice - 100;
  }  else {
    return firstPrice - 25;
  }
}

int getBetId(BuildContext context) {
  final dataProvider = Provider.of<DataProvider>(context, listen: false);
  return dataProvider.getBetId;
}

Future<void> settleBet(BuildContext context, double startPrice, double currentPrice) async {
  if (currentPrice >= startPrice - 5 && currentPrice <= startPrice + 5) {
    Provider.of<DataProvider>(context, listen: false).setFreeReplay(true);
  }

  String? baseUrl = dotenv.env['BASE_URL'];
  JwtProvider jwtProvider = Provider.of<JwtProvider>(context, listen: false);
  String jwt = jwtProvider.jwt!;

  if (baseUrl != null) {
    ApiService apiService = ApiService(baseUrl);
    try {
      ApiResult result = await apiService.settleBet(
        path: 'bets/${getBetId(context)}',
        token: jwt,
      );
      if (result.success) {
        Provider.of<DataProvider>(context, listen: false).setFreeReplay(false);
        Provider.of<DataProvider>(context, listen: false).setWinner(result.data['winner']);
      }
    } catch (e) {
      print(e);
    }
  }
}



