import 'package:get/get.dart';
import 'package:qr_tracker/Features/Sessions/controllers/sessions_controller.dart';

class SessionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SessionsController());
  }
}
