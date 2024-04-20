import 'package:flutter/material.dart';

class ListText extends StatelessWidget {
  const ListText({
    super.key,
    required this.text,
    required this.color,
    this.fontSize = 30,
    this.fontbold = false,
  });

  final String text;
  final Color color;
  final double fontSize;
  final bool fontbold;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontbold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
