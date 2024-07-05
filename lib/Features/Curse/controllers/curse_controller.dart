import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/hour_curse_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/statics/urls.dart';
import 'package:qr_tracker/core/widgets/util.dart';

class CurseController extends GetxController {
  @override
  void onInit() {
    getHourCurses(Get.arguments);
    super.onInit();
  }

  @override
  void dispose() {
    qrViewController!.dispose();
    super.dispose();
  }

  final hourCurseModel = <HourCurseModel>[].obs;
  final hourSaved = <HourCurseModel>[].obs;
  final authController = Get.find<AuthController>();
  final loading = true.obs;
  QRViewController? qrViewController;
  Barcode? result;

  Future<void> getHourCurses(String curse) async {
    try {
      loading(true);

      hourCurseModel.clear();
      final data = {
        "nCurGruCodigo": curse,
        "cPerCodigo": authController.userShort.item.cPerCodigo,
      };

      dio.options.headers['Authorization'] =
          'Bearer ${authController.bearerTokenModel.accessToken}';

      final response = await dio.post(
        Url.obtenerHorarioAsignatura,
        data: data,
      );

      final model = (response.data["lstItem"] as List)
          .map((e) => HourCurseModel.fromJson(e))
          .toList();

      for (var element in model) {
        final dates = await Util.parseTime(element.dias, element.horas);

        if (dates.first.isAfter(DateTime.now())) {
          if (element.tipoHora == 2) {
            hourCurseModel.add(element);
          }
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      await authController.getBearerToken();
      loading(false);
    }
  }

  void onQRViewCreated(
      QRViewController controller, HourCurseModel hourCurseModel) async {
    qrViewController = controller;
    await controller.pauseCamera();
    await controller.resumeCamera();
   // if (kDebugMode) {
      controller.pauseCamera();

      Get.back(result: hourCurseModel);
      return;
    //}
    controller.scannedDataStream.listen((scanData) async {
      
      if (scanData.format == BarcodeFormat.qrcode &&
          scanData.code!.isNotEmpty) {
        controller.pauseCamera();
        Get.back(result: hourCurseModel);
      }
    });
  }

  Future<void> sendEntry(int classId) async {
    try {
      loading(true);
      final data = {
        // "UserId": authController.user.id,
        "ClassId": classId,
      };

      final response = await dio.post("entries/register", data: data);

      if (response.statusCode != 200) {
        throw response.data["data"];
      }

      // await getClasses();
      Util.successSnackBar(response.data["data"]);
    } on DioException catch (e) {
      Util.errorSnackBar(e.response!.data["data"]);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      Get.toNamed("/home");
      loading(false);
    }
  }
}
