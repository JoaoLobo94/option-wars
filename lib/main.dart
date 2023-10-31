import 'package:flutter/material.dart';
import 'pages/login/login.dart';
import 'pages/games/option_game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
          routes:{
              "/option_game":(context) => const OptionGame(),
          }
    );
  }
}
