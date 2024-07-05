import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/curse_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/statics/const.dart';
import 'package:qr_tracker/core/statics/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
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
}
