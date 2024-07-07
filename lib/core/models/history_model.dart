import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/models/sessions_model.dart';
import 'package:qr_tracker/core/models/users_model.dart';

class HistoryModel {
  final UsersModel usersModel;
  final SessionsModel sessionsModel;
  final CoursesModel coursesModel;
  final DateTime entry;

  HistoryModel({
    required this.usersModel,
    required this.sessionsModel,
    required this.coursesModel,
    required this.entry,
  });
}
