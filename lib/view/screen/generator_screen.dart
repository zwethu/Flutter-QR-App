import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/view/reusable_widget/main_button.dart';
import 'package:qr_helper/view/component/input_section.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({Key? key}) : super(key: key);

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    textController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'QR Generator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding3x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Insert URL For QR Code',
              style: TextStyle(fontSize: 24),
            ),
            InputSection(
              textController: textController,
              isEmpty: true,
            ),
            MainButton(
              message: "Generate",
              onTap: () => goToResultScreen(context, textController),
            ),
          ],
        ),
      ),
    );
  }
}

void goToResultScreen(
    BuildContext context, TextEditingController textController) {
  log('data: ${textController.text}');
  Navigator.pushNamed(
    context,
    'generator result',
    arguments: textController.text,
  );
}
