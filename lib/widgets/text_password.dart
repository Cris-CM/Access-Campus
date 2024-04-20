import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextPassword extends StatefulWidget {
  const TextPassword({super.key});

  @override
  State<TextPassword> createState() => _TextPasswordState();
}

class _TextPasswordState extends State<TextPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
          LengthLimitingTextInputFormatter(8)
        ],
        decoration: InputDecoration(
          icon: const Icon(Icons.lock_outline),
          hintText: 'Contraseña',
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
