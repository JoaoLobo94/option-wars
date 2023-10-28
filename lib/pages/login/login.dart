import 'package:flutter/material.dart';
import 'components/login_text_input.dart';

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
                    FadeAnimation()Text("Welcome back", style: TextStyle(color: Colors.white, fontSize: 40)),
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
                      padding: EdgeInsets.all(30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
                            const SizedBox(height:60),
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
                                          padding: EdgeInsets.all(10),
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
                            SizedBox(height: 40),
                            Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal:50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange[900]!
                                ),
                                child: const Center(
                                    child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                                )
                            ),
                            SizedBox(height: 40),
                            Text("Generate Npriv key",style: TextStyle(color: Colors.grey)),
                          ]
                      )
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
