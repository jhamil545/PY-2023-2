import 'dart:ffi';


import 'package:asistencia_app/modelo/EmpresaModelo.dart';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FincaModelo {

  late int id=0;
  late final String nombre;
  late final String nomCort;
  late final String direccion;
  late final String descripcion;
  late final String ubigeo;
  late final String ttalHectareas;
  late final int empresaId;

  FincaModelo({
    required this.id,
    required this.nombre,
    required this.nomCort,
    required this.direccion,
    required this.descripcion,
    required this.ubigeo,
    required this.ttalHectareas,
    required this.empresaId,
  });
  FincaModelo.unlaunched();

  FincaModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    nomCort = json['nomCort'];
    direccion = json['direccion'];
    descripcion = json['descripcion'];
    ubigeo = json['ubigeo'];
    ttalHectareas = json['ttalHectareas'];
    empresaId = json['empresaId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['nomCort'] = nomCort;
    _data['direccion'] = direccion;
    _data['descripcion'] = descripcion;
    _data['ubigeo'] = ubigeo;
    _data['ttalHectareas'] = ttalHectareas;
    _data['empresaId'] = empresaId;

    return _data;
  }
}

class FincaxModelo {
  FincaxModelo({
    required this.id,
    required this.nombre,
    required this.nomCort,
    required this.direccion,
    required this.descripcion,
    required this.ubigeo,
    required this.ttalHectareas,
    required this.empresaId,
  });
  FincaxModelo.unlaunched();
  late  int id = 0;
  late final String nombre;
  late final String nomCort;
  late final String direccion;
  late final String descripcion;
  late final String ubigeo;
  late final String ttalHectareas;
  late final EmpresaModelo empresaId;

  FincaxModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    nomCort = json['nomCort'];
    direccion = json['direccion'];
    descripcion = json['descripcion'];
    ubigeo = json['ubigeo'];
    ttalHectareas = json['ttalHectareas'];
    empresaId = EmpresaModelo.fromJson(json['empresaId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['nomCort'] = nomCort;
    _data['direccion'] = direccion;
    _data['descripcion'] = descripcion;
    _data['ubigeo'] = ubigeo;
    _data['ttalHectareas'] = ttalHectareas;
    _data['empresaId'] = empresaId.toJson();
    return _data;
  }
}
