import 'package:firebase_messaging/firebase_messaging.dart';
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
    final RemoteMessage? message =
        ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

    if (message != null) {
      // Manejar datos de la notificación si es necesario
      print(
          "Datos de la notificación: ${message.notification?.title}, ${message.notification?.body}");
    }
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
                      "Bienvenido, ${controller.authController.user.name}",
                      color: Palette.white,
                      fontSize: 13,
                    ),
                    leading: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/pikachu.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Palette.white,
                    child: ListView(
                      children: [
                        if (controller.authController.isTeacher())
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Texts.regular(
              'Hola, ${controller.authController.user.name}',
              fontSize: 14,
              color: Palette.white,
            ),
            IconButton(
              onPressed: () {
                Get.toNamed('chatbot');
              },
              icon: Icon(
                Icons.message,
                color: Palette.white,
                size: 7.w,
              ),
            ),
          ],
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
                      onPressed: () {
                        Get.toNamed("/qrscan");
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
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
