import 'package:asistencia_app/modelo/PastoModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'pasto_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class PastoApi {
  factory PastoApi(Dio dio, {String baseUrl}) = _PastoApi;

  static PastoApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return PastoApi(dio);
  }

  @GET("/finca/Pasto/list")
  Future<List<PastoModelo>> getPasto(@Header("Authorization") String token);

  @POST("/finca/Pasto/crear")
  Future<PastoModelo> crearPasto(
      @Header("Authorization") String token, @Body() PastoModelo pasto);

  @GET("/finca/Pasto/buscar/{id}")
  Future<PastoModelo> findPasto(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/Pasto/eliminar/{id}")
  Future<GenericModelo> deletePasto(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/finca/Pasto/editar/{id}")
  Future<PastoModelo> updatePasto(@Header("Authorization") String token,
      @Path("id") int id, @Body() PastoModelo pasto);
}
