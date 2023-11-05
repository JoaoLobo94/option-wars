import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PriceChart extends StatelessWidget {
  final List<double> priceData;

  PriceChart({required this.priceData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        minX: 0,
        maxX: priceData.length.toDouble() - 1,
        minY: priceData.reduce((min, price) => min < price ? min : price) - 10,
        maxY: priceData.reduce((max, price) => max > price ? max : price) + 10,
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(priceData.length, (index) {
              return FlSpot(index.toDouble(), priceData[index]);
            }),
            isCurved: true,
            colors: [Colors.blue],
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
