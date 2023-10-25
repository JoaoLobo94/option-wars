import 'package:flutter/material.dart';

class LoginTextInput extends StatelessWidget {
  final String labelText;

  LoginTextInput({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: labelText, border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      )),
    );
  }
}
