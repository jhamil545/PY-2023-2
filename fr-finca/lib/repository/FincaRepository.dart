import 'package:asistencia_app/apis/finca_api.dart';
import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';
class FincaRepository {
  FincaApi? fincaApi;

  FincaRepository() {
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    fincaApi = FincaApi(dio);
  }

  Future<List<FincaxModelo>> getFinca() async {
    print("llega:"+TokenUtil.TOKEN);
    var resultant =
    await fincaApi!.getFinca(TokenUtil.TOKEN).then((value) => value);

    return resultant;
  }

  Future<GenericModelo> deleteFinca(int id) async {
    return await fincaApi!.deleteFinca(TokenUtil.TOKEN, id);
  }

  Future<FincaxModelo> updateFinca(int id, FincaModelo finca) async {
    return await fincaApi!.updateFinca(TokenUtil.TOKEN, id, finca);
  }

  Future<FincaxModelo> createFinca(FincaModelo finca) async {
    //print(finca.toJson());
    return await fincaApi!.createFinca(TokenUtil.TOKEN, finca);
  }
}