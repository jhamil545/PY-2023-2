
import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:asistencia_app/modelo/GenericModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
part 'ganado_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class GanadoApi {
  factory GanadoApi(Dio dio, {String baseUrl}) = _GanadoApi;
  static GanadoApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return GanadoApi(dio);
  }

  @GET("/finca/ganado/list")
  Future<List<GanadoModelox>> getGanado(@Header("Authorization") String token);

  @POST("/finca/ganado/crear")
  Future<GanadoModelo> createGanado(@Header("Authorization") String
  token,@Body() GanadoModelo ganado);

  @DELETE("/finca/ganado/eliminar/{id}")
  Future<GenericModelo> deleteGanado(@Header("Authorization") String token,
      @Path("id") int id);

  @PATCH("/finca/ganado/editar/{id}")
  Future<GanadoModelo> updateGanado(@Header("Authorization") String
  token,@Path("id") int id, @Body() GanadoModelo ganado);

}