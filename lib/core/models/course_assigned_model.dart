class CourseAssignedModel {
  final int? id;
  final int userId;
  final int courseId;

  CourseAssignedModel({
    required this.id,
    required this.userId,
    required this.courseId,
  });

  CourseAssignedModel copyWith({
    int? id,
    int? userId,
    int? courseId,
  }) =>
      CourseAssignedModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        courseId: courseId ?? this.courseId,
      );

  factory CourseAssignedModel.fromJson(Map<String, dynamic> json) =>
      CourseAssignedModel(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "course_id": courseId,
      };
}
