import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_tracker/Features/Sessions/controllers/sessions_controller.dart';
import 'package:qr_tracker/Features/ScanQR/scan_qr_view.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:sizer/sizer.dart';

class SessionsView extends GetView<SessionsController> {
  const SessionsView({super.key});

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
        child: Obx(() {
          if (controller.loading()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await controller.getSessions();
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
                      itemCount: controller.sessions.length,
                      itemBuilder: (context, index) {
                        final session = controller.sessions[index];
                        final course = controller.coursesModel;
                        return ListTile(
                          onTap: () async {
                            Get.to(() => const ScanQrView())!
                                .then((value) async {
                              if (value == null) {
                                Util.errorSnackBar(
                                  "Error al scanear el QR, vuelva a intentar",
                                );
                                return;
                              }
                              await controller.sendEntry(value, index);
                            });
                          },
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          tileColor: Palette.black.withOpacity(.2),
                          title: Texts.bold(
                            course.name,
                            fontSize: 10,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texts.bold(
                                "DIA: ${DateFormat.yMMMMEEEEd("es_MX").format(session.entry)}",
                                fontSize: 10,
                              ).marginSymmetric(vertical: 1.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Texts.regular(
                                    "Inicio: ${session.entry.hour}:${session.entry.minute}",
                                    fontSize: 8,
                                  ),
                                  Texts.regular(
                                    "Fin: ${session.exit.hour}:${session.exit.minute}",
                                    fontSize: 8,
                                  ),
                                ],
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
          );
        }),
      ),
    );
  }
}
