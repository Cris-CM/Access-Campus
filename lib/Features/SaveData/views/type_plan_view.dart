import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/SaveData/Controllers/save_data_controller.dart';
import 'package:qr_tracker/core/statics/const.dart';
import 'package:qr_tracker/core/widgets/custom_button.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:sizer/sizer.dart';

class TypePlanView extends GetView<SaveDataController> {
  const TypePlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading()) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Texts.bold(
                "Elije tus cursos a mostrar",
                fontSize: 16,
              ).marginOnly(bottom: 2.h),
              DropdownButton(
                isExpanded: true,
                value: controller.typePlanSelected.isEmpty
                    ? null
                    : controller.typePlanSelected(),
                items: controller.typePlanModel
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.nIntCodigo,
                        child: Texts.regular(e.cIntDescripcion),
                      ),
                    )
                    .toList(),
                onChanged: (value) async {
                  controller.typePlanSelected(value);
                  await controller.getPlan(value ?? "");
                },
              ).marginOnly(bottom: 4.h),
              if (controller.planModel.isNotEmpty)
                DropdownButton(
                  isExpanded: true,
                  value: controller.planSelected.isEmpty
                      ? null
                      : controller.planSelected(),
                  items: controller.planModel
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.nCurCodigo.toString(),
                          child: Texts.regular(e.cCurDescripcion),
                        ),
                      )
                      .toList(),
                  onChanged: (value) async {
                    controller.planSelected(value);
                    await controller.getPeriods(value ?? "");
                  },
                ).marginOnly(bottom: 4.h),
              if (controller.periodModel.isNotEmpty)
                DropdownButton(
                  isExpanded: true,
                  value: controller.periodSelected.isEmpty
                      ? null
                      : controller.periodSelected(),
                  items: controller.periodModel
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.nPrdCodigo.toString(),
                          child: Texts.regular(e.cPrdDescripcion),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.periodSelected(value);
                  },
                ).marginOnly(bottom: 4.h),
              CustomButton(
                onPressed: () async {
                  if (controller.planSelected.isEmpty ||
                      controller.typePlanSelected.isEmpty ||
                      controller.periodSelected.isEmpty) {
                    Util.errorSnackBar("Completa los campos");
                    return;
                  }

                  await controller.saveData(
                    keyTypePlan,
                    controller.typePlanSelected(),
                  );
                  await controller.saveData(
                    keyPlan,
                    controller.planSelected(),
                  );
                  await controller.saveData(
                    keyPeriod,
                    controller.periodSelected(),
                  );

                  controller.onInit();
                },
                text: "Guardar",
              ),
            ],
          ).marginSymmetric(horizontal: 10.w),
        );
      }),
    );
  }
}
