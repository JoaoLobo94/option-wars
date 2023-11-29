import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import '../../providers/jwt_provider.dart';
import '../../services/api.dart';
import 'package:flutter/material.dart';
import 'components/welcome_text.dart';
import 'components/badger_image.dart';
import 'components/text_field.dart';
import 'components/login_button.dart';
import 'components/create_account_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const WelcomeText(title: "Welcome back", subtitle: "The battle awaits you"),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const BadgerImage(),
                        InputTextField(controller: _usernameController, hintText: "Enter your username"),
                        const SizedBox(height: 10),
                        PasswordTextField(controller: _passwordController, hintText: "Enter your password"),
                        const SizedBox(height: 10),
                        LoginButton(
                          onPressed: () {
                            _submitForm(context);
                          },
                          title: "Sign In",
                        ),
                        const SizedBox(height: 10),
                        const CreateAccountButton(),
                        const SizedBox(height: 30),
                        const Text("Get ready for the battle", style: TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String? baseUrl = dotenv.env['BASE_URL'];

    if (baseUrl != null) {
      ApiService apiService = ApiService(baseUrl);
      try {
        ApiResult result = await apiService.sendAccountRequest(
          username: username,
          password: password,
          path: 'login',
          method: 'POST',
        );

        if (result.success) {
          final jwtProvider = Provider.of<JwtProvider>(context, listen: false);
          jwtProvider.saveJwtToStorage(result.data['token']);
          Navigator.pushNamed(context, "/home");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${result.errorMessage}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
