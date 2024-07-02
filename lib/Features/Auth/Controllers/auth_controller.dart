import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/models/bearer_token_model.dart';
import 'package:qr_tracker/core/models/user_model.dart';
import 'package:qr_tracker/core/models/user_short_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/statics/const.dart';
import 'package:qr_tracker/core/statics/urls.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    if (Get.arguments != null) {
      login(Get.arguments);
    }
    super.onInit();
  }

  final usernameController = TextEditingController(text: "7002539160");
  final loading = false.obs;
  late UserModel userModel;
  late UserShort userShort;
  late BearerTokenModel bearerTokenModel;

  Future<void> login(String user) async {
    final data = {
      "cPerCodigo": user,
    };
    try {
      loading(true);
      final response = await dio.post(Url.obtenerPersona, data: data);

      if (response.statusCode != 200) {
        throw response.data["data"];
      }

      if (response.data["item"] == null) {
        throw "Usuario invalido";
      }

      userShort = UserShort.fromJson(response.data);

      final responseUser = await dio.post(
        Url.obtenerDatosPersonales,
        data: data,
      );

      userModel = UserModel.fromJson(responseUser.data);

      var sp = await SharedPreferences.getInstance();

      await sp.setString("userKey", user);
      await getBearerToken();

      if (sp.get(keyTypePlan) == null || sp.get(keyPlan) == null) {
        Get.toNamed("/typePlan");
      } else {
        Get.toNamed("/home");
      }
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> getBearerToken() async {
    try {
      final response = await dio.post(Url.obtenerBearerToken);

      bearerTokenModel = BearerTokenModel.fromJson(response.data);
      
    } catch (e) {}
  }
}
