import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/Features/Home/Models/classes_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/widgets/util.dart';

class HomeController extends GetxController {
  QRViewController? controller;
  Barcode? result;
  final authController = Get.find<AuthController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final loading = false.obs;
  final classesList = <ClassesModel>[].obs;

  @override
  void onInit() {
    getClasses();
    super.onInit();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Future<void> getClasses() async {
    classesList.clear();
    try {
      loading(true);
      final response = await dio.get("classes/${authController.user.id}");

      if (response.statusCode != 200) {
        throw response.data["data"];
      }

      final classes = (response.data["data"] as List)
          .map(
            (e) => ClassesModel.fromJson(e),
          )
          .toList();
      classesList.addAll(classes);
    } on DioException catch (e) {
      Util.errorSnackBar(e.response!.data["data"]);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.pauseCamera(); 
    controller.resumeCamera();
    
    controller.scannedDataStream.listen((scanData) {
      navigateToNextScreen("13");
      if (scanData.format == BarcodeFormat.qrcode &&
          scanData.code!.isNotEmpty) {
        controller.pauseCamera();
        navigateToNextScreen(scanData.code.toString());
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void navigateToNextScreen(String qrData) {
    Get.back(result: qrData);
  }
}
