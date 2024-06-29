import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Home/Models/classes_model.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class CoursesItem extends StatelessWidget {
  const CoursesItem({
    super.key,
    required this.classes,
    required this.onPressed,
    required this.isUser,
  });
  final ClassesModel classes;
  final Function() onPressed;
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Palette.grey400,
              ),
              color: Palette.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Texts.bold(
                  "LAB",
                  fontSize: 14,
                  color: Palette.red,
                  alignment: TextAlign.center,
                ).marginOnly(bottom: 1.h),
                Texts.bold(
                  classes.pavilion + classes.number,
                  color: Palette.kPrimary,
                  fontSize: 15,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Texts.bold(
                classes.name,
                fontSize: 14,
                color: Palette.kPrimary,
                alignment: TextAlign.center,
              ).marginOnly(bottom: 1.h),
              Texts.bold(
                isOpen() ? "Abierto" : "Cerrado",
                color: isOpen() ? Colors.green : Palette.red,
                fontSize: 15,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
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
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                isUser ? Icons.qr_code_scanner : Icons.edit,
                color: Palette.black,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    ).marginSymmetric(horizontal: 3.w, vertical: 2.h);
  }

  isOpen() {
    final date = DateTime.now();
    if (date.isAfter(classes.entryDate) && date.isBefore(classes.exitDate)) {
      return true;
    }

    return false;
  }
}
