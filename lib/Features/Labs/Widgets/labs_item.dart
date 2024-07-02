import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class LabsItem extends StatelessWidget {
  const LabsItem({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

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
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [],
          ),
        ),
      ],
    ).marginSymmetric(horizontal: 3.w, vertical: 2.h);
  }
}
