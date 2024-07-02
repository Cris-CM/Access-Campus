class TypePlanModel {
  final String cIntDescripcion;
  final String nIntCodigo;

  TypePlanModel({
    required this.cIntDescripcion,
    required this.nIntCodigo,
  });

  TypePlanModel copyWith({
    String? cIntDescripcion,
    String? nIntCodigo,
  }) =>
      TypePlanModel(
        cIntDescripcion: cIntDescripcion ?? this.cIntDescripcion,
        nIntCodigo: nIntCodigo ?? this.nIntCodigo,
      );

  factory TypePlanModel.fromJson(Map<String, dynamic> json) => TypePlanModel(
        cIntDescripcion: json["cIntDescripcion"],
        nIntCodigo: json["nIntCodigo"],
      );

  Map<String, dynamic> toJson() => {
        "cIntDescripcion": cIntDescripcion,
        "nIntCodigo": nIntCodigo,
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
