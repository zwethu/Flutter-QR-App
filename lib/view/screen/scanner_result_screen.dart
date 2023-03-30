

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerResultScreen extends StatefulWidget {
  const ScannerResultScreen({Key? key}) : super(key: key);

  @override
  State<ScannerResultScreen> createState() => _ScannerResultScreenState();
}

class _ScannerResultScreenState extends State<ScannerResultScreen> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Barcode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Text(
          arg.code.toString(),
        ),
      ),
    );
  }
}
