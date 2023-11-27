
import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'finca_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class FincaApi {
  factory FincaApi(Dio dio, {String baseUrl}) = _FincaApi;
  static FincaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return FincaApi(dio);
  }

  @GET("/finca/finca/list")
  Future<List<FincaxModelo>> getFinca(@Header("Authorization") String token);

  @POST("/finca/finca/crear")
  Future<FincaxModelo> createFinca(@Header("Authorization") String
  token,@Body() FincaModelo finca);

  @GET("/finca/finca/buscar/{id}")
  Future<FincaModelo> findFinca(@Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/finca/eliminar/{id}")
  Future<GenericModelo> deleteFinca(@Header("Authorization") String token,
      @Path("id") int id);

  @PUT("/finca/finca/editar/{id}")
  Future<FincaxModelo> updateFinca(@Header("Authorization") String token,
      @Path("id") int id , @Body() FincaModelo finca);

}