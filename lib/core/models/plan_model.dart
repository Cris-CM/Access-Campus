class PlanModel {
  final String cPerCodigo;
  final int nCurCodigo;
  final int nuniorgcodigo;
  final String cCurDescripcion;
  final int nPerAluRegEstado;
  final int nPerAluRegCodigo;
  final int orden;
  final int nsProCodigo;

  PlanModel({
    required this.cPerCodigo,
    required this.nCurCodigo,
    required this.nuniorgcodigo,
    required this.cCurDescripcion,
    required this.nPerAluRegEstado,
    required this.nPerAluRegCodigo,
    required this.orden,
    required this.nsProCodigo,
  });

  PlanModel copyWith({
    String? cPerCodigo,
    int? nCurCodigo,
    int? nuniorgcodigo,
    String? cCurDescripcion,
    int? nPerAluRegEstado,
    int? nPerAluRegCodigo,
    int? orden,
    int? nsProCodigo,
  }) =>
      PlanModel(
        cPerCodigo: cPerCodigo ?? this.cPerCodigo,
        nCurCodigo: nCurCodigo ?? this.nCurCodigo,
        nuniorgcodigo: nuniorgcodigo ?? this.nuniorgcodigo,
        cCurDescripcion: cCurDescripcion ?? this.cCurDescripcion,
        nPerAluRegEstado: nPerAluRegEstado ?? this.nPerAluRegEstado,
        nPerAluRegCodigo: nPerAluRegCodigo ?? this.nPerAluRegCodigo,
        orden: orden ?? this.orden,
        nsProCodigo: nsProCodigo ?? this.nsProCodigo,
      );

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        cPerCodigo: json["cPerCodigo"],
        nCurCodigo: json["nCurCodigo"],
        nuniorgcodigo: json["nuniorgcodigo"],
        cCurDescripcion: json["cCurDescripcion"],
        nPerAluRegEstado: json["nPerAluRegEstado"],
        nPerAluRegCodigo: json["nPerAluRegCodigo"],
        orden: json["orden"],
        nsProCodigo: json["nsProCodigo"],
      );

  Map<String, dynamic> toJson() => {
        "cPerCodigo": cPerCodigo,
        "nCurCodigo": nCurCodigo,
        "nuniorgcodigo": nuniorgcodigo,
        "cCurDescripcion": cCurDescripcion,
        "nPerAluRegEstado": nPerAluRegEstado,
        "nPerAluRegCodigo": nPerAluRegCodigo,
        "orden": orden,
        "nsProCodigo": nsProCodigo,
      };
}

class Pagination {
  final int pageIndex;
  final int pageSize;
  final int totalRows;

  Pagination({
    required this.pageIndex,
    required this.pageSize,
    required this.totalRows,
  });

  Pagination copyWith({
    int? pageIndex,
    int? pageSize,
    int? totalRows,
  }) =>
      Pagination(
        pageIndex: pageIndex ?? this.pageIndex,
        pageSize: pageSize ?? this.pageSize,
        totalRows: totalRows ?? this.totalRows,
      );

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        totalRows: json["totalRows"],
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "totalRows": totalRows,
      };
}
