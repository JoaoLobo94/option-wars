import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<String> buttonLabels;

  const ButtonRow({Key? key, required this.buttonLabels});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttonLabels.map((label) {
          return ElevatedButton(
            onPressed: () {
              // Add your button logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent, // Set the button color to orange accent
            ),
            child: Text(label),
          );
        }).toList(),
      ),
    );
  }
}
