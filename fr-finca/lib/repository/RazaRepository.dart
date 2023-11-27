import 'package:asistencia_app/apis/raza_api.dart';
import 'package:asistencia_app/modelo/RazaModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';
class RazaRepository {
  RazaApi? razaApi;

  RazaRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    razaApi = RazaApi(_dio);
  }

  Future<List<RazaModelo>> getRaza() async {
    var dato = await razaApi!.getRaza(TokenUtil.TOKEN).then((
        value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteRaza(int id) async {
    return await razaApi!.deleteRaza(TokenUtil.TOKEN, id);
  }

  Future<RazaModelo> updateRaza(int id,
      RazaModelo raza) async {
    return await razaApi!.updateRaza(TokenUtil.TOKEN, id, raza);
  }

  Future<RazaModelo> createRaza(RazaModelo raza) async {
    return await razaApi!.crearRaza(TokenUtil.TOKEN, raza);
  }
}