import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Labs/Controllers/labs_controller.dart';
import 'package:qr_tracker/Features/Labs/widgets/lab_item.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/models/sessions_model.dart';
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
        title: const Texts.regular(
          'Cursos',
          fontSize: 14,
          color: Palette.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getCourses();
        },
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.courses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final course = controller.courses[index];
                    return FutureBuilder<List<SessionsModel>>(
                        future: controller.getSessions(course.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return LabItem(
                              coursesModel: controller.courses[index],
                              sessions: snapshot.data!,
                            );
                          }

                          return const Center(
                            child: LinearProgressIndicator(),
                          );
                        });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
