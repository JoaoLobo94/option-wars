import 'package:flutter/material.dart';

class WalletCreate extends StatelessWidget {
  const WalletCreate({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Wallet'),
      ),
      body: const Center(
        child: Text(
          'Wallet Creation Page',
        ),
      ),
    );
  }
}