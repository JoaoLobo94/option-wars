import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/sign_up');
      },
      child: const Text("Create account", style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
