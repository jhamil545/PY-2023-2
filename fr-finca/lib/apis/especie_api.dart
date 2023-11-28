import 'package:asistencia_app/modelo/EspecieModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'especie_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class EspecieApi {
  factory EspecieApi(Dio dio, {String baseUrl}) = _EspecieApi;

  static EspecieApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EspecieApi(dio);
  }

  @GET("/finca/especie/list")
  Future<List<EspecieModelo>> getEspecie(@Header("Authorization") String token);

  @POST("/finca/especie/crear")
  Future<EspecieModelo> crearEspecie(
      @Header("Authorization") String token, @Body() EspecieModelo especie);

  @GET("/finca/especie/buscar/{id}")
  Future<EspecieModelo> findEspecie(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/especie/eliminar/{id}")
  Future<GenericModelo> deleteEspecie(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/finca/especie/editar/{id}")
  Future<EspecieModelo> updateEspecie(@Header("Authorization") String token,
      @Path("id") int id, @Body() EspecieModelo especie);
}
