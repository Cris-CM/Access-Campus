class SessionsModel {
  final int id;
  final DateTime entry;
  final DateTime exit;
  final int courseId;
  final int minutesExtra;
  SessionsModel({
    required this.id,
    required this.entry,
    required this.exit,
    required this.courseId,
    required this.minutesExtra,
  });

  SessionsModel copyWith({
    int? id,
    DateTime? entry,
    DateTime? exit,
    int? courseId,
    int? minutesExtra,
  }) =>
      SessionsModel(
        id: id ?? this.id,
        entry: entry ?? this.entry,
        exit: exit ?? this.exit,
        courseId: courseId ?? this.courseId,
        minutesExtra: minutesExtra ?? this.minutesExtra,
      );

  factory SessionsModel.fromJson(Map<String, dynamic> json) => SessionsModel(
        id: json["id"],
        entry: DateTime.parse(json["entry"]),
        exit: DateTime.parse(json["exit"]),
        courseId: json["course_id"],
        minutesExtra: json["minutesExtra"],
      );

  Map<String, dynamic> toJson() => {
        "entry": entry.toIso8601String(),
        "exit": exit.toIso8601String(),
        "course_id": courseId,
        "minutesExtra": minutesExtra,
      };
}
