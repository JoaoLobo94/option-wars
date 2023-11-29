import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/jwt_provider.dart';
import 'providers/data_provider.dart';
import 'providers/price_provider.dart';
import 'pages/login/login.dart';
import 'pages/settings/settings.dart';
import 'pages/login/sign_up.dart';
import 'pages/home/home.dart';
import 'pages/games/option_game.dart';
import 'pages/games/set_game.dart';
import 'pages/games/payment.dart';

void main() async {
  await dotenv.load();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PriceProvider()),
        ChangeNotifierProvider(create: (context) => JwtProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: const MaterialApp(
        home: MainAppContent(),
      ),
    );
  }
}

class MainAppContent extends StatelessWidget {
  const MainAppContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Provider.of<JwtProvider>(context).jwt?.isNotEmpty ?? false ? '/home' : '/login',
      routes: {
        "/option_game": (context) => const OptionGame(),
        "/sign_up": (context) => const SignUp(),
        "/set_game": (context) => const SetGame(),
        "/settings": (context) => const Settings(),
        "/payment": (context) => const Payment(),
        "/home": (context) => const Home(),
        "/login": (context) => const Login(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
