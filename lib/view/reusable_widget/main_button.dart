import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/style.dart';

class MainButton extends StatelessWidget {
  final String message;
  final Function() onTap;
  const MainButton({
    Key? key,
    required this.onTap,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 2.0,
          color: mainColor,
        ),
        minimumSize: const Size.fromHeight(60),
      ),
      onPressed: onTap,
      child: Text(
        message,
        style: mainTextStyle,
      ),
    );
  }
}
