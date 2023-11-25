
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RazaModelo {
  RazaModelo({
    required this.id,
    required this.nombreRaza,

  });

  RazaModelo.unlaunched();

  late  int id=0;
  late final String nombreRaza;



  RazaModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombreRaza = json['nombreRaza'];



  }

  factory RazaModelo.fromJsonModelo(Map<String, dynamic> json){
    return RazaModelo(
        id : json['id'],
        nombreRaza : json['nombreRaza'],

    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreRaza'] = nombreRaza;
    return _data;
  }
}




