
import 'package:flutter/material.dart';

@immutable
class RazaModeloFire {
  late  String id="";
  late final String nombreRaza;




  RazaModeloFire({
    required this.id,
    required this.nombreRaza,


  });

  RazaModeloFire.unlaunched();

  RazaModeloFire.fromJson(Map<String, dynamic> json){
    id = json['id']==null?"":json['id'];
    nombreRaza = json['nombreRaza'];


  }

  factory RazaModeloFire.fromJsonModelo(Map<String, dynamic> json){
    return RazaModeloFire(
      id : json['id']==null?"":json['id'],
      nombreRaza : json['nombreRaza'],


    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreRaza'] = nombreRaza;



    return _data;
  }

  Map<String, dynamic> toMap(){
    var data=Map<String, dynamic>();
    data['id'] = this.id;
    data['nombreRaza'] = this.nombreRaza;


    return data;
  }
}