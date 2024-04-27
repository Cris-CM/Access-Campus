import 'package:easy_padding/easy_padding.dart';
import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/widgets/textfields/cursDay/cours.dart';
import 'package:qr_tracker/widgets/textfields/cursDay/courses_day.dart';
import 'package:qr_tracker/widgets/textfields/text/list_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: Drawer(
          backgroundColor: Palette.blueBlack,
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
        backgroundColor: Palette.blueBlack,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const CoursesDay().only(bottom: 10),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Courses(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
