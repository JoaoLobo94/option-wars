import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: () {
        // Handle account creation logic
      },
      child: const Text("Create account", style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
