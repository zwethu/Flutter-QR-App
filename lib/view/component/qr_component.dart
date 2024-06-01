import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:screenshot/screenshot.dart';

class QrComponent extends StatelessWidget {
  final String url;
  const QrComponent({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Consumer<GeneratorResultController>(
    //     builder: (context, provider, child) {
    // return Screenshot(
    //   controller: provider.screenshotController,
    //   child: QrImageView(
    //     backgroundColor: Colors.white,
    //     data: url,
    //     version: QrVersions.auto,
    //     size: 200.0,
    //   ),
    // );
    return QrImageView(
      backgroundColor: Colors.white,
      data: url,
      version: QrVersions.auto,
      size: 200.0,
    );
    //   });
    // }
  }
}
