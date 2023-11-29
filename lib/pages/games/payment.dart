import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/game_top_bar.dart';
import '../../providers/data_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    String paymentData = getPaymentData(context);
    String paymentAmount = getPaymentAmount(context);

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
                        data: paymentData, // Use the payment data for the QR code
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
