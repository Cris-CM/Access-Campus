import 'package:dio/dio.dart';
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
  final loading = false.obs;
  final classesList = <ClassesModel>[].obs;
  var selectedStartDateTime = Rxn<DateTime>();
  var selectedEndDateTime = Rxn<DateTime>();

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
    try {
      loading(true);
      final data = {
        "UserId": authController.user.id,
        "ClassId": classId,
      };

      final response = await dio.post("entries/register", data: data);

      if (response.statusCode != 200) {
        throw response.data["data"];
      }

      await getClasses();
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
