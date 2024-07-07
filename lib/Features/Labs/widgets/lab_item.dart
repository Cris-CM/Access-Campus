import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_tracker/Features/Labs/Controllers/labs_controller.dart';
import 'package:qr_tracker/Features/Labs/views/qr_show_view.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/models/sessions_model.dart';
import 'package:qr_tracker/core/widgets/custom_button.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class LabItem extends GetView<LabsController> {
  const LabItem({
    super.key,
    required this.coursesModel,
    required this.sessions,
  });
  final CoursesModel coursesModel;
  final List<SessionsModel> sessions;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Texts.bold(
          coursesModel.name,
          fontSize: 14,
          color: Palette.kPrimary,
          alignment: TextAlign.center,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomButton(
            onPressed: () async {
              await controller.dialogAssingUser(coursesModel.id);
            },
            text: "Asignar alumnos",
          ).marginSymmetric(horizontal: 5.w),
          CustomButton(
            onPressed: () async {
              Get.to(
                () => const QrShowView(),
                arguments: coursesModel.name,
              );
            },
            text: "Generar codigo QR",
          ).marginSymmetric(horizontal: 5.w),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            width: double.infinity,
            height: 1,
            color: Palette.blue900.withOpacity(.6),
          ),
          const Texts.bold(
            "Selecione para modificar la hora:",
            fontSize: 12,
          ).marginOnly(left: 4.w),
          Column(
            children: sessions
                .map(
                  (e) => ListTile(
                    onTap: () async {
                      await controller.dialogUpdateHour(e);
                    },
                    tileColor: Palette.black.withOpacity(.2),
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texts.bold(
                          "DIA: ${DateFormat.yMMMMEEEEd("es_MX").format(e.entry)}",
                          fontSize: 10,
                        ).marginOnly(bottom: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Texts.bold(
                              "HORARIO:",
                              fontSize: 10,
                              color: Palette.kPrimary,
                              alignment: TextAlign.center,
                            ),
                            Texts.regular(
                              "Inicio: ${e.entry.hour}:${e.entry.minute}",
                              fontSize: 8,
                            ),
                            Texts.regular(
                              "Fin: ${e.exit.hour}:${e.exit.minute}",
                              fontSize: 8,
                            ),
                            Texts.regular(
                              "Extra: ${e.minutesExtra} min",
                              fontSize: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).marginSymmetric(vertical: 1.h),
                )
                .toList(),
          ),
        ]);
  }
}
