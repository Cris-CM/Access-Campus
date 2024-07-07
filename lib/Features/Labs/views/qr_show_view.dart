import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/custom_button.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:sizer/sizer.dart';

class QrShowView extends StatelessWidget {
  const QrShowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Texts.bold(
          "Qr Generado",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PrettyQrView.data(
              data: Get.arguments,
            ),
          ),
          CustomButton(
            onPressed: () async {
              final qrCode = QrCode.fromData(
                data: Get.arguments,
                errorCorrectLevel: QrErrorCorrectLevel.H,
              );

              final qrImage = QrImage(qrCode);
              final qrImageBytes = await qrImage.toImageAsBytes(
                size: 512,
                format: ImageByteFormat.png,
                decoration: const PrettyQrDecoration(
                  background: Palette.white,
                ),
              );

              if (qrImageBytes == null) return;
              await saveImageToGallery(qrImageBytes);
            },
            text: "Descargar",
          ),
        ],
      ).marginSymmetric(vertical: 4.h, horizontal: 10.w),
    );
  }

  Future<void> requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> saveImageToGallery(ByteData byteData) async {
    // Solicitar permisos
    await requestPermissions();

    // Obtener directorio temporal
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/image.png';

    // Convertir ByteData a Uint8List
    final buffer = byteData.buffer;
    final uint8List =
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    // Guardar archivo temporalmente
    final file = File(imagePath);
    await file.writeAsBytes(uint8List);

    // Guardar imagen en la galería
    final result = await ImageGallerySaver.saveFile(file.path);
    print(result); // Ver el resultado

    // Eliminar archivo temporal
    file.deleteSync();

    Util.successSnackBar("Guardado Correctamente");
  }
}
