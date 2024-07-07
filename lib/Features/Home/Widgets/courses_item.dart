import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class CoursesItem extends StatelessWidget {
  const CoursesItem({
    super.key,
    required this.classes,
  });
  final CoursesModel classes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          "/sessions",
          arguments: classes,
        );
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 4.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: Palette.black.withOpacity(.2),
            ),
            child: Texts.bold(
              classes.name,
              fontSize: 14,
              color: Palette.kPrimary,
              alignment: TextAlign.center,
            ),
          ),
        ],
      ).marginSymmetric(horizontal: 3.w, vertical: 1.h),
    );
  }
}
