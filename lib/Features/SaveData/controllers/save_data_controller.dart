import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/period_model.dart';
import 'package:qr_tracker/core/models/plan_model.dart';
import 'package:qr_tracker/core/models/type_plan_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/statics/const.dart';
import 'package:qr_tracker/core/statics/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataController extends GetxController {
  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) async {
      if (value.get(keyTypePlan) == null ||
          value.get(keyPlan) == null ||
          value.get(keyPeriod) == null) {
        await getTypePlan();
        if (Get.currentRoute != "/typePlan") {
          Get.offNamed("/typePlan");
        }
      } else {
        Get.offNamed("/home");
      }
    });
    super.onInit();
  }

  final authController = Get.find<AuthController>();
  final typePlanModel = <TypePlanModel>[].obs;
  final planModel = <PlanModel>[].obs;
  final periodModel = <PeriodModel>[].obs;
  final typePlanSelected = "".obs;

  final planSelected = "".obs;
  final periodSelected = "".obs;

  final loading = true.obs;

  Future<void> getTypePlan() async {
    try {
      loading(true);
      typePlanModel.clear();
      planModel.clear();
      periodModel.clear();

      final data = {
        "cPerCodigo": authController.userShort.item.cPerCodigo,
      };

      dio.options.headers['Authorization'] =
          'Bearer ${authController.bearerTokenModel.accessToken}';

      final response = await dio.post(
        Url.obtenerTipoMatricula,
        data: data,
      );

      typePlanModel.addAll(
        (response.data["lstItem"] as List)
            .map((e) => TypePlanModel.fromJson(e))
            .toList(),
      );
    } finally {
      loading(false);
      typePlanSelected("");
    }
  }

  Future<void> getPlan(String typePlan) async {
    try {
      loading(true);
      planModel.clear();
      periodModel.clear();

      final data = {
        "cPerCodigo": authController.userShort.item.cPerCodigo,
        "nTipCur": typePlan,
      };

      dio.options.headers['Authorization'] =
          'Bearer ${authController.bearerTokenModel.accessToken}';

      final response = await dio.post(
        Url.obtenerPlanDeEstudio,
        data: data,
      );

      planModel.addAll((response.data["lstItem"] as List)
          .map((e) => PlanModel.fromJson(e))
          .toList());
    } finally {
      loading(false);
      planSelected("");
    }
  }

  Future<void> getPeriods(String plan) async {
    try {
      loading(true);
      periodModel.clear();

      final data = {
        "cPerCodigo": authController.userShort.item.cPerCodigo,
        "nCurCodigo": plan,
        "nDocPerTipo": 1,
        "nPrdActual": "",
        "bReserva": 0,
        "nMotivoResMat": 0
      };

      dio.options.headers['Authorization'] =
          'Bearer ${authController.bearerTokenModel.accessToken}';

      final response = await dio.post(
        Url.obtenerPeriodosEstudiados,
        data: data,
      );

      periodModel.addAll((response.data["lstItem"] as List)
          .map((e) => PeriodModel.fromJson(e))
          .toList());
    } finally {
      loading(false);
      periodSelected("");
    }
  }

  Future<void> saveData(String key, value) async {
    final sp = await SharedPreferences.getInstance();

    await sp.setString(key, value);
  }
}
