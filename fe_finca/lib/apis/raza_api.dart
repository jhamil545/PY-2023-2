import 'package:asistencia_app/modelo/RazaModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'raza_api.g.dart';
@RestApi(baseUrl: UrlApi.urlApix)
abstract class RazaApi {
  factory RazaApi(Dio dio, {String baseUrl}) = _RazaApi;

  static RazaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return RazaApi(dio);
  }

  @GET("/finca/raza/list")
  Future<List<RazaModelo>> getRaza(@Header("Authorization") String token);

  @POST("/finca/raza/crear")
  Future<RazaModelo> crearRaza(@Header("Authorization") String token, @Body() RazaModelo raza);

  @GET("/finca/raza/buscar/{id}")
  Future<RazaModelo> findRaza(@Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/raza/eliminar/{id}")
  Future<GenericModelo> deleteRaza(@Header("Authorization") String token, @Path("id") int id);

  @PUT("/finca/raza/editar/{id}")
  Future<RazaModelo> updateRaza(@Header("Authorization") String token, @Path("id") int id , @Body() RazaModelo raza);
}