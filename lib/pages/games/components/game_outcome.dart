import 'package:flutter/material.dart';

class GameOutcome extends StatelessWidget {
  const GameOutcome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/badger.png',
      width: 200,
      height: 200,
    );
  }
}

class PlayAgainNoResultWidget extends StatelessWidget {
  const PlayAgainNoResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No one won or lost.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement play again logic
          },
          child: Text('Play Again'),
        ),
      ],
    );
  }
}

class PlayAgainYouLostWidget extends StatelessWidget {
  const PlayAgainYouLostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You lost!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement play again logic
          },
          child: Text('Play Again'),
        ),
      ],
    );
  }
}

class PlayAgainCashOutWidget extends StatelessWidget {
  final int amount;

  const PlayAgainCashOutWidget({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You won $amount!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement play again logic
          },
          child: Text('Play Again'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Implement cash out logic
          },
          child: Text('Cash Out'),
        ),
      ],
    );
  }
}
