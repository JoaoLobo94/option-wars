import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final BuildContext context;

  const LoginButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/lightening_setup');
      },
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
          child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
