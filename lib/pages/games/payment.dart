import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async package for Timer
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'components/game_top_bar.dart';
import '../../providers/data_provider.dart';
import '../../providers/jwt_provider.dart';
import '../../services/api.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late String paymentData = getPaymentData(context);
  late String paymentAmount = getPaymentAmount(context);
  Timer? paymentPollingTimer;

  @override
  void initState() {
    super.initState();
    startPaymentPolling();
  }

  @override
  void dispose() {
    paymentPollingTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startPaymentPolling() {
    const Duration pollInterval = Duration(seconds: 5);
    paymentPollingTimer = Timer.periodic(pollInterval, (Timer timer) {
      _getAndUpdatePaymentInfo();
    });
  }

  void _getAndUpdatePaymentInfo() async {
    bool isPaymentReceived = await getPaymentInformation(context);
    if (isPaymentReceived) {
      paymentPollingTimer?.cancel();
      Navigator.pushNamed(context, '/option_game');
    }
    setState(() {
      paymentAmount = getPaymentAmount(context);
      paymentData = getPaymentData(context);
    });
  }

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
                    Text(
                      "Pay $paymentAmount sats to start the game",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'lib/assets/lightening.png',
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: QrImageView(
                        data: paymentData,
                        version: QrVersions.auto,
                        size: 300.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _copyToClipboard(context, paymentData),
                      child: Text(
                        paymentData,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const Text(
                      "Waiting for payment...",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text copied to clipboard'),
      ),
    );
  }

  String getPaymentData(BuildContext context) {
    return Provider.of<DataProvider>(context, listen: false).paymentInfo;
  }

  String getPaymentAmount(BuildContext context) {
    return Provider.of<DataProvider>(context, listen: false).paymentAmount;
  }

  String getDirection(BuildContext context) {
    return Provider.of<DataProvider>(context, listen: false).betDirection;
  }

  Future<bool> getPaymentInformation(BuildContext context) async {
    String? baseUrl = dotenv.env['BASE_URL'];
    JwtProvider jwtProvider = Provider.of<JwtProvider>(context, listen: false);
    String jwt = jwtProvider.jwt!;

    if (baseUrl != null) {
      ApiService apiService = ApiService(baseUrl);
      try {
        ApiResult result = await apiService.checkInvoicePayment(
          paymentHash: getPaymentHash(context),
          id: getId(context),
          direction: getDirection(context),
          path: 'invoices',
          token: jwt,
        );
        if (result.success) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    } else {
      return Future.value(false);
    }
  }

  String getPaymentHash(BuildContext context) {
    return Provider.of<DataProvider>(context, listen: false).paymentHash;
  }

  int getId(BuildContext context) {
    return Provider.of<DataProvider>(context, listen: false).id;
  }
}
