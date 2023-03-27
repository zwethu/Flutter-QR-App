import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';

class GeneratorScreen extends StatelessWidget {
  const GeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('QR Generator'),
        backgroundColor: mainColor,
      ),
      body: const Placeholder(),
     );
  }
}