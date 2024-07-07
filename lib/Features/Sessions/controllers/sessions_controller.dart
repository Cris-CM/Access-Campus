import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/models/sessions_model.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:qr_tracker/services/entries_service.dart';
import 'package:qr_tracker/services/sessions_service.dart';

class SessionsController extends GetxController {
  late CoursesModel coursesModel;
  final sessionsService = SessionsService();
  final entriesService = EntriesService();
  final authController = Get.find<AuthController>();
  final loading = true.obs;
  final sessions = <SessionsModel>[].obs;
  @override
  void onInit() async {
    await initializeDateFormatting("es_MX");

    coursesModel = Get.arguments;
    getSessions();
    super.onInit();
  }

  Future<void> getSessions() async {
    try {
      loading(true);
      sessions.clear();
      final list = await sessionsService.getSessions(coursesModel.id);
      list.sort((a, b) => a.entry.compareTo(b.entry));

      sessions.addAll(list);
      Util.successSnackBar("Sesiones cargadas correctamente");
    } on DioException catch (e) {
      Util.errorSnackBar(e.response!.data["data"]);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> sendEntry(String courseName, int index) async {
    try {
      loading(true);

      final session = sessions[index];

      if (DateTime.now().isBefore(session.entry)) {
        Util.errorSnackBar("El laboratorio aun no inicia");
        return;
      }

      if (DateTime.now().isAfter(session.exit)) {
        Util.errorSnackBar("El laboratorio ya termino");
        return;
      }

      await entriesService.sendEntry(
        session.id,
        authController.user.id,
      );
      Util.successSnackBar("Asistencia registrada correctamente");
    } on DioException catch (e) {
      Util.errorSnackBar(e.response!.data["data"]);
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      await getSessions();
      Get.offNamed("/home");
      loading(false);
    }
  }
}
