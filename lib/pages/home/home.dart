import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/set_game');
                      },
                      child: const Text('Play options game', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
