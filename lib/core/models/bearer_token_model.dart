class BearerTokenModel {
  final String accessToken;
  final String scope;
  final String tokenType;
  final int expiresIn;

  BearerTokenModel({
    required this.accessToken,
    required this.scope,
    required this.tokenType,
    required this.expiresIn,
  });

  BearerTokenModel copyWith({
    String? accessToken,
    String? scope,
    String? tokenType,
    int? expiresIn,
  }) =>
      BearerTokenModel(
        accessToken: accessToken ?? this.accessToken,
        scope: scope ?? this.scope,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  factory BearerTokenModel.fromJson(Map<String, dynamic> json) =>
      BearerTokenModel(
        accessToken: json["access_token"],
        scope: json["scope"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "scope": scope,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
