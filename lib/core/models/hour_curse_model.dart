class HourCurseModel {
  final String dias;
  final String horas;
  final String ambiente;
  final int tipoHora;

  HourCurseModel({
    required this.dias,
    required this.horas,
    required this.ambiente,
    required this.tipoHora,
  });

  HourCurseModel copyWith({
    String? dias,
    String? horas,
    String? ambiente,
    int? tipoHora,
  }) =>
      HourCurseModel(
        dias: dias ?? this.dias,
        horas: horas ?? this.horas,
        ambiente: ambiente ?? this.ambiente,
        tipoHora: tipoHora ?? this.tipoHora,
      );

  factory HourCurseModel.fromJson(Map<String, dynamic> json) => HourCurseModel(
        dias: json["dias"],
        horas: json["horas"],
        ambiente: json["Ambiente"],
        tipoHora: json["TipoHora"],
      );

  Map<String, dynamic> toJson() => {
        "dias": dias,
        "horas": horas,
        "Ambiente": ambiente,
        "TipoHora": tipoHora,
      };
}
