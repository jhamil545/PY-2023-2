import 'package:asistencia_app/apis/ganado_api.dart';
import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';
class GanadoRepository {
  GanadoApi? ganadoApi;

  GanadoRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    ganadoApi = GanadoApi(_dio);
  }

  Future<List<GanadoModelox>> getGanado() async {
    var dato = await ganadoApi!.getGanado(TokenUtil.TOKEN).then((
        value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteGanado(int id) async {
    return await ganadoApi!.deleteGanado(TokenUtil.TOKEN, id);
  }

  Future<GanadoModelo> updateGanado(int id,
      GanadoModelo ganado) async {
    return await ganadoApi!.updateGanado(TokenUtil.TOKEN, id, ganado);
  }

  Future<GanadoModelo> createGanado(GanadoModelo ganado) async {
    return await ganadoApi!.createGanado(TokenUtil.TOKEN, ganado);
  }
}