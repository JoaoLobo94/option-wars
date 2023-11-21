import 'package:flutter/material.dart';
import 'package:nostr/nostr.dart';

void generateLogin() async {
  var randomKeys = Keychain.generate();
  print(randomKeys.private);
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
              )),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Welcome back", style: TextStyle(color: Colors.white, fontSize: 40)),
                      SizedBox(height: 10),
                      Text("The battle awaits you", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child:  Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget> [
                              const SizedBox(height:40),
                              Image.asset(
                                'lib/assets/badger.png',
                                width: 200,
                                height: 200,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [BoxShadow(
                                          color: Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10)
                                      )
                                      ]
                                  ),
                                  child: Column(
                                      children: <Widget>[
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            child: const TextField(
                                                decoration: InputDecoration(
                                                    hintText: "Enter your username",
                                                    hintStyle: TextStyle(color: Colors.grey),
                                                    border: InputBorder.none))
                                        ),
                                      ]
                                  )
                              ),
                              const SizedBox(height:10),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [BoxShadow(
                                          color: Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10)
                                      )
                                      ]
                                  ),
                                  child: Column(
                                      children: <Widget>[
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            child: const TextField(
                                                decoration: InputDecoration(
                                                    hintText: "Enter your password",
                                                    hintStyle: TextStyle(color: Colors.grey),
                                                    border: InputBorder.none))
                                        ),
                                      ]
                                  )
                              ),
                              const SizedBox(height:10),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                ),
                                onPressed: () {
                                  // need to check if user already exists or not. Show lightening setup conditionally
                                  Navigator.pushNamed(context, '/lightening_setup');
                                },
                                child: SizedBox(
                                  width: double.infinity, // Match the parent's width
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
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                ),
                                onPressed: () {
                                },
                                child: const Text("If your account doesn't exist we will create one."),
                              ),
                              const SizedBox(height: 30),
                              Text("Nostr login in the works...", style: TextStyle(color: Colors.white, fontSize: 18))
                            ]
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
