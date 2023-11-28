import 'package:asistencia_app/apis/especie_api.dart';

import 'package:asistencia_app/modelo/EspecieModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';

class EspecieRepository {
  EspecieApi? especieApi;

  EspecieRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    especieApi = EspecieApi(_dio);
  }

  Future<List<EspecieModelo>> getEspecie() async {
    var dato =
        await especieApi!.getEspecie(TokenUtil.TOKEN).then((value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteEspecie(int id) async {
    return await especieApi!.deleteEspecie(TokenUtil.TOKEN, id);
  }

  Future<EspecieModelo> updateEspecie(int id, EspecieModelo especie) async {
    return await especieApi!.updateEspecie(TokenUtil.TOKEN, id, especie);
  }

  Future<EspecieModelo> createEspecie(EspecieModelo especie) async {
    return await especieApi!.crearEspecie(TokenUtil.TOKEN, especie);
  }
}
