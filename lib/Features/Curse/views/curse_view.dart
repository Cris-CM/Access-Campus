import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Curse/controllers/curse_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class CurseView extends GetView<CurseController> {
  const CurseView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getHourCurses(Get.arguments);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getHourCurses(Get.arguments);
          },
          child: Column(
            children: [
              const Texts.bold(
                "Laboratorios Activos",
                fontSize: 16,
              ).marginOnly(bottom: 3.h),
              Obx(() {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                      );
                    },
                    itemCount: controller.hourCurseModel.length,
                    itemBuilder: (context, index) {
                      final curse = controller.hourCurseModel[index];
                      return ListTile(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        tileColor: Palette.black.withOpacity(.2),
                        title: Texts.bold(
                          curse.ambiente,
                          fontSize: 10,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Texts.regular(
                              curse.dias,
                              fontSize: 8,
                            ),
                            Texts.regular(
                              curse.horas,
                              fontSize: 8,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ).marginSymmetric(horizontal: 4.w),
        ),
      ),
    );
  }
}
