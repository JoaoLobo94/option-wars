import 'package:flutter/material.dart';

class ButtonRow extends StatefulWidget {
  final List<String> buttonLabels;
  final List<String>? values;
  final Function(String) onButtonPressed;

  const ButtonRow({
    Key? key,
    required this.buttonLabels,
    this.values,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(widget.buttonLabels.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int index = 0; index < widget.buttonLabels.length; index++)
          _buildButton(index),
      ],
    );
  }

  Widget _buildButton(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isSelected = List.generate(widget.buttonLabels.length, (i) => i == index);
            widget.onButtonPressed(widget.values?[index] ?? widget.buttonLabels[index]);
          });
        },
        style: ButtonStyle(
          backgroundColor: isSelected[index] ? MaterialStateProperty.all(Colors.orangeAccent) : null,
          foregroundColor: isSelected[index] ? MaterialStateProperty.all(Colors.white) : null,
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide.none,
            ),
          ),
        ),
        child: Text(
          widget.buttonLabels[index],
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
