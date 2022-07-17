import 'package:bmi/config.dart';
import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({
    Key? key,
    required this.text,
    this.fontSize, this.fontColor,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor ?? disableColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
