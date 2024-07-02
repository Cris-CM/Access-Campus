import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/texts.dart';

class Util {
  static void errorSnackBar(String message, {String title = 'Error'}) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: Texts.bold(
          title.tr,
          color: Palette.kPrimary,
          fontSize: 12,
        ),
        messageText: Texts.regular(
          message,
          color: Palette.kPrimary,
          fontSize: 10,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.redAccent,
        icon: const Icon(
          Icons.remove_circle_outline,
          size: 32,
          color: Palette.kPrimary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        borderRadius: 8,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  static void successSnackBar(String message, {String title = 'Mensaje'}) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: Texts.bold(
          title.tr,
          color: Palette.kPrimary,
          fontSize: 12,
        ),
        messageText: Texts.regular(
          message,
          color: Palette.kPrimary,
          fontSize: 10,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.green,
        icon: const Icon(
          Icons.check,
          size: 32,
          color: Palette.kPrimary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        borderRadius: 8,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  static List<DateTime> parseTime(String dia, String horas) {
    // Paso 1: Limpiar y formatear la fecha
    dia = dia.split(' - ')[1]; // Extraer "03 Abr 2024"

    // Convertir a formato DateTime
    DateFormat inputFormat = DateFormat("dd MMM yyyy", 'es_ES');
    DateTime fecha = inputFormat.parse(dia);

    // Paso 2: Extraer las horas
    List<String> horasPartes = horas.split(' - - ');
    String horaInicio = horasPartes[0].trim();
    String horaFin = horasPartes[1].trim();

    // Paso 3: Combinar fecha y horas
    DateTime dateTimeInicio = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      int.parse(horaInicio.split(':')[0]),
      int.parse(horaInicio.split(':')[1]),
    );

    DateTime dateTimeFin = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      int.parse(horaFin.split(':')[0]),
      int.parse(horaFin.split(':')[1]),
    );

    return [dateTimeInicio, dateTimeFin];
  }
}
