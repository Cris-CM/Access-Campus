import 'package:get/get.dart';
import 'package:qr_tracker/Features/Labs/Controllers/labs_controller.dart';

class LabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabsController>(() => LabsController());
  }
}
