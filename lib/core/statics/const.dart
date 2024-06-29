import 'package:flutter/foundation.dart';

const isDevelop = kDebugMode;

const URLDEVELOP = "http://192.168.0.103:5000/";

const URLPROD = "http://accesscampus.somee.com/";

const BASEURL = isDevelop ? URLDEVELOP : URLPROD;

enum TipoMatricula {
  cicloAlfa,
  pregradoCurricular,
  pregradoExtracurricular,
}

extension TipoMatriculaExtension on TipoMatricula {
  String get valor {
    switch (this) {
      case TipoMatricula.cicloAlfa:
        return "60";
      case TipoMatricula.pregradoCurricular:
        return "1";
      case TipoMatricula.pregradoExtracurricular:
        return "2";
    }
  }
}
