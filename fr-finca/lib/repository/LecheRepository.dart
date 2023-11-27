import 'package:asistencia_app/apis/leche_api.dart';
import 'package:asistencia_app/modelo/LecheModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:dio/dio.dart';
class LecheRepository {
  LecheApi? lecheApi;

  LecheRepository() {
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    lecheApi = LecheApi(dio);
  }

  Future<List<LechexModelo>> getLeche() async {
    print("llega:"+TokenUtil.TOKEN);
    late var resultant;
    try{
      resultant = await lecheApi!.getLeche(TokenUtil.TOKEN).then((value) => value);
    }catch(e){
      print(e);
    }


    return resultant;
  }

  Future<GenericModelo> deleteLeche(int id) async {
    return await lecheApi!.deleteLeche(TokenUtil.TOKEN, id);
  }

  Future<LechexModelo> updateLeche(int id, LecheModelo leche) async {
    return await lecheApi!.updateLeche(TokenUtil.TOKEN, id, leche);
  }

  Future<LechexModelo> createLeche(LecheModelo leche) async {
    //print(leche.toJson());
    return await lecheApi!.createLeche(TokenUtil.TOKEN, leche);
  }
}