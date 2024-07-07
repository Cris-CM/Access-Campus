import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/models/users_model.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:qr_tracker/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    if (Get.arguments != null) {
      autoLogin();
    }
    super.onInit();
  }

  final usernameController = TextEditingController(text: "profesor");
  final passwordController = TextEditingController(text: "44442222");

  final loading = false.obs;
  final authService = AuthService();
  late UsersModel user;

  Future<void> login() async {
    try {
      loading(true);
      final userSupabase = await authService.login(
        usernameController.text,
        passwordController.text,
      );

      user = await authService.getUser(userSupabase.user!.id);

      Util.successSnackBar("Autenticado correctamente");
      Get.toNamed("/home");
    } on AuthException catch (e) {
      Util.errorSnackBar(e.message);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> autoLogin() async {
    try {
      loading(true);

      user = await authService.getUser(Get.arguments);

      Util.successSnackBar("Autenticado correctamente");
      Get.toNamed("/home");
    } on AuthException catch (e) {
      Util.errorSnackBar(e.message);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }
}
