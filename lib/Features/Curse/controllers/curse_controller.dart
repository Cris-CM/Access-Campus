import 'dart:developer';

import 'package:get/get.dart';
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

  final hourCurseModel = <HourCurseModel>[].obs;
  final authController = Get.find<AuthController>();
  final loading = true.obs;

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
        final dates = Util.parseTime(element.dias, element.horas);

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
}
