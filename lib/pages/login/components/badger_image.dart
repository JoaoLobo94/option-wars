import 'package:flutter/material.dart';

class BadgerImage extends StatelessWidget {
  const BadgerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/badger.png',
      width: 200,
      height: 200,
    );
  }
}
