class CurseModel {
  final int ncurgrucodigo;
  final int idGrupoUnicoBase;
  final String ccurdetcod;
  final String casidescripcion;
  final String cuniorgnombre;
  final String filial;
  final double ncurdetcredito;
  final int ndocpercurvez;
  final String csecdescripcion;
  final String ccicdescripcion;
  final int nconcodigo;
  final int nciccodigo;
  final int nasicodigo;
  final int ncurcodigo;
  final String cdoccodigo;
  final String cpernombredocente;
  final String cPerCodigo;
  final String cpermaidocente;
  final String cprddescripcion;
  final String cmatcurestado;
  final String cmatcurdescripcion;
  final String descripciontotal;
  final int nprdcodigo;
  final int nasitipo;
  final int ngrucodigo;
  final int ncurdettipo;
  final int nprocodigo;
  final int nSedeCodigo;
  final String cgrunombre;
  final int acceso;
  final String modalidad;
  final int nTipCur;
  final String cDocCodigoN;
  final String cPerJuridica;
  final int nUniOrgCodigo;
  final int dowSilabo;
  final int grupoBase;
  final int grupoDiaFin;
  final int nAreaActividadIntegradora;
  final int nPerAluRegCodigo;
  final int nTpoHora;
  final int nInstSaluCodigo;
  final int delegado;
  final int asigDel;
  final DateTime fechafin;
  final DateTime fechafinprd;

  CurseModel({
    required this.ncurgrucodigo,
    required this.idGrupoUnicoBase,
    required this.ccurdetcod,
    required this.casidescripcion,
    required this.cuniorgnombre,
    required this.filial,
    required this.ncurdetcredito,
    required this.ndocpercurvez,
    required this.csecdescripcion,
    required this.ccicdescripcion,
    required this.nconcodigo,
    required this.nciccodigo,
    required this.nasicodigo,
    required this.ncurcodigo,
    required this.cdoccodigo,
    required this.cpernombredocente,
    required this.cPerCodigo,
    required this.cpermaidocente,
    required this.cprddescripcion,
    required this.cmatcurestado,
    required this.cmatcurdescripcion,
    required this.descripciontotal,
    required this.nprdcodigo,
    required this.nasitipo,
    required this.ngrucodigo,
    required this.ncurdettipo,
    required this.nprocodigo,
    required this.nSedeCodigo,
    required this.cgrunombre,
    required this.acceso,
    required this.modalidad,
    required this.nTipCur,
    required this.cDocCodigoN,
    required this.cPerJuridica,
    required this.nUniOrgCodigo,
    required this.dowSilabo,
    required this.grupoBase,
    required this.grupoDiaFin,
    required this.nAreaActividadIntegradora,
    required this.nPerAluRegCodigo,
    required this.nTpoHora,
    required this.nInstSaluCodigo,
    required this.delegado,
    required this.asigDel,
    required this.fechafin,
    required this.fechafinprd,
  });

