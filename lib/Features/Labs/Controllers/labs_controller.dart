import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/Features/Home/Models/classes_model.dart';
import 'package:qr_tracker/core/network/dio_config.dart';
import 'package:qr_tracker/core/widgets/util.dart';

class LabsController extends GetxController {
  final classesList = <ClassesModel>[].obs;
  final loading = false.obs;
  final authController = Get.find<AuthController>();

  Future<void> getClasses() async {
    classesList.clear();
    try {
      loading(true);
      final response = await dio.get("classes/${authController.user.id}");

      if (response.statusCode != 200) {
        throw response.data["data"];
      }

      final classes = (response.data["data"] as List)
          .map(
            (e) => ClassesModel.fromJson(e),
          )
          .toList();
      classesList.addAll(classes);
    } on DioException catch (e) {
      Util.errorSnackBar(e.response!.data["data"]);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }
}
