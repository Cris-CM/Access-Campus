import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_tracker/Features/Curse/Controllers/curse_controller.dart';
import 'package:qr_tracker/core/models/hour_curse_model.dart';

class QrScanView extends GetView<CurseController> {
  const QrScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: (a) =>
                  controller.onQRViewCreated(a, Get.arguments),
            ),
          ),
        ],
      ),
    );
  }
}
