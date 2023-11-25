import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/price_provider.dart';
import 'pages/login/login.dart';
import 'pages/login/sign_up.dart';
import 'pages/games/option_game.dart';
import 'pages/games/set_game.dart';

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
            "/sign_up":(context) => const SignUp(),
            "/set_game":(context) => const SetGame(),
          },
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
