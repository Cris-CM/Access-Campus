class UsersModel {
  final int id;
  final int rol;
  final String name;
  final String uid;

  UsersModel({
    required this.id,
    required this.rol,
    required this.name,
    required this.uid,
  });

  UsersModel copyWith({
    int? id,
    int? rol,
    String? name,
    String? uid,
  }) =>
      UsersModel(
        id: id ?? this.id,
        rol: rol ?? this.rol,
        name: name ?? this.name,
        uid: uid ?? this.uid,
      );

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        rol: json["rol"],
        name: json["name"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rol": rol,
        "name": name,
        "uid": uid,
      };

  bool get isTeacher => rol == 2;
}
