import 'package:asistencia_app/apis/ganado_api.dart';
import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';
class GanadoRepository {
  GanadoApi? ganadoApi;

  GanadoRepository() {
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    ganadoApi = GanadoApi(dio);
  }

  Future<List<GanadoxModelo>> getGanado() async {
    print("llega:"+TokenUtil.TOKEN);
    var resultant =
    await ganadoApi!.getGanado(TokenUtil.TOKEN).then((value) => value);

    return resultant;
  }

  Future<GenericModelo> deleteGanado(int id) async {
    return await ganadoApi!.deleteGanado(TokenUtil.TOKEN, id);
  }

  Future<GanadoxModelo> updateGanado(int id, GanadoModelo ganado) async {
    return await ganadoApi!.updateGanado(TokenUtil.TOKEN, id, ganado);
  }

  Future<GanadoxModelo> createGanado(GanadoModelo ganado) async {
    //print(ganado.toJson());
    return await ganadoApi!.createGanado(TokenUtil.TOKEN, ganado);
  }
}