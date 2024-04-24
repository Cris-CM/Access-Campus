import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/widgets/textfields/text/list_text.dart';

class CoursesDay extends StatelessWidget {
  const CoursesDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
            const ListText(
              text: 'CURSO DEL DIA\nDE MAÑANA:',
              color: Palette.blueBlack,
              fontbold: true,
              fontSize: 22,
            ),
            const SizedBox(width: 250),
            TextButton(
              onPressed: () {},
              child: const ListText(
                text: 'Ver màs',
                color: Palette.blueBlack,
                fontbold: true,
                fontSize: 22,
              ),
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
