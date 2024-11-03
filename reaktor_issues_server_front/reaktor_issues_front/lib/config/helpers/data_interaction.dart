// Importamos el paquete dio.
import 'package:dio/dio.dart';

class DataInteraction {
  final Dio dio = Dio(BaseOptions(
      // URL base de las peticiones, ubicacion raiz.
      baseUrl: "http://localhost:8888/incidencias",

      // Si la conexión no se puede establecer dentro de este tiempo, se lanzará una excepción.
      connectTimeout: const Duration(seconds: 5),

      // Se utiliza para establecer el tiempo máximo que dio esperará para
      // recibir una respuesta después de que se haya establecido una conexión.
      receiveTimeout: const Duration(milliseconds: 3000)));

  // Método para realizar una petición GET a la API de incidencias
  Future<List<dynamic>> listaIncidencias() async {
    try {
      // Realizamos la petición GET
      final response = await dio.post('', data: {});

      // Comprobamos el estado de la respuesta
      if (response.statusCode == 200) {
        // Devolvemos la lista de incidencias
        return response.data;
      } else {
        throw Exception(
            "Error al obtener las incidencias: ${response.statusCode}");
      }
    } catch (e) {
      // Si hay un error, lo capturamos e imprimimos
      print("Error en la petición POST: $e");
      return [];
    }
  }
}
