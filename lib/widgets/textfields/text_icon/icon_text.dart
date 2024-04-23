import 'package:flutter/material.dart';
import 'package:qr_tracker/widgets/textfields/text/list_text.dart';

import '../../../core/colors/palette.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.texto,
    required this.icono,
  });

  final String texto;
  final IconData icono;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Palette.blue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icono,
              size: 38,
              color: Palette.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListText(
          text: texto,
          color: Palette.blueBlack,
          fontSize: 20,
        ),
      ],
    );
  }
}
