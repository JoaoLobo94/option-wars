import 'package:flutter/material.dart';

class LighteningSetup extends StatelessWidget {
  const LighteningSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Enter your Lnurl", style: TextStyle(color: Colors.white, fontSize: 40)),
                    const Text("To credit your victories!", style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 100),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, 0.3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter your Lnurl",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        ),
                        onPressed: () {
                          // need to check if the user already exists or not. Show lightning setup conditionally
                          Navigator.pushNamed(context, '/set_game');
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
                            child: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    // Add more widgets here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
