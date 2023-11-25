import 'package:flutter/material.dart';
import 'components/welcome_text.dart';
import 'components/badger_image.dart';
import 'components/text_field.dart';
import 'components/login_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _lnurlController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _lnurlController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                WelcomeText(title: "You are new", subtitle: "We will need some information to startup"),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        BadgerImage(),
                        InputTextField(
                          controller: _usernameController,
                          hintText: "What username would you like?",
                        ),
                        const SizedBox(height: 10),
                        PasswordTextField(
                          controller: _passwordController,
                          hintText: "What password would you like?",
                        ),
                        const SizedBox(height: 10),
                        InputTextField(
                          controller: _lnurlController,
                          hintText: "Enter your lnurl to get your sats",
                        ),
                        const SizedBox(height: 10),
                        LoginButton(
                          onPressed: () {
                            _submitForm();
                          },
                          title: "Sign Up",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;
      String lnurl = _lnurlController.text;

      // Perform API call with the obtained values
      // Example:
      // apiCall(username, password, lnurl);

      // Navigate to the next screen (if needed)
      Navigator.pushNamed(context, '/lightening_setup');
    }
  }
}
