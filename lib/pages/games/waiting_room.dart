import 'package:flutter/material.dart';
import 'components/game_top_bar.dart';
import 'components/button_row.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: const GameTopBar(),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you think the price will go upbor down by \$10 first?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'lib/assets/img.png',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Choose your bet:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  ButtonRow(buttonLabels: ["10 sats", "100 sats", "1000 sats", "10000 sats"]),
                  SizedBox(height: 16),
                  Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 16),
                  ButtonRow(buttonLabels: ["Go up", "Go down"]),
                  SizedBox(height: 16),
                  Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 16),
                  ButtonRow(buttonLabels: ["Play"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

