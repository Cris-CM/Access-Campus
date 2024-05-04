import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
  });
  final String text;
  final Color? color;
  final Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Palette.kPrimary,
          fontSize: 15,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
