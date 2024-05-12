import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Labs/Controllers/labs_controller.dart';
import 'package:qr_tracker/Features/Labs/Widgets/labs_item.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';

class LabsView extends GetView<LabsController> {
  const LabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.kPrimary,
        leading: const BackButton(
          color: Palette.white,
        ),
        title: const Texts.bold(
          "Laboratorios",
          color: Palette.white,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getClasses();
        },
        child: Obx(() {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: Palette.kPrimary,
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: controller.classesList.length,
            itemBuilder: (BuildContext context, int index) {
              return LabsItem(
                classes: controller.classesList[index],
                onPressed: () {
                  Get.toNamed("/qrscan");
                },
              );
            },
          );
        }),
      ),
    );
  }
}
