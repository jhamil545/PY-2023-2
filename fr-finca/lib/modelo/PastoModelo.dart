import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@Entity(tableName: "pasto")
class PastoModelo {
  @primaryKey
  late int id = 0;
  @ColumnInfo(name: "area")
  late final String area;
  late final String especiepasto;
  late final String estadocorte;
  late final String pesofresc;

  PastoModelo(
      {required this.id,
      required this.area,
      required this.especiepasto,
      required this.estadocorte,
      required this.pesofresc});

  PastoModelo.fromJsonLocal(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'];
    especiepasto = json['especiepasto'];
    estadocorte = json['estadocorte'];
    pesofresc = json['pesofresc'];
  }

  PastoModelo.unlaunched();

  PastoModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'];
    especiepasto = json['especiepasto'];
    estadocorte = json['estadocorte'];
    pesofresc = json['pesofresc'];
  }

  factory PastoModelo.fromJsonModelo(Map<String, dynamic> json) {
    return PastoModelo(
        id: json['id'],
        area: json['area'],
        especiepasto: json['especiepasto'],
        estadocorte: json['estadocorte'],
        pesofresc: json['pesofresc']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['area'] = area;
    data['especiepasto'] = especiepasto;
    data['estadocorte'] = estadocorte;
    data['pesofresc'] = pesofresc;

    return data;
  }
}

class PastoxRModelo {
  late int id = 0;
  late final String area;
  late final String especiepasto;
  late final String estadocorte;
  late final DateTime pesofresc;
  PastoxRModelo({
    required this.id,
    required this.area,
    required this.especiepasto,
    required this.estadocorte,
    required this.pesofresc,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    //final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['area'] = area;
    data['especiepasto'] = especiepasto;
    data['estadocorte'] = estadocorte;
    data['pesofresc'] = pesofresc;

    return data;
  }
}
