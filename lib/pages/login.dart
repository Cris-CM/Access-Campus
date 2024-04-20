import 'package:flutter/material.dart';
import 'package:qr_tracker/pages/inicio.dart';
import 'package:qr_tracker/widgets/textos/list_text.dart';
import 'package:qr_tracker/widgets/text_password.dart';
import 'package:qr_tracker/widgets/text_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                color: Colors.white,
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
                          title: ListText(
                            text: 'Bienvenido a',
                            color: Colors.blue.shade900,
                            fontSize: 17,
                          ),
                          subtitle: ListText(
                            text: 'Trilce UCV',
                            color: Colors.indigo.shade900,
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
                            color: Colors.grey.shade600,
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
                                      builder: (context) => const Inicio(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo.shade900,
                                ),
                                child: const Text(
                                  'Iniciar Sesion',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Olvidaste la contraseña',
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade900,
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
