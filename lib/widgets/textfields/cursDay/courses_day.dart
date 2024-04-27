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
            const ListText(
              text: 'CURSO DEL DIA\nDE MAÑANA:',
              color: Palette.blueBlack,
              fontbold: true,
              fontSize: 22,
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    'Ver màs',
                    style: TextStyle(
                      color: Palette.blueBlack,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Palette.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