  CurseModel copyWith({
    int? ncurgrucodigo,
    int? idGrupoUnicoBase,
    String? ccurdetcod,
    String? casidescripcion,
    String? cuniorgnombre,
    String? filial,
    double? ncurdetcredito,
    int? ndocpercurvez,
    String? csecdescripcion,
    String? ccicdescripcion,
    int? nconcodigo,
    int? nciccodigo,
    int? nasicodigo,
    int? ncurcodigo,
    String? cdoccodigo,
    String? cpernombredocente,
    String? cPerCodigo,
    String? cpermaidocente,
    String? cprddescripcion,
    String? cmatcurestado,
    String? cmatcurdescripcion,
    String? descripciontotal,
    int? nprdcodigo,
    int? nasitipo,
    int? ngrucodigo,
    int? ncurdettipo,
    int? nprocodigo,
    int? nSedeCodigo,
    String? cgrunombre,
    int? acceso,
    String? modalidad,
    int? nTipCur,
    String? cDocCodigoN,
    String? cPerJuridica,
    int? nUniOrgCodigo,
    int? dowSilabo,
    int? grupoBase,
    int? grupoDiaFin,
    int? nAreaActividadIntegradora,
    int? nPerAluRegCodigo,
    int? nTpoHora,
    int? nInstSaluCodigo,
    int? delegado,
    int? asigDel,
    DateTime? fechafin,
    DateTime? fechafinprd,
  }) =>
      CurseModel(
        ncurgrucodigo: ncurgrucodigo ?? this.ncurgrucodigo,
        idGrupoUnicoBase: idGrupoUnicoBase ?? this.idGrupoUnicoBase,
        ccurdetcod: ccurdetcod ?? this.ccurdetcod,
        casidescripcion: casidescripcion ?? this.casidescripcion,
        cuniorgnombre: cuniorgnombre ?? this.cuniorgnombre,
        filial: filial ?? this.filial,
        ncurdetcredito: ncurdetcredito ?? this.ncurdetcredito,
        ndocpercurvez: ndocpercurvez ?? this.ndocpercurvez,
        csecdescripcion: csecdescripcion ?? this.csecdescripcion,
        ccicdescripcion: ccicdescripcion ?? this.ccicdescripcion,
        nconcodigo: nconcodigo ?? this.nconcodigo,
        nciccodigo: nciccodigo ?? this.nciccodigo,
        nasicodigo: nasicodigo ?? this.nasicodigo,
        ncurcodigo: ncurcodigo ?? this.ncurcodigo,
        cdoccodigo: cdoccodigo ?? this.cdoccodigo,
        cpernombredocente: cpernombredocente ?? this.cpernombredocente,
        cPerCodigo: cPerCodigo ?? this.cPerCodigo,
        cpermaidocente: cpermaidocente ?? this.cpermaidocente,
        cprddescripcion: cprddescripcion ?? this.cprddescripcion,
        cmatcurestado: cmatcurestado ?? this.cmatcurestado,
        cmatcurdescripcion: cmatcurdescripcion ?? this.cmatcurdescripcion,
        descripciontotal: descripciontotal ?? this.descripciontotal,
        nprdcodigo: nprdcodigo ?? this.nprdcodigo,
        nasitipo: nasitipo ?? this.nasitipo,
        ngrucodigo: ngrucodigo ?? this.ngrucodigo,
        ncurdettipo: ncurdettipo ?? this.ncurdettipo,
        nprocodigo: nprocodigo ?? this.nprocodigo,
        nSedeCodigo: nSedeCodigo ?? this.nSedeCodigo,
        cgrunombre: cgrunombre ?? this.cgrunombre,
        acceso: acceso ?? this.acceso,
        modalidad: modalidad ?? this.modalidad,
        nTipCur: nTipCur ?? this.nTipCur,
        cDocCodigoN: cDocCodigoN ?? this.cDocCodigoN,
        cPerJuridica: cPerJuridica ?? this.cPerJuridica,
        nUniOrgCodigo: nUniOrgCodigo ?? this.nUniOrgCodigo,
        dowSilabo: dowSilabo ?? this.dowSilabo,
        grupoBase: grupoBase ?? this.grupoBase,
        grupoDiaFin: grupoDiaFin ?? this.grupoDiaFin,
        nAreaActividadIntegradora:
            nAreaActividadIntegradora ?? this.nAreaActividadIntegradora,
        nPerAluRegCodigo: nPerAluRegCodigo ?? this.nPerAluRegCodigo,
        nTpoHora: nTpoHora ?? this.nTpoHora,
        nInstSaluCodigo: nInstSaluCodigo ?? this.nInstSaluCodigo,
        delegado: delegado ?? this.delegado,
        asigDel: asigDel ?? this.asigDel,
        fechafin: fechafin ?? this.fechafin,
        fechafinprd: fechafinprd ?? this.fechafinprd,
      );

