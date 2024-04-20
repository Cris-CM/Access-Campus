import 'package:flutter/material.dart';

class TextDrawer extends StatelessWidget {
  const TextDrawer({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(
            color: Colors.lightBlue.shade900,
            fontSize: 23,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
