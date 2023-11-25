import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String title;
  final String subtitle;

  const WelcomeText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 40)),
          const SizedBox(height: 10),
          Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}
