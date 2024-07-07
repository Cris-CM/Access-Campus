class CoursesModel {
  final int id;
  final String name;

  CoursesModel({
    required this.id,
    required this.name,
  });

  CoursesModel copyWith({
    int? id,
    String? name,
  }) =>
      CoursesModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
