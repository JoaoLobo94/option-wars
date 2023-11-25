import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const LoginButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
