import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
