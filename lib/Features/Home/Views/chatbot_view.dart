import 'package:flutter/material.dart';
import 'dart:math';

import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatbotViewState createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  final TextEditingController _controller = TextEditingController();
  List<ChatMessage> messages = [];

  // Patrones y respuestas predefinidas
  final Map<String, List<String>> _responses = {
    'hola': [
      '¡Hola! ¿Cómo puedo ayudarte?',
      'Hola, ¿en qué puedo ayudarte hoy?',
      'Hola, ¿cómo estás? ¿En qué puedo asistirte?'
    ],
    'marcar asistencia': [
      'Para marcar tu asistencia, escanea el código QR proporcionado.',
      'Puedes marcar tu asistencia escaneando el código QR que te fue proporcionado.',
    ],
    'horarios de clases': [
      'Los horarios de clases están disponibles en la sección correspondiente de la aplicación.',
      'Puedes consultar los horarios de clases en la sección correspondiente de la app.',
    ],
    'problemas técnicos': [
      'Si tienes problemas técnicos, por favor contacta al soporte técnico a través de nuestro servicio de atención al cliente.',
      'Para problemas técnicos, te recomiendo contactar al soporte técnico.',
    ],
    'registro': [
      'Para registrarte, ve a la sección de registro en la aplicación y sigue los pasos indicados.',
      'Puedes registrarte siguiendo las instrucciones en la sección de registro de la app.',
      'Si deseas registrarte, dirígete a la sección de registro en la app y sigue las indicaciones.',
    ],
    'ayuda': [
      'Estoy aquí para ayudarte. ¿Qué necesitas?',
      '¿Cómo puedo asistirte hoy?',
    ],
    'gracias': [
      '¡De nada! Estoy aquí para ayudarte en lo que necesites.',
      '¡No hay de qué! Si tienes más preguntas, no dudes en preguntar.',
    ],
    'adiós': [
      '¡Adiós! Que tengas un buen día.',
      '¡Hasta luego!',
      '¡Nos vemos!',
    ],
    'ok': [
      'Entendido.',
      'Perfecto.',
      'De acuerdo.',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.kPrimary,
        iconTheme: IconThemeData(
          color: Palette.white,
          size: 3.h,
        ),
        title: const Texts.bold(
          "ChatBot",
          fontSize: 12,
          color: Palette.white,
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (_, index) => messages[index],
              reverse: true,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Palette.black),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje',
                ),
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                ),
                onPressed: () {
                  _handleSubmitted(_controller.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _controller.clear();
    ChatMessage message = ChatMessage(text: text, sender: 'user');
    setState(() {
      messages.insert(0, message); // Insertar mensaje del usuario al principio
    });

    // Enviar mensaje al bot y obtener respuesta
    String reply = getReply(text);
    ChatMessage botReply = ChatMessage(text: reply, sender: 'bot');
    setState(() {
      messages.insert(0, botReply); // Insertar respuesta del bot al principio
    });
  }

  String getReply(String question) {
    // Convertir la pregunta a minúsculas para comparaciones sin distinción entre mayúsculas y minúsculas
    String lowercaseQuestion = question.toLowerCase().trim();

    // Buscar la respuesta basada en los patrones predefinidos
    for (var pattern in _responses.keys) {
      if (lowercaseQuestion.contains(pattern)) {
        List<String> responses = _responses[pattern]!;
        return responses[Random().nextInt(responses.length)];
      }
    }

    // Si la pregunta contiene la palabra "asistencia", dar una respuesta específica
    if (lowercaseQuestion.contains('asistencia')) {
      return 'Para marcar tu asistencia, escanea el código QR proporcionado.';
    }

    // Si la pregunta contiene la palabra "qr" y "quién" o "docente", responder sobre quién proporciona y activa el QR
    if (lowercaseQuestion.contains('qr') &&
        (lowercaseQuestion.contains('quién') ||
            lowercaseQuestion.contains('docente'))) {
      return 'El docente encargado será quien proporcionará y activará el código QR.';
    }

    // Si la pregunta contiene la palabra "registro", responder sobre cómo registrarse
    if (lowercaseQuestion.contains('registro')) {
      return 'Para registrarte, dirígete a la sección de registro en la aplicación y sigue las instrucciones.';
    }

    // Si la pregunta contiene la palabra "pasos", responder sobre cómo proceder
    if (lowercaseQuestion.contains('pasos')) {
      return 'Para marcar tu asistencia, presiona el botón de escaneo en la app y escanea el código QR que el docente activará y mostrará.';
    }

    // Si la pregunta contiene la palabra "escanear" y "qr", explicar cómo escanear el QR
    if (lowercaseQuestion.contains('escanear') &&
        lowercaseQuestion.contains('qr')) {
      return 'Para escanear el código QR, abre la app y presiona el botón de escaneo. Apunta tu dispositivo al código QR que el docente activará y mostrará.';
    }

    // Respuestas para despedida
    if (lowercaseQuestion.contains('adiós') ||
        lowercaseQuestion.contains('hasta luego') ||
        lowercaseQuestion.contains('nos vemos')) {
      return '¡Adiós! Que tengas un buen día.';
    }

    // Respuestas para agradecimiento
    if (lowercaseQuestion.contains('gracias') ||
        lowercaseQuestion.contains('thank you') ||
        lowercaseQuestion.contains('tenkiu')) {
      return '¡De nada! Estoy aquí para ayudarte en lo que necesites.';
    }

    // Respuestas genéricas para confirmación o aceptación
    if (lowercaseQuestion.contains('ok') ||
        lowercaseQuestion.contains('de acuerdo')) {
      return 'Entendido.';
    }

    // Si no se encuentra una respuesta específica, devolver respuesta genérica
    return 'Lo siento, no entendí la pregunta. ¿Podrías ser más específico?';
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;

  const ChatMessage({super.key, required this.text, required this.sender});

  @override
  Widget build(BuildContext context) {
    final isUser = sender == 'user';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) // Si no es el usuario, mostrar avatar del bot
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: const CircleAvatar(child: Text('Bot')),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isUser ? Palette.grey400 : Palette.grey200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Texts.regular(
                text,
                fontSize: 8,
                style: TextStyle(
                  color: isUser ? Palette.white : Palette.blue,
                ),
              ),
            ),
          ),
          if (isUser) // Si es el usuario, mostrar avatar del usuario
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('assets/pikachu.png'),
              ),
            ),
        ],
      ),
    );
  }
}
