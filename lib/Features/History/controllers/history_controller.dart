import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/models/history_model.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:qr_tracker/services/auth_service.dart';
import 'package:qr_tracker/services/course_service.dart';
import 'package:qr_tracker/services/entries_service.dart';
import 'package:qr_tracker/services/sessions_service.dart';

class HistoryController extends GetxController {
  @override
  void onInit() async {
    await initializeDateFormatting("es_MX");
    getHistory();
    super.onInit();
  }

  final loading = true.obs;
  final authController = Get.find<AuthController>();
  final historyModel = <HistoryModel>[].obs;
  final entriesService = EntriesService();
  final sessionService = SessionsService();
  final courseService = CourseService();
  final authService = AuthService();

  Future<void> getHistory() async {
    try {
      loading(true);
      historyModel.clear();
      final nList = <HistoryModel>[];
      final list = await entriesService.getEntries();

      for (var element in list) {
        final session = await sessionService.getSession(element.sessionId);

        nList.add(
          HistoryModel(
            usersModel: await authService.getUserByID(element.userId),
            sessionsModel: session,
            coursesModel: await courseService.getCourse(session.courseId),
            entry: element.entry,
          ),
        );
      }

      nList.sort((a, b) => b.entry.compareTo(a.entry));

      historyModel.addAll(nList);

      Util.successSnackBar("Historial cargado correctamente");
    } catch (e) {
      Util.errorSnackBar(e.toString());
    } finally {
      loading(false);
    }
  }
}
