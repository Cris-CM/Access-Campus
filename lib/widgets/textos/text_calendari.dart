import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/widgets/textos/list_text.dart';

class Calendari extends StatelessWidget {
  const Calendari({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Palette.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListText(
            text: 'Lunes',
            color: Palette.blue,
            fontSize: 15,
          ),
          ListText(
            text: '20',
            fontSize: 20,
            color: Palette.grey,
          )
        ],
      ),
    );
  }
}
