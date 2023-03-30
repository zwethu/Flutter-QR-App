import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/core/style.dart';
import 'package:qr_helper/view/component/qr_component.dart';
import 'package:qr_helper/view/reusable_widget/main_button.dart';
import 'package:qr_helper/view_model/provider/generator_result_controller.dart';

class GeneratorResultScreen extends StatefulWidget {
  const GeneratorResultScreen({Key? key}) : super(key: key);

  @override
  State<GeneratorResultScreen> createState() => _GeneratorResultScreenState();
}

class _GeneratorResultScreenState extends State<GeneratorResultScreen> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String;
    return ChangeNotifierProvider<GeneratorResultController>(
      create: (context) => GeneratorResultController(),
      child: Scaffold(
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
                  style: headerTextStyle,
                ),
                QrComponent(
                  url: arg,
                ),
                MainButton(
                  onTap: () async {
                    final controller = context.read<GeneratorResultController>();
                    controller.captureAndSaveQr();
                  },
                  message: "Save",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
