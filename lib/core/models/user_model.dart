class UserModel {
  final List<LstItem> lstItem;
  final Pagination pagination;
  final bool isSuccess;
  final List<dynamic> lstError;
  final String ticket;
  final String clientName;
  final String userName;
  final String serverName;
  final int resultado;

  UserModel({
    required this.lstItem,
    required this.pagination,
    required this.isSuccess,
    required this.lstError,
    required this.ticket,
    required this.clientName,
    required this.userName,
    required this.serverName,
    required this.resultado,
  });

  UserModel copyWith({
    List<LstItem>? lstItem,
    Pagination? pagination,
    bool? isSuccess,
    List<dynamic>? lstError,
    String? ticket,
    String? clientName,
    String? userName,
    String? serverName,
    int? resultado,
  }) =>
      UserModel(
        lstItem: lstItem ?? this.lstItem,
        pagination: pagination ?? this.pagination,
        isSuccess: isSuccess ?? this.isSuccess,
        lstError: lstError ?? this.lstError,
        ticket: ticket ?? this.ticket,
        clientName: clientName ?? this.clientName,
        userName: userName ?? this.userName,
        serverName: serverName ?? this.serverName,
        resultado: resultado ?? this.resultado,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        lstItem:
            List<LstItem>.from(json["lstItem"].map((x) => LstItem.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        isSuccess: json["isSuccess"],
        lstError: List<dynamic>.from(json["lstError"].map((x) => x)),
        ticket: json["ticket"],
        clientName: json["clientName"],
        userName: json["userName"],
        serverName: json["serverName"],
        resultado: json["resultado"],
      );

  Map<String, dynamic> toJson() => {
        "lstItem": List<dynamic>.from(lstItem.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
        "isSuccess": isSuccess,
        "lstError": List<dynamic>.from(lstError.map((x) => x)),
        "ticket": ticket,
        "clientName": clientName,
        "userName": userName,
        "serverName": serverName,
        "resultado": resultado,
      };

  bool isTeacher() => lstItem.first.esDocente == 1;

  bool isUser() => lstItem.first.esDocente == 0;
}

class LstItem {
  final String cPerCodigo;
  final String cPerApellido;
  final String cPerApellidoPaterno;
  final String cPerApellidoMaterno;
  final String cPerApellidoCasada;
  final String cPerNombre;
  final String tipoContrato;
  final int esDocente;
  final String dPerNacimiento;
  final int nPerEstado;
  final int nPerTipo;
  final String cUbiGeoCodigo;
  final String cLugarConcatenado;
  final int nPerNatSexo;
  final String cPerNatSexoDes;
  final int nPerNatEstCivil;
  final String cPerNatEstCivilDes;
  final int nPerNatTipResidencia;
  final int nPerNatSitLaboral;
  final int nPerNatOcupacion;
  final int tipoDi;
  final String di;
  final String dni;
  final String cDocIde;
  final String people;
  final String cperjuridica;
  final int nUniOrgCodigo;
  final String cUniOrgNombre;
  final String cPerTelNumero;
  final int nPerAluRegEstado;
  final int ciclo;
  final String parientes;
  final int nAdmSolCodigo;
  final int nSProCodigo;
  final int nProCodigo;
  final dynamic cFilial;
  final String cPerMaiNombre;
  final bool bEvaluarDocente;
  final bool bPerfilMigrado;
  final String positionPs;
  final String positionDptPs;
  final dynamic dFechaUpdate;
  final dynamic cUsuUpdate;
  final String mailrecupe;
  final String mayorGradoObtenido;
  final String categoria;
  final String mailBoleta;
  final int nSedCodigo;
  final String cPerUsuCodigo;
  final String semestreIngreso;
  final String periodoCard;
  final String permailDbu;
  final String pertelefonoDbu;

  LstItem({
    required this.cPerCodigo,
    required this.cPerApellido,
    required this.cPerApellidoPaterno,
    required this.cPerApellidoMaterno,
    required this.cPerApellidoCasada,
    required this.cPerNombre,
    required this.tipoContrato,
    required this.esDocente,
    required this.dPerNacimiento,
    required this.nPerEstado,
    required this.nPerTipo,
    required this.cUbiGeoCodigo,
    required this.cLugarConcatenado,
    required this.nPerNatSexo,
    required this.cPerNatSexoDes,
    required this.nPerNatEstCivil,
    required this.cPerNatEstCivilDes,
    required this.nPerNatTipResidencia,
    required this.nPerNatSitLaboral,
    required this.nPerNatOcupacion,
    required this.tipoDi,
    required this.di,
    required this.dni,
    required this.cDocIde,
    required this.people,
    required this.cperjuridica,
    required this.nUniOrgCodigo,
    required this.cUniOrgNombre,
    required this.cPerTelNumero,
    required this.nPerAluRegEstado,
    required this.ciclo,
    required this.parientes,
    required this.nAdmSolCodigo,
    required this.nSProCodigo,
    required this.nProCodigo,
    required this.cFilial,
    required this.cPerMaiNombre,
    required this.bEvaluarDocente,
    required this.bPerfilMigrado,
    required this.positionPs,
    required this.positionDptPs,
    required this.dFechaUpdate,
    required this.cUsuUpdate,
    required this.mailrecupe,
    required this.mayorGradoObtenido,
    required this.categoria,
    required this.mailBoleta,
    required this.nSedCodigo,
    required this.cPerUsuCodigo,
    required this.semestreIngreso,
    required this.periodoCard,
    required this.permailDbu,
    required this.pertelefonoDbu,
  });

  LstItem copyWith({
    String? cPerCodigo,
    String? cPerApellido,
    String? cPerApellidoPaterno,
    String? cPerApellidoMaterno,
    String? cPerApellidoCasada,
    String? cPerNombre,
    String? tipoContrato,
    int? esDocente,
    String? dPerNacimiento,
    int? nPerEstado,
    int? nPerTipo,
    String? cUbiGeoCodigo,
    String? cLugarConcatenado,
    int? nPerNatSexo,
    String? cPerNatSexoDes,
    int? nPerNatEstCivil,
    String? cPerNatEstCivilDes,
    int? nPerNatTipResidencia,
    int? nPerNatSitLaboral,
    int? nPerNatOcupacion,
    int? tipoDi,
    String? di,
    String? dni,
    String? cDocIde,
    String? people,
    String? cperjuridica,
    int? nUniOrgCodigo,
    String? cUniOrgNombre,
    String? cPerTelNumero,
    int? nPerAluRegEstado,
    int? ciclo,
    String? parientes,
    int? nAdmSolCodigo,
    int? nSProCodigo,
    int? nProCodigo,
    dynamic cFilial,
    String? cPerMaiNombre,
    bool? bEvaluarDocente,
    bool? bPerfilMigrado,
    String? positionPs,
    String? positionDptPs,
    dynamic dFechaUpdate,
    dynamic cUsuUpdate,
    String? mailrecupe,
    String? mayorGradoObtenido,
    String? categoria,
    String? mailBoleta,
    int? nSedCodigo,
    String? cPerUsuCodigo,
    String? semestreIngreso,
    String? periodoCard,
    String? permailDbu,
    String? pertelefonoDbu,
  }) =>
      LstItem(
        cPerCodigo: cPerCodigo ?? this.cPerCodigo,
        cPerApellido: cPerApellido ?? this.cPerApellido,
        cPerApellidoPaterno: cPerApellidoPaterno ?? this.cPerApellidoPaterno,
        cPerApellidoMaterno: cPerApellidoMaterno ?? this.cPerApellidoMaterno,
        cPerApellidoCasada: cPerApellidoCasada ?? this.cPerApellidoCasada,
        cPerNombre: cPerNombre ?? this.cPerNombre,
        tipoContrato: tipoContrato ?? this.tipoContrato,
        esDocente: esDocente ?? this.esDocente,
        dPerNacimiento: dPerNacimiento ?? this.dPerNacimiento,
        nPerEstado: nPerEstado ?? this.nPerEstado,
        nPerTipo: nPerTipo ?? this.nPerTipo,
        cUbiGeoCodigo: cUbiGeoCodigo ?? this.cUbiGeoCodigo,
        cLugarConcatenado: cLugarConcatenado ?? this.cLugarConcatenado,
        nPerNatSexo: nPerNatSexo ?? this.nPerNatSexo,
        cPerNatSexoDes: cPerNatSexoDes ?? this.cPerNatSexoDes,
        nPerNatEstCivil: nPerNatEstCivil ?? this.nPerNatEstCivil,
        cPerNatEstCivilDes: cPerNatEstCivilDes ?? this.cPerNatEstCivilDes,
        nPerNatTipResidencia: nPerNatTipResidencia ?? this.nPerNatTipResidencia,
        nPerNatSitLaboral: nPerNatSitLaboral ?? this.nPerNatSitLaboral,
        nPerNatOcupacion: nPerNatOcupacion ?? this.nPerNatOcupacion,
        tipoDi: tipoDi ?? this.tipoDi,
        di: di ?? this.di,
        dni: dni ?? this.dni,
        cDocIde: cDocIde ?? this.cDocIde,
        people: people ?? this.people,
        cperjuridica: cperjuridica ?? this.cperjuridica,
        nUniOrgCodigo: nUniOrgCodigo ?? this.nUniOrgCodigo,
        cUniOrgNombre: cUniOrgNombre ?? this.cUniOrgNombre,
        cPerTelNumero: cPerTelNumero ?? this.cPerTelNumero,
        nPerAluRegEstado: nPerAluRegEstado ?? this.nPerAluRegEstado,
        ciclo: ciclo ?? this.ciclo,
        parientes: parientes ?? this.parientes,
        nAdmSolCodigo: nAdmSolCodigo ?? this.nAdmSolCodigo,
        nSProCodigo: nSProCodigo ?? this.nSProCodigo,
        nProCodigo: nProCodigo ?? this.nProCodigo,
        cFilial: cFilial ?? this.cFilial,
        cPerMaiNombre: cPerMaiNombre ?? this.cPerMaiNombre,
        bEvaluarDocente: bEvaluarDocente ?? this.bEvaluarDocente,
        bPerfilMigrado: bPerfilMigrado ?? this.bPerfilMigrado,
        positionPs: positionPs ?? this.positionPs,
        positionDptPs: positionDptPs ?? this.positionDptPs,
        dFechaUpdate: dFechaUpdate ?? this.dFechaUpdate,
        cUsuUpdate: cUsuUpdate ?? this.cUsuUpdate,
        mailrecupe: mailrecupe ?? this.mailrecupe,
        mayorGradoObtenido: mayorGradoObtenido ?? this.mayorGradoObtenido,
        categoria: categoria ?? this.categoria,
        mailBoleta: mailBoleta ?? this.mailBoleta,
        nSedCodigo: nSedCodigo ?? this.nSedCodigo,
        cPerUsuCodigo: cPerUsuCodigo ?? this.cPerUsuCodigo,
        semestreIngreso: semestreIngreso ?? this.semestreIngreso,
        periodoCard: periodoCard ?? this.periodoCard,
        permailDbu: permailDbu ?? this.permailDbu,
        pertelefonoDbu: pertelefonoDbu ?? this.pertelefonoDbu,
      );

  factory LstItem.fromJson(Map<String, dynamic> json) => LstItem(
        cPerCodigo: json["cPerCodigo"],
        cPerApellido: json["cPerApellido"],
        cPerApellidoPaterno: json["cPerApellidoPaterno"],
        cPerApellidoMaterno: json["cPerApellidoMaterno"],
        cPerApellidoCasada: json["cPerApellidoCasada"],
        cPerNombre: json["cPerNombre"],
        tipoContrato: json["TipoContrato"],
        esDocente: json["EsDocente"],
        dPerNacimiento: json["dPerNacimiento"],
        nPerEstado: json["nPerEstado"],
        nPerTipo: json["nPerTipo"],
        cUbiGeoCodigo: json["cUbiGeoCodigo"],
        cLugarConcatenado: json["cLugarConcatenado"],
        nPerNatSexo: json["nPerNatSexo"],
        cPerNatSexoDes: json["cPerNatSexoDes"],
        nPerNatEstCivil: json["nPerNatEstCivil"],
        cPerNatEstCivilDes: json["cPerNatEstCivilDes"],
        nPerNatTipResidencia: json["nPerNatTipResidencia"],
        nPerNatSitLaboral: json["nPerNatSitLaboral"],
        nPerNatOcupacion: json["nPerNatOcupacion"],
        tipoDi: json["TipoDI"],
        di: json["DI"],
        dni: json["DNI"],
        cDocIde: json["cDocIde"],
        people: json["PEOPLE"],
        cperjuridica: json["cperjuridica"],
        nUniOrgCodigo: json["nUniOrgCodigo"],
        cUniOrgNombre: json["cUniOrgNombre"],
        cPerTelNumero: json["cPerTelNumero"],
        nPerAluRegEstado: json["nPerAluRegEstado"],
        ciclo: json["Ciclo"],
        parientes: json["Parientes"],
        nAdmSolCodigo: json["nAdmSolCodigo"],
        nSProCodigo: json["nSProCodigo"],
        nProCodigo: json["nProCodigo"],
        cFilial: json["cFilial"],
        cPerMaiNombre: json["cPerMaiNombre"],
        bEvaluarDocente: json["bEvaluarDocente"],
        bPerfilMigrado: json["bPerfilMigrado"],
        positionPs: json["PositionPS"],
        positionDptPs: json["PositionDptPS"],
        dFechaUpdate: json["dFechaUpdate"],
        cUsuUpdate: json["cUsuUpdate"],
        mailrecupe: json["Mailrecupe"],
        mayorGradoObtenido: json["MayorGradoObtenido"],
        categoria: json["Categoria"],
        mailBoleta: json["MailBoleta"],
        nSedCodigo: json["nSedCodigo"],
        cPerUsuCodigo: json["cPerUsuCodigo"],
        semestreIngreso: json["SemestreIngreso"],
        periodoCard: json["PeriodoCard"],
        permailDbu: json["permail_dbu"],
        pertelefonoDbu: json["pertelefono_dbu"],
      );

  Map<String, dynamic> toJson() => {
        "cPerCodigo": cPerCodigo,
        "cPerApellido": cPerApellido,
        "cPerApellidoPaterno": cPerApellidoPaterno,
        "cPerApellidoMaterno": cPerApellidoMaterno,
        "cPerApellidoCasada": cPerApellidoCasada,
        "cPerNombre": cPerNombre,
        "TipoContrato": tipoContrato,
        "EsDocente": esDocente,
        "dPerNacimiento": dPerNacimiento,
        "nPerEstado": nPerEstado,
        "nPerTipo": nPerTipo,
        "cUbiGeoCodigo": cUbiGeoCodigo,
        "cLugarConcatenado": cLugarConcatenado,
        "nPerNatSexo": nPerNatSexo,
        "cPerNatSexoDes": cPerNatSexoDes,
        "nPerNatEstCivil": nPerNatEstCivil,
        "cPerNatEstCivilDes": cPerNatEstCivilDes,
        "nPerNatTipResidencia": nPerNatTipResidencia,
        "nPerNatSitLaboral": nPerNatSitLaboral,
        "nPerNatOcupacion": nPerNatOcupacion,
        "TipoDI": tipoDi,
        "DI": di,
        "DNI": dni,
        "cDocIde": cDocIde,
        "PEOPLE": people,
        "cperjuridica": cperjuridica,
        "nUniOrgCodigo": nUniOrgCodigo,
        "cUniOrgNombre": cUniOrgNombre,
        "cPerTelNumero": cPerTelNumero,
        "nPerAluRegEstado": nPerAluRegEstado,
        "Ciclo": ciclo,
        "Parientes": parientes,
        "nAdmSolCodigo": nAdmSolCodigo,
        "nSProCodigo": nSProCodigo,
        "nProCodigo": nProCodigo,
        "cFilial": cFilial,
        "cPerMaiNombre": cPerMaiNombre,
        "bEvaluarDocente": bEvaluarDocente,
        "bPerfilMigrado": bPerfilMigrado,
        "PositionPS": positionPs,
        "PositionDptPS": positionDptPs,
        "dFechaUpdate": dFechaUpdate,
        "cUsuUpdate": cUsuUpdate,
        "Mailrecupe": mailrecupe,
        "MayorGradoObtenido": mayorGradoObtenido,
        "Categoria": categoria,
        "MailBoleta": mailBoleta,
        "nSedCodigo": nSedCodigo,
        "cPerUsuCodigo": cPerUsuCodigo,
        "SemestreIngreso": semestreIngreso,
        "PeriodoCard": periodoCard,
        "permail_dbu": permailDbu,
        "pertelefono_dbu": pertelefonoDbu,
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
