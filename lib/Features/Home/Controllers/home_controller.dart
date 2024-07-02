import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/curse_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/statics/const.dart';
import 'package:qr_tracker/core/statics/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  QRViewController? controller;
  Barcode? result;
  final authController = Get.find<AuthController>();
  final loading = false.obs;
  var selectedStartDateTime = Rxn<DateTime>();
  var selectedEndDateTime = Rxn<DateTime>();
  final curseModel = <CurseModel>[].obs;

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
    try {
      loading(true);
      curseModel.clear();
      final sp = await SharedPreferences.getInstance();

      final data = {
        "cPerCodigo": authController.userShort.item.cPerCodigo,
        "nCurCodigo": sp.getString(keyPlan),
        "nPerAluRegCodigo": "0",
        "nPrdCodigo": sp.getString(keyPeriod),
        "nTipCur": int.parse(sp.getString(keyTypePlan) ?? "0")
      };

      dio.options.headers['Authorization'] =
          'Bearer ${authController.bearerTokenModel.accessToken}';

      final response = await dio.post(
        Url.obtenerAsignaturasMatriculadas,
        data: data,
      );

      curseModel.addAll((response.data["lstItem"] as List)
          .map((e) => CurseModel.fromJson(e))
          .toList());
    } finally {
      loading(false);
    }
  }

  void onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    await controller.pauseCamera();

    //if (kDebugMode) {
    //await sendEntry(1);
    //} else {
    await controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      await sendEntry(1);
      if (scanData.format == BarcodeFormat.qrcode &&
          scanData.code!.isNotEmpty) {
        controller.pauseCamera();
        await sendEntry(int.parse(scanData.code ?? "0"));
      }
    });
    //}
  }

  Future<void> sendEntry(int classId) async {
    // try {
    //   loading(true);
    //   final data = {
    //     "UserId": authController.user.id,
    //     "ClassId": classId,
    //   };

    //   final response = await dio.post("entries/register", data: data);

    //   if (response.statusCode != 200) {
    //     throw response.data["data"];
    //   }

    //   await getClasses();
    //   Util.successSnackBar(response.data["data"]);
    // } on DioException catch (e) {
    //   Util.errorSnackBar(e.response!.data["data"]);
    // } catch (e) {
    //   Util.errorSnackBar(e.toString());
    // } finally {
    //   Get.toNamed("/home");
    //   loading(false);
    // }
  }

  Future<void> saveTimeEntryClass(TimeOfDay timeOfDay) async {}
}
