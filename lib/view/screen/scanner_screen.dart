import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        backgroundColor: mainColor,
      ),
      body: const Placeholder(),
     );
  }
}