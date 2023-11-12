import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PriceChart extends StatelessWidget {
  final List<double> priceData;
  final List<double> firstPrice;

  const PriceChart({super.key, required this.priceData, required this.firstPrice});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        minY: priceData.reduce((min, price) => min < price ? min : price) - 2,
        maxY: priceData.reduce((max, price) => max > price ? max : price) + 2,
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(priceData.length, (index) {
              return FlSpot(index.toDouble(), priceData[index]);
            }),
            isCurved: true,
            color: Colors.greenAccent,
            belowBarData: BarAreaData(show: true, color: Colors.greenAccent.withOpacity(0.5)),
          ),
        ],
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: firstPrice[0],
              color: Colors.red,
              strokeWidth: 2,
              dashArray: [5, 2],
            ),
          ],
        ),
      ),
    );
  }
}
