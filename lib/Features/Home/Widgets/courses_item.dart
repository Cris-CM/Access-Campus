import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/models/curse_model.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class CoursesItem extends StatelessWidget {
  const CoursesItem({
    super.key,
    required this.classes,
    required this.onPressed,
    required this.isUser,
  });
  final CurseModel classes;
  final Function() onPressed;
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
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
                  Texts.bold(
                    classes.csecdescripcion,
                    color: Palette.kPrimary,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Texts.bold(
                  classes.casidescripcion,
                  fontSize: 14,
                  color: Palette.kPrimary,
                  alignment: TextAlign.center,
                ).marginOnly(bottom: 1.h),
                Texts.bold(
                  classes.cpernombredocente,
                  fontSize: 10,
                  color: Palette.black,
                  alignment: TextAlign.center,
                ).marginOnly(bottom: 1.h),
              ],
            ),
          ),
        ],
      ).marginSymmetric(horizontal: 3.w, vertical: 2.h),
    );
  }
}
