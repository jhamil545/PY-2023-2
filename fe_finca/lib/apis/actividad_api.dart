
import 'package:asistencia_app/modelo/ActividadModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'actividad_api.g.dart';
@RestApi(baseUrl: UrlApi.urlApix)
abstract class ActividadApi {
  factory ActividadApi(Dio dio, {String baseUrl}) = _ActividadApi;

  static ActividadApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ActividadApi(dio);
  }

  @GET("/finca/actividad/list")
  Future<List<ActividadModelo>> getActividad(@Header("Authorization") String token);

  @POST("/finca/actividad/crear")
  Future<ActividadModelo> crearActividad(@Header("Authorization") String token, @Body() ActividadModelo actividad);

  @GET("/finca/actividad/buscar/{id}")
  Future<ActividadModelo> findActividad(@Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/actividad/eliminar/{id}")
  Future<GenericModelo> deleteActividad(@Header("Authorization") String token, @Path("id") int id);

  @PUT("/finca/actividad/editar/{id}")
  Future<ActividadModelo> updateActividad(@Header("Authorization") String token, @Path("id") int id , @Body() ActividadModelo actividad);
}