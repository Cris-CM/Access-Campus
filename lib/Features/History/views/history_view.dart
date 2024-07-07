import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_tracker/Features/History/controllers/history_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texts.bold("Historial de asistencias"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getHistory();
        },
        child: Obx(() {
          if (controller.loading()) {
            return const LinearProgressIndicator();
          }

          return ListView.builder(
            itemCount: controller.historyModel.length,
            itemBuilder: (context, index) {
              final history = controller.historyModel[index];
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Palette.blue900,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.bold(
                      history.usersModel.name,
                      fontSize: 13,
                    ).marginOnly(bottom: 2.h),
                    Texts.bold(
                      history.coursesModel.name,
                      fontSize: 10,
                    ).marginOnly(bottom: 1.h),
                    Texts.regular(
                      "INGRESO: ${DateFormat.yMMMMEEEEd("es_MX").add_jms().format(history.entry)}",
                      fontSize: 10,
                      textOverflow: TextOverflow.fade,
                    )
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
