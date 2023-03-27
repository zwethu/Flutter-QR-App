import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_helper/core/color.dart';
import 'package:qr_helper/core/dimension.dart';
import 'package:qr_helper/core/style.dart';

class MenuContainer extends StatelessWidget {
  final String title;
  final String route;
  const MenuContainer({Key? key, required this.title, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        margin: const EdgeInsets.symmetric(
          horizontal: margin2x,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: padding1x,
          horizontal: padding2x,
        ),
        decoration: const BoxDecoration(
          color: mainColor,
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: menuTextStyle,
          ),
        ),
      ),
    );
  }
}
