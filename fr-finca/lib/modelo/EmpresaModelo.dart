import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EmpresaModelo {
  EmpresaModelo({
    required this.id,
    required this.nombre,
    required this.nomCort,
    required this.direccionFiscal,
    required this.ruc,
    required this.ubigeo,
  });

  EmpresaModelo.unlaunched();

  late int id = 0;
  late final String nombre;
  late final String nomCort;
  late final String direccionFiscal;
  late final String ruc;
  late final String ubigeo;

  EmpresaModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    nomCort = json['nomCort'];
    direccionFiscal = json['direccionFiscal'];
    ruc = json['ruc'];
    ubigeo = json['ubigeo'];
  }

  factory EmpresaModelo.fromJsonModelo(Map<String, dynamic> json) {
    return EmpresaModelo(
        id: json['id'],
        nombre : json['nombre'],
        nomCort : json['nomCort'],
        direccionFiscal : json['direccionFiscal'],
        ruc : json['ruc'],
        ubigeo : json['ubigeo'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['nomCort'] = nomCort;
    _data['direccionFiscal'] = direccionFiscal;
    _data['ruc'] = ruc;
    _data['ubigeo'] = ubigeo;
    return _data;
  }
}