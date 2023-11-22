

import 'package:asistencia_app/modelo/RazaModeloFire.dart';
import 'package:flutter/material.dart';

@immutable
class GanadoModeloFire {

  late String id="";
  late final String arete;
  late final String nombre;
  late final String fechanac;
  late final String foto_url;
  late final String genero;
  late final RazaModeloFire razaId;

  GanadoModeloFire({
    required this.id,
    required this.arete,
    required this.nombre,
    required this.fechanac,
    required this.foto_url,
    required this.genero,
    required this.razaId,
  });
  GanadoModeloFire.unlaunched();

  GanadoModeloFire.fromJson(Map<String, dynamic> json){
    id = json['id'];
    arete = json['arete'];
    nombre = json['nombre'];
    fechanac = json['fechanac'];
    foto_url = json['foto_url'];
    genero = json['genero'];
    razaId = json['razaId']!=null? RazaModeloFire.fromJsonModelo(json['razaId']):RazaModeloFire.unlaunched();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['arete'] = arete;
    _data['nombre'] = nombre;
    _data['fechanac'] = fechanac;
    _data['foto_url'] = foto_url;
    _data['genero'] = genero;
    //_data['razaId'] = razaId;
    if (this.razaId != null) {
      _data['razaId'] = this.razaId.id;
    }
    return _data;
  }


  Map<String, dynamic> toMap(){
    var data=Map<String, dynamic>();
    data['id'] = this.id;
    data['arete'] = this.arete;
    data['nombre'] = this.nombre;
    data['fechanac'] = this.fechanac;
    data['foto_url'] = this.foto_url;
    data['genero'] = this.genero;

    //data['raza'] = this.raza;
    if (this.razaId != null) {
      data['razaId'] = this.razaId.id;
    }
    return data;
  }

}