  factory CurseModel.fromJson(Map<String, dynamic> json) => CurseModel(
        ncurgrucodigo: json["ncurgrucodigo"],
        idGrupoUnicoBase: json["IdGrupoUnicoBase"],
        ccurdetcod: json["ccurdetcod"],
        casidescripcion: json["casidescripcion"],
        cuniorgnombre: json["cuniorgnombre"],
        filial: json["filial"],
        ncurdetcredito: json["ncurdetcredito"]?.toDouble(),
        ndocpercurvez: json["ndocpercurvez"],
        csecdescripcion: json["csecdescripcion"],
        ccicdescripcion: json["ccicdescripcion"],
        nconcodigo: json["nconcodigo"],
        nciccodigo: json["nciccodigo"],
        nasicodigo: json["nasicodigo"],
        ncurcodigo: json["ncurcodigo"],
        cdoccodigo: json["cdoccodigo"],
        cpernombredocente: json["cpernombredocente"],
        cPerCodigo: json["cPerCodigo"],
        cpermaidocente: json["cpermaidocente"],
        cprddescripcion: json["cprddescripcion"],
        cmatcurestado: json["cmatcurestado"],
        cmatcurdescripcion: json["cmatcurdescripcion"],
        descripciontotal: json["descripciontotal"],
        nprdcodigo: json["nprdcodigo"],
        nasitipo: json["nasitipo"],
        ngrucodigo: json["ngrucodigo"],
        ncurdettipo: json["ncurdettipo"],
        nprocodigo: json["nprocodigo"],
        nSedeCodigo: json["nSedeCodigo"],
        cgrunombre: json["cgrunombre"],
        acceso: json["Acceso"],
        modalidad: json["Modalidad"],
        nTipCur: json["nTipCur"],
        cDocCodigoN: json["cDocCodigoN"],
        cPerJuridica: json["cPerJuridica"],
        nUniOrgCodigo: json["nUniOrgCodigo"],
        dowSilabo: json["DowSilabo"],
        grupoBase: json["GrupoBase"],
        grupoDiaFin: json["GrupoDiaFin"],
        nAreaActividadIntegradora: json["nAreaActividadIntegradora"],
        nPerAluRegCodigo: json["nPerAluRegCodigo"],
        nTpoHora: json["nTpoHora"],
        nInstSaluCodigo: json["nInstSaluCodigo"],
        delegado: json["delegado"],
        asigDel: json["AsigDel"],
        fechafin: DateTime.parse(json["fechafin"]),
        fechafinprd: DateTime.parse(json["fechafinprd"]),
      );

  Map<String, dynamic> toJson() => {
        "ncurgrucodigo": ncurgrucodigo,
        "IdGrupoUnicoBase": idGrupoUnicoBase,
        "ccurdetcod": ccurdetcod,
        "casidescripcion": casidescripcion,
        "cuniorgnombre": cuniorgnombre,
        "filial": filial,
        "ncurdetcredito": ncurdetcredito,
        "ndocpercurvez": ndocpercurvez,
        "csecdescripcion": csecdescripcion,
        "ccicdescripcion": ccicdescripcion,
        "nconcodigo": nconcodigo,
        "nciccodigo": nciccodigo,
        "nasicodigo": nasicodigo,
        "ncurcodigo": ncurcodigo,
        "cdoccodigo": cdoccodigo,
        "cpernombredocente": cpernombredocente,
        "cPerCodigo": cPerCodigo,
        "cpermaidocente": cpermaidocente,
        "cprddescripcion": cprddescripcion,
        "cmatcurestado": cmatcurestado,
        "cmatcurdescripcion": cmatcurdescripcion,
        "descripciontotal": descripciontotal,
        "nprdcodigo": nprdcodigo,
        "nasitipo": nasitipo,
        "ngrucodigo": ngrucodigo,
        "ncurdettipo": ncurdettipo,
        "nprocodigo": nprocodigo,
        "nSedeCodigo": nSedeCodigo,
        "cgrunombre": cgrunombre,
        "Acceso": acceso,
        "Modalidad": modalidad,
        "nTipCur": nTipCur,
        "cDocCodigoN": cDocCodigoN,
        "cPerJuridica": cPerJuridica,
        "nUniOrgCodigo": nUniOrgCodigo,
        "DowSilabo": dowSilabo,
        "GrupoBase": grupoBase,
        "GrupoDiaFin": grupoDiaFin,
        "nAreaActividadIntegradora": nAreaActividadIntegradora,
        "nPerAluRegCodigo": nPerAluRegCodigo,
        "nTpoHora": nTpoHora,
        "nInstSaluCodigo": nInstSaluCodigo,
        "delegado": delegado,
        "AsigDel": asigDel,
        "fechafin": fechafin.toIso8601String(),
        "fechafinprd": fechafinprd.toIso8601String(),
      };
}
