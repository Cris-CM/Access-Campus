import 'package:qr_tracker/core/models/course_assigned_model.dart';
import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/widgets/util.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeService {
  final supabase = Supabase.instance.client;

  Future<List<CoursesModel>> getCourses(int userId) async {
    try {
      final listCourses = <CoursesModel>[];
      final assignedMap =
          await supabase.from("CourseAssigned").select().eq("user_id", userId);

      if (assignedMap.isEmpty) {
        throw "Usuario no existe";
      }

      for (var element
          in assignedMap.map((e) => CourseAssignedModel.fromJson(e)).toList()) {
        final data =
            await supabase.from("Courses").select().eq("id", element.courseId);

        listCourses.add(CoursesModel.fromJson(data.first));
      }

      if (listCourses.isEmpty) {
        throw "No cuenta con cursos asignados";
      }

      return listCourses;
    } catch (e) {
      Util.errorSnackBar("Error al obtener Courses");
      return [];
    }
  }
}
