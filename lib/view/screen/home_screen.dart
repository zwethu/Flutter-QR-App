import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/view/reusable_widget/menu_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('QR Helper'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          MenuContainer(
            title: 'Scan QR Code',
            route: 'scanner',
          ),
          SizedBox(height: 32),
          MenuContainer(
            title: 'Generate QR Code',
            route: 'generator',
          ),
        ],
      ),
    );
  }
}
