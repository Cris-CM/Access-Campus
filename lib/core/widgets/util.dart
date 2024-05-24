import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
}
