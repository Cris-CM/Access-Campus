import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:qr_tracker/services/home_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final authController = Get.find<AuthController>();
  final loading = false.obs;
  final courses = <CoursesModel>[].obs;
  final homeService = HomeService();
  final user = Supabase.instance.client.auth.currentUser;

  @override
  void onInit() {
    getCourses();
    super.onInit();
  }

  Future<void> getCourses() async {
    try {
      loading(true);
      courses.clear();

      courses.addAll(await homeService.getCourses(authController.user.id));

      Util.successSnackBar("Cursos cargados correctamente");
    } catch (e) {
      Util.errorSnackBar("Error al obtener cursos");
    } finally {
      loading(false);
    }
  }
}
