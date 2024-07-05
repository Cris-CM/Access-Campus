import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
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

  static Future<List<DateTime>> parseTime(
      String dateString, String timeString) async {
    // Paso 1: Limpiar y formatear la fecha
    await initializeDateFormatting('es_ES', null);
    Map<String, String> meses = {
      "Ene": "01",
      "Feb": "02",
      "Mar": "03",
      "Abr": "04",
      "May": "05",
      "Jun": "06",
      "Jul": "07",
      "Ago": "08",
      "Sep": "09",
      "Oct": "10",
      "Nov": "11",
      "Dic": "12",
    };

    // Convertir a formato DateTime
    DateFormat dateFormat = DateFormat.yMd('es_ES');
    DateFormat timeFormat = DateFormat('HH:mm');
    final year = dateString.split("-").last;

    final textoNew =
        meses.keys.fold(year, (acc, key) => acc.replaceAll(key, meses[key]!));

    final dateYear = textoNew.trim().replaceAll(" ", "/");
    DateTime date = dateFormat.parse(dateYear);

    // Parseamos las horas de inicio y fin
    List<String> times = timeString.split(' - - ');
    DateTime startTime = timeFormat.parse(times[0]);
    DateTime endTime = timeFormat.parse(times[1]);

    // Combinamos la fecha con las horas
    DateTime startDateTime = DateTime(
        date.year, date.month, date.day, startTime.hour, startTime.minute);
    DateTime endDateTime =
        DateTime(date.year, date.month, date.day, endTime.hour, endTime.minute);

    return [startDateTime, endDateTime];
  }
}
