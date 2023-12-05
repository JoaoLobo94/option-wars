import 'package:flutter/material.dart';

class GameOutcome extends StatelessWidget {
  final bool win;
  final bool freeReplay;

  const GameOutcome({super.key, required this.win, required this.freeReplay});

  @override
  Widget build(BuildContext context) {
    if (freeReplay) {
      return const FreeReplay();
    } else {
      return PlayAgain(win: win);
    }
  }
}

class FreeReplay extends StatelessWidget {
  
  const FreeReplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Not allot of price movement, you get a free replay!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement play again logic
          },
          child: const Text('Play Again'),
        ),
      ],
    );
  }
}

class PlayAgain extends StatelessWidget {
  final bool win;

  const PlayAgain({super.key, required this.win});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          win ? 'You won!, you doubled your bet!' : 'You lost!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {

          },
          child: const Text('Play Again'),
        ),
      ],
    );
  }
}
