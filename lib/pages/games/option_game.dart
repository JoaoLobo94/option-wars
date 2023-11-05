import 'package:flutter/material.dart';
import 'components/game_top_bar.dart';
import 'components/chart.dart';
import 'components/button_row.dart';

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
          const Expanded(
            child: ChartScreen(),
          ),
          const ButtonRow(buttonLabels: ["10 sats", "100 sats", "1000 sats", "10000 sats"]),
          const ButtonRow(buttonLabels: ["go up", "go down"]),
          const ButtonRow(buttonLabels: ["Play"]),
        ],
      ),
    );
  }
}
