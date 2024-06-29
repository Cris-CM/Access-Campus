import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/circular_loading.dart';
import 'package:qr_tracker/core/widgets/custom_button.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/Features/Home/Widgets/courses_item.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: Drawer(
          backgroundColor: Palette.kPrimary,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                  color: Palette.kPrimary,
                  child: ListTile(
                    title: Texts.bold(
                      "Bienvenido,\n${controller.authController.userModel.lstItem.first.cPerNombre}",
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
                        if (controller.authController.userModel.isTeacher())
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
                        ListTile(
                          onTap: () {
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
          'Hola, ${controller.authController.userModel.lstItem.first.cPerNombre}',
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
            await controller.getClasses();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () => _selectDateTime(context),
                    text: 'Selecione Fecha y Hora',
                  ).marginOnly(right: 17.w),
                  Obx(
                    () {
                      final selectedStartDateTime =
                          controller.selectedStartDateTime.value;
                      final selectedEndDateTime =
                          controller.selectedEndDateTime.value;
                      return selectedStartDateTime != null &&
                              selectedEndDateTime != null
                          ? Texts.regular(
                              "Dia: ${selectedStartDateTime.day}/${selectedStartDateTime.month}/${selectedStartDateTime.year}\nInicia: ${selectedStartDateTime.hour}:${selectedStartDateTime.minute}\nTermina: ${selectedEndDateTime.hour}:${selectedEndDateTime.minute}",
                              color: Palette.black,
                            )
                          : Container();
                    },
                  ),
                ],
              ).marginOnly(top: 2.h, bottom: 1.h),
              const Texts.bold(
                "LABORATORIOS:",
                fontSize: 15,
                color: Palette.kPrimary,
              ).marginAll(4.w),
              Expanded(
                child: ListView.separated(
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
                    return CoursesItem(
                      classes: controller.classesList[index],
                      isUser: controller.authController.userModel.isUser(),
                      onPressed: () {
                        if (controller.authController.userModel.isUser()) {
                          Get.toNamed("/qrscan");
                        } else {
                          Get.defaultDialog(
                            title: "Editar Laboratorio",
                            content: Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime:
                                          TimeOfDay(hour: 0, minute: 0),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 4.h,
                                    child:
                                        Texts.bold(DateTime.now().toString()),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
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
      controller.selectedStartDateTime.value = selectedStartDateTime;
      controller.selectedEndDateTime.value = selectedEndDateTime;
      print(
        "Laboratorio empieza el ${selectedStartDateTime.day}/${selectedStartDateTime.month}/${selectedStartDateTime.year} a las ${selectedStartDateTime.hour}:${selectedStartDateTime.minute} - Termina a las ${selectedEndDateTime.hour}:${selectedEndDateTime.minute}",
      );
    }
  }
}
