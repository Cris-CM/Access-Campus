import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: title,
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 20),
    );
  }
}
