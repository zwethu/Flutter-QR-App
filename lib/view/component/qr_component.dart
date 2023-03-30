import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_helper/view_model/provider/generator_result_controller.dart';
import 'package:screenshot/screenshot.dart';

class QrComponent extends StatelessWidget {
  final String url;
  const QrComponent({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneratorResultController>(
        builder: (context, provider, child) {
      return Screenshot(
        controller: provider.screenshotController,
        child: QrImage(
          backgroundColor: Colors.white,
          data: url,
          version: QrVersions.auto,
          size: 200.0,
        ),
      );
    });
  }
}
