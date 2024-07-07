import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/models/sessions_model.dart';
import 'package:qr_tracker/core/widgets/custom_button.dart';
import 'package:qr_tracker/core/widgets/custom_input.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:qr_tracker/services/sessions_service.dart';
import 'package:sizer/sizer.dart';

class LabsController extends GetxController {
  @override
  void onInit() async {
    await initializeDateFormatting("es_MX");
    getCourses();
    super.onInit();
  }

  final homeController = Get.find<HomeController>();
  final sessionsService = SessionsService();
  final authController = Get.find<AuthController>();
  final loading = true.obs;
  final courses = <CoursesModel>[].obs;
  late Rx<SessionsModel> sessionsModel;

  Future<List<SessionsModel>> getSessions(int courseId) async {
    try {
      return await sessionsService.getSessions(courseId);
    } catch (e) {
      Util.errorSnackBar(e.toString());
      return [];
    } finally {}
  }

  Future<void> asingUserToCourse(int courseId, int userId) async {
    try {
      await sessionsService.asingUserToCourse(courseId, userId);
      Get.back();
      Util.successSnackBar("Asignado correctamente");
    } catch (e) {
      Get.back();
      Util.errorSnackBar(e.toString());
    }
  }

  dialogAssingUser(int courseId) async {
    final users = await sessionsService.getUsers();

    Get.defaultDialog(
        barrierDismissible: false,
        title: "Seleccione el usuario para asignar",
        titleStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
        titlePadding: EdgeInsets.only(top: 3.h),
        textCancel: "Cancelar",
        content: SizedBox(
          width: 90.w,
          height: 60.h,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: Palette.blue900,
              );
            },
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                onTap: () async {
                  await asingUserToCourse(courseId, user.id);
                },
                title: Texts.regular(
                  user.name,
                  fontSize: 12,
                ),
              );
            },
          ),
        ));
  }

  Future<void> getCourses() async {
    try {
      loading(true);
      courses.clear();

      courses.addAll(
        await homeController.homeService.getCourses(authController.user.id),
      );

      Util.successSnackBar("Cursos cargados correctamente");
    } catch (e) {
      Util.errorSnackBar("Error al obtener cursos");
    } finally {
      loading(false);
    }
  }

  Future<void> updateSession() async {
    try {
      await sessionsService.updateSession(sessionsModel());

      Util.successSnackBar("Actualizado correctamente");

      await getCourses();
    } catch (e) {
      Util.errorSnackBar(e.toString());
    }
  }

  dialogUpdateHour(SessionsModel session) async {
    sessionsModel = session.obs;
    final extraController = TextEditingController(
      text: sessionsModel().minutesExtra.toString(),
    );
    final keyForm = GlobalKey<FormState>();
    Get.defaultDialog(
      barrierDismissible: false,
      title: "Modifique la sesión",
      titleStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.only(top: 3.h),
      textCancel: "Cancelar",
      content: Builder(builder: (context) {
        return Obx(() {
          return Form(
            key: keyForm,
            child: Column(
              children: [
                Row(
                  children: [
                    const Texts.bold(
                      "INICIO:",
                      fontSize: 12,
                    ).marginOnly(right: 3.w),
                    Expanded(
                      child: CustomButton(
                        onPressed: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(sessionsModel().entry),
                          );

                          if (time == null) return;

                          sessionsModel(
                            sessionsModel().copyWith(
                              entry: Util.updateDateTimeToTimeofDay(
                                  sessionsModel().entry, time),
                            ),
                          );
                        },
                        text:
                            "${sessionsModel().entry.hour}:${sessionsModel().entry.minute}",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Texts.bold(
                      "FIN:      ",
                      fontSize: 12,
                    ).marginOnly(right: 3.w),
                    Expanded(
                      child: CustomButton(
                        onPressed: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(sessionsModel().exit),
                          );

                          if (time == null) return;

                          sessionsModel(
                            sessionsModel().copyWith(
                              exit: Util.updateDateTimeToTimeofDay(
                                  sessionsModel().exit, time),
                            ),
                          );
                        },
                        text:
                            "${sessionsModel().exit.hour}:${sessionsModel().exit.minute}",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Texts.bold(
                      "EXTRA:",
                      fontSize: 12,
                    ).marginOnly(right: 3.w),
                    Expanded(
                      child: CustomInput(
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Rellene el campo";
                          }

                          if (!p0.isNum) {
                            return "Ingrese un numero valido";
                          }
                          return null;
                        },
                        controller: extraController,
                        title: "Extra",
                        icon: Icons.timelapse,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () async {
                    if (!keyForm.currentState!.validate()) return;

                    sessionsModel(
                      sessionsModel().copyWith(
                          minutesExtra: int.parse(extraController.text)),
                    );

                    Get.back();

                    await updateSession();
                  },
                  text: "Guardar",
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}
