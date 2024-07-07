import 'package:qr_tracker/core/models/course_assigned_model.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/models/sessions_model.dart';
import 'package:qr_tracker/core/models/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SessionsService {
  final supabase = Supabase.instance.client;

  Future<List<SessionsModel>> getSessions(int courseId) async {
    final nList = <SessionsModel>[];

    final data = await supabase.from("Sessions").select().eq(
          "course_id",
          courseId,
        );

    final listSession = data.map((e) => SessionsModel.fromJson(e)).toList();

    for (var element in listSession) {
      final dataEntries = await supabase.from("Entries").select().eq(
            "session_id",
            element.id,
          );

      if (dataEntries.isEmpty) {
        nList.add(element);
      }
    }

    return nList;
  }

  Future<SessionsModel> getLastSessionToNameCourse(String courseName) async {
    final courseMap = await supabase.from("Courses").select().eq(
          "name",
          courseName,
        );

    final course =
        courseMap.map((e) => CoursesModel.fromJson(e)).toList().first;

    final sessionsMap = await supabase.from("Sessions").select().eq(
          "course_id",
          course.id,
        );

    final sessions = sessionsMap.map((e) => SessionsModel.fromJson(e)).toList();

    final sessionsFilter = sessions
        .where(
          (element) => element.entry.isAfter(DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)),
        )
        .toList();

    return sessionsFilter.first;
  }

  Future<void> asingUserToCourse(int courseId, int userId) async {
    final assigned = await supabase
        .from("CourseAssigned")
        .select()
        .eq("user_id", userId)
        .eq("course_id", courseId);

    if (assigned.isNotEmpty) {
      throw "Usuario ya se encuentra en el curso";
    }

    await supabase.from("CourseAssigned").insert(
          CourseAssignedModel(
            id: 0,
            userId: userId,
            courseId: courseId,
          ).toJson(),
        );
  }

  Future<List<UsersModel>> getUsers() async {
    final users = await supabase.from("Users").select();

    return users.map((e) => UsersModel.fromJson(e)).toList();
  }

  Future<void> updateSession(SessionsModel sessionsModel) async {
    await supabase
        .from("Sessions")
        .update(sessionsModel.toJson())
        .eq("id", sessionsModel.id);
  }
}
