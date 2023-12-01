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
      home: OptionGame(),
      routes: {
        "/option_game": (context) => const ProtectedRoute(child: OptionGame()),
        "/sign_up": (context) => const ProtectedRoute(child: SignUp()),
        "/set_game": (context) => const ProtectedRoute(child: SetGame()),
        "/settings": (context) => const ProtectedRoute(child: Settings()),
        "/payment": (context) => const ProtectedRoute(child: Payment()),
        "/home": (context) => const ProtectedRoute(child: Home()),
        "/login": (context) => const Login(),
      },
      debugShowCheckedModeBanner: true,
    );
  }
}

class ProtectedRoute extends StatelessWidget {
  final Widget child;

  const ProtectedRoute({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<JwtProvider>(context).jwt?.isNotEmpty ?? false;

    if (isAuthenticated) {
      return child;
    } else {
      Navigator.pushReplacementNamed(context, "/login");
      return Container();
    }
  }
}
