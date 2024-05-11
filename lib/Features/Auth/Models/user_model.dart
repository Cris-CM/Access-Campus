class UserModel {
  final int id;
  final String username;
  final int password;
  final String name;
  final int rol;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.rol,
  });

  UserModel copyWith({
    int? id,
    String? username,
    int? password,
    String? name,
    int? rol,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
        rol: rol ?? this.rol,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "name": name,
        "rol": rol,
      };
}
