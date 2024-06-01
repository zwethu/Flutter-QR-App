import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:screenshot/screenshot.dart';

class GeneratorResultController extends ChangeNotifier {
  // late Uint8List _imageFile;
  // final ScreenshotController screenshotController = ScreenshotController();

  void captureAndSaveQr() async {
    // await screenshotController.capture().then((Uint8List? image) {
    //   _imageFile = image!;
    //   notifyListeners();
    //   log('QR code is successfully captured!!!');
    //   saveQrCode(_imageFile);
    // }).catchError((onError) {
    //   log('Error on capturing QR: $onError');
    // });
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
    final result = await GallerySaver.saveImage(
      filePath,
      albumName: 'MyQRCodeImages',
    );
    if (result ?? false) {
      log('Image saved successfully.'); // Show a toast message confirming the image was saved
    } else {
      log('Error saving image.'); // Show a toast message indicating an error occurred
    }
  }
}
