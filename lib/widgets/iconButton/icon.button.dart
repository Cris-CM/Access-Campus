import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';

class IconForward extends StatelessWidget {
  const IconForward({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: Palette.red,
      ),
    );
  }
}
