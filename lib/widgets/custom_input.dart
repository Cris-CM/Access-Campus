import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.grey200,
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: title,
          border: InputBorder.none,
        ),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
