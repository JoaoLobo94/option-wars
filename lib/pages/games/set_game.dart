import '../../providers/jwt_provider.dart';
import '../../providers/data_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/game_top_bar.dart';
import 'components/button_row.dart';
import '../../services/api.dart';

class SetGame extends StatefulWidget {
  const SetGame({Key? key}) : super(key: key);

  @override
  _SetGameState createState() => _SetGameState();
}

class _SetGameState extends State<SetGame> {
  String? selectedAmount;
  String? selectedDirection;

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
              child: GameTopBar(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you think the price will go up or down by \$10?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'lib/assets/img.png',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Choose your bet:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ButtonRow(
                    buttonLabels: ["10 sats", "100 sats", "1000 sats", "10000 sats"],
                    values: ["10", "100", "1000", "10000"],
                    onButtonPressed: (value) {
                      setState(() {
                        selectedAmount = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  ButtonRow(
                    buttonLabels: ["Go up", "Go down"],
                    values: ["up", "down"],
                    onButtonPressed: (value) {
                      setState(() {
                        selectedDirection = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  ButtonRow(
                    buttonLabels: ["Play"],
                    values: ["play"],
                    onButtonPressed: (_) {
                      if (selectedAmount != null && selectedDirection != null) {
                        requestInvoice(selectedAmount: selectedAmount, selectedDirection: selectedDirection, context: context);

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select both amount and direction.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void requestInvoice({required selectedAmount, required selectedDirection, required BuildContext context}) async {
  String? baseUrl = dotenv.env['BASE_URL'];

  if (baseUrl != null) {
    ApiService apiService = ApiService(baseUrl);
    JwtProvider jwtProvider = Provider.of<JwtProvider>(context, listen: false);
    DataProvider dataProvider = Provider.of<DataProvider>(context, listen: false);

    String jwt = jwtProvider.jwt!;

    apiService.requestInvoice(amount: selectedAmount, path: 'invoices', token: jwt).then((result) {

      if (result.success) {
        dataProvider.setParameters(result.data['id'], result.data['payment_hash'], result.data['payment_request'], selectedDirection, selectedAmount);
        Navigator.pushNamed(context, '/payment');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }
}