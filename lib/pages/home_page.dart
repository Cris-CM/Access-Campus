import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/widgets/textfields/cursDay/cours.dart';
import 'package:qr_tracker/widgets/textfields/cursDay/courses_day.dart';
import 'package:qr_tracker/widgets/textfields/text/list_text.dart';
import 'package:qr_tracker/widgets/textfields/text/text_calendari.dart';
import 'package:qr_tracker/widgets/textfields/text/text_drawer.dart';
import 'package:qr_tracker/widgets/textfields/text_icon/icon_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.white,
        unselectedItemColor: Palette.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedFontSize: 20,
        iconSize: 30,
        backgroundColor: Palette.blueBlack,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Palette.white,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Inicio',
          ),
        ],
      ),
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
                      text: 'Hola, LALO',
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
                  child: const Column(
                    children: [
                      TextDrawer(
                          text: 'Movilidad academica',
                          icon: Icons.library_books),
                      SizedBox(
                        height: 20,
                      ),
                      TextDrawer(
                        text: 'Noticias UCV',
                        icon: Icons.article,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextDrawer(
                        text: 'Eventos UCV',
                        icon: Icons.calendar_month,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextDrawer(
                        text: 'Libro de reclamaciones',
                        icon: Icons.menu_book,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextDrawer(
                        text: 'Tour Virtual  campus UCV',
                        icon: Icons.location_on,
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/ucv.png')
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Palette.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Hola, Cris'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Palette.blueBlack,
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListText(
                        text: 'Mi Horario',
                        color: Palette.white,
                        fontbold: true,
                        fontSize: 20,
                      ),
                      ListText(
                        text: 'Hoy',
                        color: Palette.white70,
                        fontSize: 20,
                      ),
                      ListText(
                        text: 'Abril 2024',
                        color: Palette.white,
                        fontSize: 20,
                        fontbold: true,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 7,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 20);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const TextCalendari();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                color: Palette.grey600,
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListText(
                    text: 'No tienes clases Programadas',
                    fontSize: 20,
                    color: Palette.white,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconText(
                    texto: 'Mapa del\n Campus',
                    icono: Icons.location_on,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconText(
                    texto: '   Citas\nmèdicas',
                    icono: Icons.local_hospital,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconText(
                    texto: '      Mis\nBeneficios',
                    icono: Icons.emoji_objects,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Palette.blueBlack,
              thickness: 1,
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  CoursesDay(),
                  Courses(text: 'INGENIERÍA DE SOFTWARE'),
                  SizedBox(
                    height: 20,
                  ),
                  Courses(text: 'GESTION DE DATOS II'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
