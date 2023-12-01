import 'dart:ffi';


import 'package:asistencia_app/modelo/GanadoModelo.dart';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LecheModelo  {

  late int id=0;
  late final String fechaRec;
  late final String cantidadLt;
  late final String turno;
  late final int ganadoId;

  LecheModelo ({
    required this.id,
    required this.fechaRec,
    required this.cantidadLt,
    required this.turno,
    required this.ganadoId,
  });
  LecheModelo.unlaunched();

  LecheModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fechaRec = json['fechaRec'];
    cantidadLt = json['cantidadLt'];
    turno = json['turno'];
    ganadoId = json['ganadoId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaRec'] = fechaRec;
    _data['cantidadLt'] = cantidadLt;
    _data['turno'] = turno;
    _data['ganadoId'] = ganadoId;
    return _data;


  }
}

class LechexModelo {
  LechexModelo({
    required this.id,
    required this.fechaRec,
    required this.cantidadLt,
    required this.turno,
    required this.ganadoId,
  });
  LechexModelo.unlaunched();
  late  int id = 0;
  late final String fechaRec;
  late final String cantidadLt;
  late final String turno;
  late final GanadoxModelo ganadoId;

  LechexModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fechaRec = json['fechaRec'];
    cantidadLt = json['cantidadLt'];
    turno = json['turno'];
    ganadoId = GanadoxModelo.fromJson(json['ganadoId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaRec'] = fechaRec;
    _data['cantidadLt'] = cantidadLt;
    _data['turno'] = turno;
    _data['ganadoId'] = ganadoId;
    return _data;
  }
}
