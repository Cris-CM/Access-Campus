import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';

class HistoryController extends GetxController {
  final loading = true.obs;
  final authController = Get.find<AuthController>();

  Future<void> sendEntry(String courseName, int index) async {
    //   try {
    //     loading(true);

    //     final session = sessions[index];

    //  final list =   await entriesService.sendEntry(
    //       session.id,
    //       authController.user.id,
    //     );
    //     Util.successSnackBar("Asistencia registrada correctamente");
    //   } on DioException catch (e) {
    //     Util.errorSnackBar(e.response!.data["data"]);
    //   } catch (e) {
    //     Util.errorSnackBar(e.toString());
    //   } finally {
    //     await getSessions();
    //     Get.offNamed("/home");
    //     loading(false);
    //   }
  }
}
