class PeriodModel {
  final int nPrdCodigo;
  final String cPrdDescripcion;

  PeriodModel({
    required this.nPrdCodigo,
    required this.cPrdDescripcion,
  });

  PeriodModel copyWith({
    int? nPrdCodigo,
    String? cPrdDescripcion,
  }) =>
      PeriodModel(
        nPrdCodigo: nPrdCodigo ?? this.nPrdCodigo,
        cPrdDescripcion: cPrdDescripcion ?? this.cPrdDescripcion,
      );

  factory PeriodModel.fromJson(Map<String, dynamic> json) => PeriodModel(
        nPrdCodigo: json["nPrdCodigo"],
        cPrdDescripcion: json["cPrdDescripcion"],
      );

  Map<String, dynamic> toJson() => {
        "nPrdCodigo": nPrdCodigo,
        "cPrdDescripcion": cPrdDescripcion,
      };
}
