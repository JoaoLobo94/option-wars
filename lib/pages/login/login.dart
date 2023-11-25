import 'package:flutter/material.dart';
import 'components/welcome_text.dart';
import 'components/badger_image.dart';
import 'components/text_field.dart';
import 'components/login_button.dart';
import 'components/create_account_button.dart';



class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const WelcomeText(title: "Welcome back", subtitle: "The battle awaits you"),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const BadgerImage(),
                      const InputTextField(hintText: "Enter your username"),
                      const SizedBox(height: 10),
                      const PasswordTextField(hintText: "Enter your password"),
                      const SizedBox(height: 10),
                      LoginButton(
                        onPressed: () {
                          _submitForm();
                        },
                        title: "Sign Up",
                      ),
                      const SizedBox(height: 10),
                      const CreateAccountButton(),
                      const SizedBox(height: 30),
                      const Text("Get ready for the battle", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _submitForm() {
  print("Form submitted");
}
