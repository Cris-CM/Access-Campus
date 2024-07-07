import 'package:get/get.dart';
import 'package:qr_tracker/Features/History/controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
