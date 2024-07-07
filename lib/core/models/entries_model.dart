class EntriesModel {
  final int id;
  final int userId;
  final int sessionId;
  final DateTime entry;

  EntriesModel({
    required this.id,
    required this.userId,
    required this.sessionId,
    required this.entry,
  });

  EntriesModel copyWith({
    int? id,
    int? userId,
    int? sessionId,
    DateTime? entry,
  }) =>
      EntriesModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        sessionId: sessionId ?? this.sessionId,
        entry: entry ?? this.entry,
      );

  factory EntriesModel.fromJson(Map<String, dynamic> json) => EntriesModel(
        id: json["id"],
        userId: json["user_id"],
        sessionId: json["session_id"],
        entry: DateTime.parse(json["entry"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "session_id": sessionId,
        "entry": entry.toIso8601String(),
      };
}
