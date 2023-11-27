
import 'package:asistencia_app/modelo/LecheModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'leche_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class LecheApi {
  factory LecheApi(Dio dio, {String baseUrl}) = _LecheApi;
  static LecheApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return LecheApi(dio);
  }

  @GET("/finca/leche/list")
  Future<List<LechexModelo>> getLeche(@Header("Authorization") String token);

  @POST("/finca/leche/crear")
  Future<LechexModelo> createLeche(@Header("Authorization") String
  token,@Body() LecheModelo leche);

  @GET("/finca/leche/buscar/{id}")
  Future<LecheModelo> findLeche(@Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/leche/eliminar/{id}")
  Future<GenericModelo> deleteLeche(@Header("Authorization") String token,
      @Path("id") int id);

  @PUT("/finca/leche/editar/{id}")
  Future<LechexModelo> updateLeche(@Header("Authorization") String token,
      @Path("id") int id , @Body() LecheModelo leche);

}