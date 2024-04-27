import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/widgets/iconButton/icon.button.dart';
import 'package:qr_tracker/widgets/textfields/text/list_text.dart';

class Courses extends StatelessWidget {
  const Courses({
    super.key,
    this.text = '',
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Palette.grey400,
            ),
            color: Palette.white,
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListText(
                text: 'MAR',
                color: Palette.red,
                fontSize: 20,
                fontbold: true,
              ),
              ListText(
                text: '20',
                fontSize: 29,
                fontbold: true,
                color: Palette.blueBlack,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        ListText(
          text: text,
          color: Palette.blueBlack,
          fontbold: true,
          fontSize: 22,
        ),
        const Spacer(),
        Container(
            decoration: BoxDecoration(
              color: Palette.grey200,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Color de la sombra
                  spreadRadius: 5, // Radio de expansión de la sombra
                  blurRadius: 7, // Radio de desenfoque de la sombra
                  offset: const Offset(0, 3), // Desplazamiento de la sombra
                ),
              ],
            ),
            child: const IconForward()),
      ],
    );
  }
}