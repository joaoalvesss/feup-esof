import 'package:flutter/material.dart';

class TextElement extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  const TextElement({
    required this.text,
    this.fontSize,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}