import 'package:get/get.dart';
import 'package:qr_tracker/Features/Curse/Controllers/curse_controller.dart';

class CurseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurseController());
  }
}
