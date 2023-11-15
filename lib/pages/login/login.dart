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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(20),
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
                                  // child: Column(
                                  //     children: <Widget>[
                                  //       Container(
                                  //           padding: const EdgeInsets.all(10),
                                  //           decoration: BoxDecoration(
                                  //             border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                  //           ),
                                  //           child: const TextField(
                                  //               decoration: InputDecoration(
                                  //                   hintText: "Enter your Npriv key",
                                  //                   hintStyle: TextStyle(color: Colors.grey),
                                  //                   border: InputBorder.none))
                                  //       ),
                                  //     ]
                                  // )
                              ),
                              Image.asset(
                                'lib/assets/badger.png',
                                width: 200,
                                height: 200,
                              ),
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
                                    child: const Text("Generate single use login", style: TextStyle(color: Colors.white, fontSize: 18)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                ),
                                onPressed: () {
                                },
                                child: const Text("All sessions are ephemeral."),
                              ),
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
