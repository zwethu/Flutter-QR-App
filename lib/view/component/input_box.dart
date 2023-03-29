import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/core/style.dart';

class InputBox extends StatelessWidget {
  final TextEditingController textController;
  const InputBox({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: padding1x,
        horizontal: padding1x,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: mainColor,
          width: 2,
        ),
      ),
      child: TextField(
        style: mainTextStyle,
        controller: textController,
        autofocus: true,
        textAlign: TextAlign.center,
        cursorColor: mainColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
