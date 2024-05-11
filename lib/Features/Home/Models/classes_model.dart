class ClassesModel {
  final int id;
  final String name;
  final String pavilion;
  final String number;
  final DateTime entryDate;
  final DateTime exitDate;

  ClassesModel({
    required this.id,
    required this.name,
    required this.pavilion,
    required this.number,
    required this.entryDate,
    required this.exitDate,
  });

  ClassesModel copyWith({
    int? id,
    String? name,
    String? pavilion,
    String? number,
    DateTime? entryDate,
    DateTime? exitDate,
  }) =>
      ClassesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        pavilion: pavilion ?? this.pavilion,
        number: number ?? this.number,
        entryDate: entryDate ?? this.entryDate,
        exitDate: exitDate ?? this.exitDate,
      );

  factory ClassesModel.fromJson(Map<String, dynamic> json) => ClassesModel(
        id: json["id"],
        name: json["name"],
        pavilion: json["pavilion"],
        number: json["number"],
        entryDate: DateTime.parse(json["entryDate"]),
        exitDate: DateTime.parse(json["exitDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pavilion": pavilion,
        "number": number,
        "entryDate": entryDate.toIso8601String(),
        "exitDate": exitDate.toIso8601String(),
      };
}
