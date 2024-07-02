class UserShort {
  final Item item;
  final bool isSuccess;
  final List<dynamic> lstError;
  final String ticket;
  final String clientName;
  final String userName;
  final String serverName;
  final int resultado;

  UserShort({
    required this.item,
    required this.isSuccess,
    required this.lstError,
    required this.ticket,
    required this.clientName,
    required this.userName,
    required this.serverName,
    required this.resultado,
  });

  UserShort copyWith({
    Item? item,
    bool? isSuccess,
    List<dynamic>? lstError,
    String? ticket,
    String? clientName,
    String? userName,
    String? serverName,
    int? resultado,
  }) =>
      UserShort(
        item: item ?? this.item,
        isSuccess: isSuccess ?? this.isSuccess,
        lstError: lstError ?? this.lstError,
        ticket: ticket ?? this.ticket,
        clientName: clientName ?? this.clientName,
        userName: userName ?? this.userName,
        serverName: serverName ?? this.serverName,
        resultado: resultado ?? this.resultado,
      );

  factory UserShort.fromJson(Map<String, dynamic> json) => UserShort(
        item: Item.fromJson(json["item"]),
        isSuccess: json["isSuccess"],
        lstError: List<dynamic>.from(json["lstError"].map((x) => x)),
        ticket: json["ticket"],
        clientName: json["clientName"],
        userName: json["userName"],
        serverName: json["serverName"],
        resultado: json["resultado"],
      );

  Map<String, dynamic> toJson() {
    return {
        "item": item.toJson(),
        "isSuccess": isSuccess,
        "lstError": List<dynamic>.from(lstError.map((x) => x)),
        "ticket": ticket,
        "clientName": clientName,
        "userName": userName,
        "serverName": serverName,
        "resultado": resultado,
      };
  }
}

class Item {
  final String cPerCodigo;
  final String cPerApellido;
  final String cPerNombre;
  final String dPerNacimiento;
  final String cUbiGeoCodigo;
  final String cperestadobiblio;
  final String ultimoAcceso;
  final bool cambioClave;
  final String niveles;
  final int ldap;
  final String cPerUcvVirtual;
  final String cPerIdeNumero;

  Item({
    required this.cPerCodigo,
    required this.cPerApellido,
    required this.cPerNombre,
    required this.dPerNacimiento,
    required this.cUbiGeoCodigo,
    required this.cperestadobiblio,
    required this.ultimoAcceso,
    required this.cambioClave,
    required this.niveles,
    required this.ldap,
    required this.cPerUcvVirtual,
    required this.cPerIdeNumero,
  });

  Item copyWith({
    String? cPerCodigo,
    String? cPerApellido,
    String? cPerNombre,
    String? dPerNacimiento,
    String? cUbiGeoCodigo,
    String? cperestadobiblio,
    String? ultimoAcceso,
    bool? cambioClave,
    String? niveles,
    int? ldap,
    String? cPerUcvVirtual,
    String? cPerIdeNumero,
  }) =>
      Item(
        cPerCodigo: cPerCodigo ?? this.cPerCodigo,
        cPerApellido: cPerApellido ?? this.cPerApellido,
        cPerNombre: cPerNombre ?? this.cPerNombre,
        dPerNacimiento: dPerNacimiento ?? this.dPerNacimiento,
        cUbiGeoCodigo: cUbiGeoCodigo ?? this.cUbiGeoCodigo,
        cperestadobiblio: cperestadobiblio ?? this.cperestadobiblio,
        ultimoAcceso: ultimoAcceso ?? this.ultimoAcceso,
        cambioClave: cambioClave ?? this.cambioClave,
        niveles: niveles ?? this.niveles,
        ldap: ldap ?? this.ldap,
        cPerUcvVirtual: cPerUcvVirtual ?? this.cPerUcvVirtual,
        cPerIdeNumero: cPerIdeNumero ?? this.cPerIdeNumero,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        cPerCodigo: json["cPerCodigo"],
        cPerApellido: json["cPerApellido"],
        cPerNombre: json["cPerNombre"],
        dPerNacimiento: json["dPerNacimiento"],
        cUbiGeoCodigo: json["cUbiGeoCodigo"],
        cperestadobiblio: json["cperestadobiblio"],
        ultimoAcceso: json["ultimoAcceso"],
        cambioClave: json["cambioClave"],
        niveles: json["niveles"],
        ldap: json["ldap"],
        cPerUcvVirtual: json["cPerUcvVirtual"],
        cPerIdeNumero: json["cPerIdeNumero"],
      );

  Map<String, dynamic> toJson() => {
        "cPerCodigo": cPerCodigo,
        "cPerApellido": cPerApellido,
        "cPerNombre": cPerNombre,
        "dPerNacimiento": dPerNacimiento,
        "cUbiGeoCodigo": cUbiGeoCodigo,
        "cperestadobiblio": cperestadobiblio,
        "ultimoAcceso": ultimoAcceso,
        "cambioClave": cambioClave,
        "niveles": niveles,
        "ldap": ldap,
        "cPerUcvVirtual": cPerUcvVirtual,
        "cPerIdeNumero": cPerIdeNumero,
      };
}
