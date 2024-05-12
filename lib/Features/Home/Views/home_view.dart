import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_controller.dart';
import 'package:qr_tracker/Features/Home/Views/qr_scan_view.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/circular_loading.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/Features/Home/Widgets/courses_item.dart';
import 'package:qr_tracker/widgets/textfields/text/list_text.dart';
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
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 70),
                  color: const Color(0xFF243659),
                  child: const ListTile(
                    title: ListText(
                      text: 'Hola, Cris',
                      color: Palette.white,
                      fontbold: true,
                      fontSize: 20,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListText(
                          text: 'Carrera',
                          fontbold: true,
                          color: Palette.red,
                          fontSize: 20,
                        ),
                        ListText(
                          text: 'INGENIERIA DE\nSISTEMAS',
                          color: Palette.white,
                          fontSize: 20,
                          fontbold: true,
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/pikachu.png'),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 150, left: 90, bottom: 150),
                  color: Palette.white,
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
        title: const Text(
          'Hola, Cris',
          style: TextStyle(
            color: Palette.white,
          ),
        ),
        centerTitle: true,
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
