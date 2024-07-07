import 'package:qr_tracker/core/models/courses_model.dart';
import 'package:qr_tracker/core/models/entries_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseService {
  final supabase = Supabase.instance.client;

  Future<CoursesModel> getCourse(int courseId) async {
    final data = await supabase.from("Courses").select().eq("id", courseId);

    if (data.isEmpty) {
      throw "No se encontro el curso";
    }
    return CoursesModel.fromJson(data.first);
  }

  Future<List<EntriesModel>> getEntries() async {
    final entries = await supabase.from("Entries").select();

    return entries.map((e) => EntriesModel.fromJson(e)).toList();
  }
}
