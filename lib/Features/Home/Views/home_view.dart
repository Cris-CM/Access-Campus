import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/circular_loading.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/Features/Home/Widgets/courses_item.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: SizedBox(
          width: 80.w,
          child: Drawer(
            backgroundColor: Palette.kPrimary,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                    color: Palette.kPrimary,
                    child: ListTile(
                      title: Texts.bold(
                        "Bienvenido, ${controller.authController.user.name}",
                        color: Palette.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Palette.white,
                      child: ListView(
                        children: [
                          if (controller.authController.user.isTeacher)
                            ListTile(
                              onTap: () {
                                Get.toNamed("/labs");
                              },
                              title: const Texts.bold(
                                "Laboratorios",
                                color: Palette.kPrimary,
                              ),
                              leading: const Icon(Icons.add_box),
                            ),
                          if (controller.authController.user.isTeacher)
                            ListTile(
                              onTap: () {
                                Get.toNamed("/history");
                              },
                              title: const Texts.bold(
                                "Historial",
                                color: Palette.kPrimary,
                              ),
                              leading: const Icon(Icons.history),
                            ),
                          ListTile(
                            onTap: () async {
                              await Supabase.instance.client.auth.signOut();
                              Get.toNamed("/login");
                            },
                            title: const Texts.bold(
                              "Cerrar Sesion",
                              color: Palette.kPrimary,
                            ),
                            leading: const Icon(Icons.logout),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/ucv.png')
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Palette.kPrimary,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                color: Palette.white,
                iconSize: 30,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Texts.regular(
            'Hola, ${controller.authController.user.name} ',
            fontSize: 14,
            color: Palette.white,
          ),
        ),
        body: Obx(() {
          if (controller.loading()) {
            return const CircularLoadingWidget();
          }

          return RefreshIndicator(
            onRefresh: () async {
              await controller.getCourses();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Texts.bold(
                  "CURSOS:",
                  fontSize: 15,
                  color: Palette.kPrimary,
                ).marginAll(4.w),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.courses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CoursesItem(
                        classes: controller.courses[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
        floatingActionButton: SizedBox(
          width: 13.w,
          height: 7.h,
          child: ClipOval(
            child: FloatingActionButton(
              backgroundColor: Palette.blue,
              elevation: 0,
              onPressed: () {
                Get.toNamed('chatbot');
              },
              child: const Icon(
                Icons.chat,
                size: 40.0,
                color: Palette.white,
              ),
            ),
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }

  Future _selectDateTime(BuildContext context) async {
    DateTime? selectedDate;
    TimeOfDay? selectedStartTime;
    TimeOfDay? selectedEndTime;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  Palette.kPrimary, // Color primario para botones y selección
              onPrimary:
                  Colors.white, // Color del texto en el botón de selección
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme
                  .primary, // Establecer el texto en color primario
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;

      final TimeOfDay? pickedStartTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary:
                    Palette.kPrimary, // Color primario para botones y selección
                onPrimary:
                    Colors.white, // Color del texto en el botón de selección
              ),
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme
                    .primary, // Establecer el texto en color primario
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedStartTime != null) {
        selectedStartTime = pickedStartTime;

        final TimeOfDay? pickedEndTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Palette
                      .kPrimary, // Color primario para botones y selección
                  onPrimary:
                      Palette.white, // Color del texto en el botón de selección
                ),
                buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme
                      .primary, // Establecer el texto en color primario
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedEndTime != null) {
          selectedEndTime = pickedEndTime;
        }
      }
    }

    if (selectedDate != null &&
        selectedStartTime != null &&
        selectedEndTime != null) {
      final selectedStartDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedStartTime.hour,
        selectedStartTime.minute,
      );

      final selectedEndDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedEndTime.hour,
        selectedEndTime.minute,
      );

      // Actualizar el valor en el controlador y mostrar en la consola

      print(
        "Laboratorio empieza el ${selectedStartDateTime.day}/${selectedStartDateTime.month}/${selectedStartDateTime.year} a las ${selectedStartDateTime.hour}:${selectedStartDateTime.minute} - Termina a las ${selectedEndDateTime.hour}:${selectedEndDateTime.minute}",
      );
    }
  }
}
