import 'package:flutter/material.dart';

class TextUser extends StatelessWidget {
  const TextUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: const TextField(
        decoration: InputDecoration(
            icon: Icon(Icons.person_2_outlined),
            hintText: 'Usuario',
            border: InputBorder.none),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
