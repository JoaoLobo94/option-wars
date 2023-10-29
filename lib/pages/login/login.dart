import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              const Padding(padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome back", style: TextStyle(color: Colors.white, fontSize: 40)),
                    SizedBox(height: 10),
                    Text("The battle awaits you", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  ),
                  child:  Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
                            const SizedBox(height:40),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)
                                    )]
                                ),
                                child: Column(
                                    children: <Widget>[
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                          ),
                                          child: const TextField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter your Npriv key",
                                                  hintStyle: TextStyle(color: Colors.grey),
                                                  border: InputBorder.none))
                                      ),
                                    ]
                                )
                            ),
                            const SizedBox(height: 40),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/games');
                              },
                              child: SizedBox(
                                width: double.infinity, // Match the parent's width
                                child: Container(
                                  height: 50,
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900]!,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                              ),
                              onPressed: () {
                              },
                              child: Text("Generate Npriv key"),
                            ),
                          ]
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
