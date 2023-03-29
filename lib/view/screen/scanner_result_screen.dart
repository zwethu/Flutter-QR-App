import 'package:flutter/material.dart';

class ScannerResultScreen extends StatelessWidget {
  const ScannerResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Result'),
      ),
    );
  }
}