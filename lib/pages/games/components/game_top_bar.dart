import 'package:flutter/material.dart';
import 'package:option_battles/providers/price_provider.dart';
import 'package:provider/provider.dart';


class GameTopBar extends StatelessWidget {
  const GameTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text(
                context.watch<PriceProvider>().price.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Text(
                "Bitcoin Battle",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.white,
                onPressed: () {
                  // Need to check if the user already exists or not. Show lightning setup conditionally
                  Navigator.pushNamed(context, '/option_game');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}