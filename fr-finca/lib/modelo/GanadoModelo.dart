import 'package:asistencia_app/modelo/RazaModelo.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GanadoModelo {

  late int id=0;
  late final String arete;
  late final String nombre;
  late final String fechaNac;
  late final String fotoUrl;
  late final String genero;
  late final int razaId;

  GanadoModelo({
    required this.id,
    required this.arete,
    required this.nombre,
    required this.fechaNac,
    required this.fotoUrl,
    required this.genero,
    required this.razaId,
  });
  GanadoModelo.unlaunched();

  GanadoModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    arete = json['arete'];
    nombre = json['nombre'];
    fechaNac = json['fechaNac'];
    fotoUrl = json['fotoUrl'];
    genero = json['genero'];

    razaId = json['razaId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['arete'] = arete;
    _data['nombre'] = nombre;
    _data['fechaNac'] = fechaNac;
    _data['fotoUrl'] = fotoUrl;
    _data['genero'] = genero;
    _data['razaId'] = razaId;

    return _data;
  }
}

class GanadoxModelo {
  GanadoxModelo({
    required this.id,
    required this.arete,
    required this.nombre,
    required this.fechaNac,
    required this.fotoUrl,
    required this.genero,
    required this.razaId,
  });
  GanadoxModelo.unlaunched();
  late  int id = 0;
  late final String arete;
  late final String nombre;
  late final String fechaNac;
  late final String fotoUrl;
  late final String genero;
  late final RazaModelo razaId;

  GanadoxModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    arete = json['arete'];
    nombre = json['nombre'];
    fechaNac = json['fechaNac'];
    fotoUrl = json['fotoUrl'];
    genero = json['genero'];
    razaId = RazaModelo.fromJson(json['razaId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['arete'] = arete;
    _data['nombre'] = nombre;
    _data['fechaNac'] = fechaNac;
    _data['fotoUrl'] = fotoUrl;
    _data['genero'] = genero;
    _data['razaId'] = razaId.toJson();
    return _data;
  }
}

class RazaModelo {
  RazaModelo({
    required this.id,
    required this.nombreRaza,

  });
  late final int id;
  late final String nombreRaza;


  RazaModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombreRaza = json['nombreRaza'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreRaza'] = nombreRaza;

    return _data;
  }
}