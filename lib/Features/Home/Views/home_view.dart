import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/circular_loading.dart';
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
}
