import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Curse/Controllers/curse_controller.dart';
import 'package:qr_tracker/Features/Curse/views/qr_show_view.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:sizer/sizer.dart';

class CurseView extends GetView<CurseController> {
  const CurseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Texts.bold(
          "Laboratorios Activos",
          fontSize: 16,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getHourCurses(Get.arguments);
          },
          child: Column(
            children: [
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
                        leading: IconButton(
                          onPressed: () {
                            Get.to(
                              () => QrShowView(),
                              arguments: curse.ambiente,
                            );
                          },
                          icon: Icon(Icons.qr_code),
                        ),
                        onTap: () {
                          if (controller.hourSaved
                              .any((element) => element.dias == curse.dias)) {
                            return;
                          }
                          Get.toNamed("/qrscan", arguments: curse)!
                              .then((value) {
                            controller.hourSaved.add(value);
                            Util.successSnackBar("Asistencia guardada");
                          });
                        },
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                          side: controller.hourSaved
                                  .any((element) => element.dias == curse.dias)
                              ? BorderSide(color: Palette.blue900, width: 3)
                              : const BorderSide(color: Colors.transparent),
                        ),
                        tileColor: Palette.black.withOpacity(.2),
                        title: Texts.bold(
                          curse.ambiente,
                          fontSize: 10,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
