import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/view/reusable_widget/main_button.dart';

class GeneratorResultScreen extends StatelessWidget {
  const GeneratorResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding3x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Result',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              QrImage(
                data: arg,
                version: QrVersions.auto,
                size: 200.0,
              ),
              MainButton(onTap: () {}, message: "Save"),
            ],
          ),
        ),
      ),
    );
  }
}
