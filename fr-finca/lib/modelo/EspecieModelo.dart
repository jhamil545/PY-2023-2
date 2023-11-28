import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@Entity(tableName: "Especie")
class EspecieModelo {
  @primaryKey
  late int id = 0;
  @ColumnInfo(name: "tipo")
  late final String tipo;
  late final String edad;
  late final String descripcion;
  late final String fecha_especie;

  EspecieModelo(
      {required this.id,
      required this.tipo,
      required this.edad,
      required this.descripcion,
      required this.fecha_especie});

  EspecieModelo.fromJsonLocal(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    edad = json['edad'];
    descripcion = json['descripcion'];
    fecha_especie = json['fecha_especie'];
  }

  EspecieModelo.unlaunched();

  EspecieModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    edad = json['edad'];
    descripcion = json['descripcion'];
    fecha_especie = json['fecha_especie'];
  }

  factory EspecieModelo.fromJsonModelo(Map<String, dynamic> json) {
    return EspecieModelo(
        id: json['id'],
        tipo: json['tipo'],
        edad: json['edad'],
        descripcion: json['descripcion'],
        fecha_especie: json['fecha_especie']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['tipo'] = tipo;
    data['edad'] = edad;
    data['descripcion'] = descripcion;
    data['fecha_especie'] = fecha_especie;

    return data;
  }
}

class EspeciexRModelo {
  late int id = 0;
  late final String tipo;
  late final String edad;
  late final String descripcion;
  late final DateTime fecha_especie;
  EspeciexRModelo({
    required this.id,
    required this.tipo,
    required this.edad,
    required this.descripcion,
    required this.fecha_especie,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    //final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tipo'] = tipo;
    data['edad'] = edad;
    data['descripcion'] = descripcion;
    data['fecha_especie'] = fecha_especie;

    return data;
  }
}
