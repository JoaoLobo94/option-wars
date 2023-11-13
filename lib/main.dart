import 'package:flutter/material.dart';
import 'pages/login/lightening_setup.dart';
import 'package:provider/provider.dart';
import 'providers/price_provider.dart';
import 'pages/login/login.dart';
import 'pages/games/option_game.dart';
import 'pages/games/waiting_room.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (context) => PriceProvider()),
    ],
        child: MaterialApp(
          home: const Login(),
          routes:{
            "/option_game":(context) => const OptionGame(),
            "/lightening_setup":(context) => const LighteningSetup(),
            "/waiting_room":(context) => const WaitingRoom(),
          },
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
