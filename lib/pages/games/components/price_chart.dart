import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:option_battles/providers/data_provider.dart';

class PriceChart extends StatelessWidget {
  final List<double> priceData;
  final List<double> firstPrice;
  final double currentPrice;

  const PriceChart({super.key, required this.priceData, required this.firstPrice, required this.currentPrice});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        minY: evaluateBoundDown(firstPrice, currentPrice),
        maxY: evaluateBoundUp(firstPrice, currentPrice),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(priceData.length, (index) {
              return FlSpot(index.toDouble(), priceData[index]);
            }),
            dotData: const FlDotData(
              show: false,
            ),
            isCurved: true,
            color: _getColor(priceData.last, firstPrice.first, false),
            belowBarData: BarAreaData(show: true, color: _getColor(priceData.last, firstPrice.first, true), ),
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
              y: firstPrice[0] + 5,
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
              y: firstPrice[0],
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
              y: firstPrice[0] - 5,
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
      color: _getColor(value,firstPrice[0], false),
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
  return Provider.of<DataProvider>(context, listen: false).betDirection;
}

double evaluateBoundUp(List<double> firstPrice, double currentPrice) {
  if (currentPrice > firstPrice.first + 25) {
    return firstPrice.first + 50;
  } else {
    return firstPrice.first + 25;
  }
}

double evaluateBoundDown(List<double> firstPrice, double currentPrice) {
  if (currentPrice < firstPrice.first - 25) {
    return firstPrice.first - 50;
  }  else {
    return firstPrice.first - 25;
  }
}


