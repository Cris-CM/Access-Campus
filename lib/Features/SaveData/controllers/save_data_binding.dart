import 'package:get/get.dart';
import 'package:qr_tracker/Features/SaveData/Controllers/save_data_controller.dart';

class SaveDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaveDataController());
  }
}
