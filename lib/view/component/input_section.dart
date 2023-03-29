import 'package:flutter/material.dart';
import 'package:qr_helper/core/style.dart';
import 'package:qr_helper/view/component/input_box.dart';

class InputSection extends StatelessWidget {
  final bool isEmpty;
  final TextEditingController textController;
  const InputSection({
    Key? key,
    required this.textController,
    required this.isEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputBox(textController: textController),
        const SizedBox(height: 16),
         isEmpty ? const Text(
          '* This cannot be empty',
          style: validationTextStyle,
        ) : const Text(
          '',
        ),
      ],
    );
  }
}
