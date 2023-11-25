import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome back", style: TextStyle(color: Colors.white, fontSize: 40)),
          SizedBox(height: 10),
          Text("The battle awaits you", style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}
