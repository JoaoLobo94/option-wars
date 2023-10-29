import 'package:flutter/material.dart';
import 'pages/login/login.dart';
import 'pages/games/game.dart';

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
              "/games":(context) => const Game(),
          }
    );
  }
}
