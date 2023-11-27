import 'package:asistencia_app/modelo/EmpresaModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'empresa_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class EmpresaApi {
  factory EmpresaApi(Dio dio, {String baseUrl}) = _EmpresaApi;

  static EmpresaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EmpresaApi(dio);
  }

  @GET("/finca/empresa/list")
  Future<List<EmpresaModelo>> getEmpresa(@Header("Authorization") String token);

  @POST("/finca/empresa/crear")
  Future<EmpresaModelo> crearEmpresa(
      @Header("Authorization") String token, @Body() EmpresaModelo empresa);

  @GET("/finca/empresa/buscar/{id}")
  Future<EmpresaModelo> findEmpresa(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/finca/empresa/eliminar/{id}")
  Future<GenericModelo> deleteEmpresa(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/finca/empresa/editar/{id}")
  Future<EmpresaModelo> updateEmpresa(@Header("Authorization") String token,
      @Path("id") int id, @Body() EmpresaModelo empresa);
}