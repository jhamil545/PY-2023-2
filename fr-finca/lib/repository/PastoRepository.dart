import 'package:asistencia_app/apis/pasto_api.dart';
import 'package:asistencia_app/modelo/PastoModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';

class PastoRepository {
  PastoApi? pastoApi;

  PastoRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    pastoApi = PastoApi(_dio);
  }

  Future<List<PastoModelo>> getPasto() async {
    var dato = await pastoApi!.getPasto(TokenUtil.TOKEN).then((value) => value);
    return await dato;
  }

  Future<GenericModelo> deletePasto(int id) async {
    return await pastoApi!.deletePasto(TokenUtil.TOKEN, id);
  }

  Future<PastoModelo> updatePasto(int id, PastoModelo pasto) async {
    return await pastoApi!.updatePasto(TokenUtil.TOKEN, id, pasto);
  }

  Future<PastoModelo> createPasto(PastoModelo pasto) async {
    return await pastoApi!.crearPasto(TokenUtil.TOKEN, pasto);
  }
}
