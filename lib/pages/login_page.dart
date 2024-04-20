import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/pages/home_page.dart';
import 'package:qr_tracker/widgets/textos/list_text.dart';
import 'package:qr_tracker/widgets/text_password.dart';
import 'package:qr_tracker/widgets/text_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/736x/ea/15/d4/ea15d4427130f9c393178da386e3f149.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Palette.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const ListText(
                            text: 'Bienvenido a',
                            color: Palette.blueBlack,
                            fontSize: 17,
                          ),
                          subtitle: const ListText(
                            text: 'Trilce UCV',
                            color: Palette.blueBlack,
                          ),
                          trailing:
                              Image.asset('assets/pikachu.png', width: 90),
                        ),
                        const SizedBox(height: 10),
                        const TextUser(),
                        const SizedBox(height: 15),
                        const TextPassword(),
                        Text(
                          'Recordar contraseña',
                          style: TextStyle(
                            color: Palette.grey,
                            fontSize: 18,
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Palette.blue900,
                                ),
                                child: const Text(
                                  'Iniciar Sesion',
                                  style: TextStyle(
                                      color: Palette.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Olvidaste la contraseña',
                                  style: TextStyle(
                                    color: Palette.blueBlack,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
