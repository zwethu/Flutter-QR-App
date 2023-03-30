import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/view/reusable_widget/main_button.dart';
import 'package:screenshot/screenshot.dart';

class GeneratorResultScreen extends StatefulWidget {
  const GeneratorResultScreen({Key? key}) : super(key: key);

  @override
  State<GeneratorResultScreen> createState() => _GeneratorResultScreenState();
}

class _GeneratorResultScreenState extends State<GeneratorResultScreen> {
  late Uint8List _imageFile;
  final ScreenshotController screenshotController = ScreenshotController();

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
              Screenshot(
                controller: screenshotController,
                child: QrImage(
                  backgroundColor: Colors.white,
                  data: arg,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              MainButton(
                onTap: () async {
                  await screenshotController.capture().then((Uint8List? image) {
                    setState(() {
                      _imageFile = image!;
                    });
                    log('QR code is successfully captured!!!');
                    saveQrCode(_imageFile);
                  }).catchError((onError) {
                    log('Error on capturing QR: $onError');
                  });
                },
                message: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveQrCode(Uint8List qrCodeBytes) async {
  // Get the device's temporary directory to save the file
  Directory tempDir = await getTemporaryDirectory();
  // Define a file path with a unique name (e.g. using the current date and time)
  String filePath = '${tempDir.path}/qrCode_${DateTime.now().toString()}.png';
  // Write the bytes to a file
  await File(filePath).writeAsBytes(qrCodeBytes);
  log('QR code saved to $filePath');
  // Save the image to the gallery and notify the media scanner
  final result =
      await GallerySaver.saveImage(filePath, albumName: 'MyQRCodeImages');
  if (result ?? false) {
    log('Image saved successfully.'); // Show a toast message confirming the image was saved
  } else {
    log('Error saving image.'); // Show a toast message indicating an error occurred
  }
}
