import 'package:flutter/material.dart';
import 'package:qr_helper/core/string.dart';
import 'package:qr_helper/view/screen/generator_screen.dart';
import 'package:qr_helper/view/screen/home_screen.dart';
import 'package:qr_helper/view/screen/scanner_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: const HomeScreen(),
      routes: {
        'home': (context) => const HomeScreen(),
        'generator': (context) => const GeneratorScreen(),
        'scanner': (context) => const ScannerScreen(),
      },
    );
  }
}
