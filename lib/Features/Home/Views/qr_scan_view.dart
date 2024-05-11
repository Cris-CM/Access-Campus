import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_controller.dart';

class QrScanView extends GetView<HomeController> {
  const QrScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }
}
