import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.title,
    required this.icon,
    this.isPassword = false,
    this.inputType,
    this.controller,
    this.validator,
  });
  final String title;
  final IconData icon;
  final bool isPassword;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Palette.grey200,
        filled: true,
        prefixIcon: Icon(icon),
        hintText: title,
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 20),
    );
  }
}
