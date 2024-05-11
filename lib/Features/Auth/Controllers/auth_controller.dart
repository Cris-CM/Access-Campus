import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Models/user_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/widgets/util.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  late UserModel user;
  final loading = false.obs;

  Future<void> login() async {
    if (!loginKey.currentState!.validate()) return;

    final data = {
      "Username": usernameController.text,
      "Password": int.tryParse(passwordController.text) ?? 0,
    };

    try {
      loading(true);
      final response = await dio.post("auth/login", data: data);

      if (response.statusCode != 200) {
        throw response.data["data"];
      }

      user = UserModel.fromJson(response.data["data"]);

      Get.toNamed("/home");
    } on DioException catch (e) {
      Util.errorSnackBar(e.response!.data["data"]);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }
}
