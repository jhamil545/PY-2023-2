import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:http/http.dart' as http; // o el paquete que estés utilizando para hacer las solicitudes HTTP
import 'dart:convert';

class DataService {
  static Future<List<FincaxModelo>> obtenerFincasPorEmpresa(int empresaId) async {
    final response = await http.get(Uri.parse('http://192.168.1.34:8080/finca/finca/list?empresaId=$empresaId'));

    if (response.statusCode == 200) {
      // Si la solicitud fue exitosa, parsea los datos y devuelve una lista de FincaxModelo
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => FincaxModelo.fromJson(item)).toList();
    } else {
      // Si la solicitud no fue exitosa, lanza una excepción o maneja el error según tus necesidades
        throw Exception('Error al obtener las fincas');
    }
  }
}
