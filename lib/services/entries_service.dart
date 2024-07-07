import 'package:qr_tracker/core/models/entries_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EntriesService {
  final supabase = Supabase.instance.client;

  Future<void> sendEntry(int sessionId, int userId) async {
    await supabase.from("Entries").insert(
          EntriesModel(
                  id: 0,
                  userId: userId,
                  sessionId: sessionId,
                  entry: DateTime.now())
              .toJson(),
        );
  }

  Future<List<EntriesModel>> getEntries() async {
    final entries = await supabase.from("Entries").select();

    return entries.map((e) => EntriesModel.fromJson(e)).toList();
  }
}
