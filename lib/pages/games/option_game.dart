import 'package:flutter/material.dart';
import 'components/game_top_bar.dart';

class OptionGame extends StatelessWidget {
  const OptionGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
                ),
              ),
              child: GameTopBar(),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("10 sats"),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("100 sats"),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("1000 sats"),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("10000 sats"),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("price going up"),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("price going down"),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Play"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

