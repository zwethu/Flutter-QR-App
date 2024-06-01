import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/view/reusable_widget/main_button.dart';

class ScannerResultScreen extends StatefulWidget {
  const ScannerResultScreen({Key? key}) : super(key: key);

  @override
  State<ScannerResultScreen> createState() => _ScannerResultScreenState();
}

class _ScannerResultScreenState extends State<ScannerResultScreen> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Barcode;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        title: const Text(
          'Result',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding2x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 1),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(padding1x),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor),
                    ),
                    child: Center(
                      child: Text(
                        arg.code.toString(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  IconButton(
                    iconSize: 24,
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(
                          text: arg.code.toString(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.content_copy,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              MainButton(
                onTap: () {
                  Navigator.popAndPushNamed(context, 'home');
                },
                message: "Back to Home Page",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
