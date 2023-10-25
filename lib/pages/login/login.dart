import 'package:flutter/material.dart';
import 'components/login_text_input.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.orange[900]!, Colors.orange[800]!, Colors.orange[400]!],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              const Padding(padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40)),
                    SizedBox(height: 10),
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60),
                      LoginTextInput(labelText: "Email"),
                      const SizedBox(height: 20),
                      LoginTextInput(labelText: "Password"),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: const Text("Forgot Password?", style: TextStyle(color: Colors.orange, fontSize: 14)),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange[900]
                        ),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text("Continue with social media", style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 30),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                              ),
                              child: const Center(
                                child: Text("Facebook", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black
                              ),
                              child: const Center(
                                child: Text("Github", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ));
  }
}
