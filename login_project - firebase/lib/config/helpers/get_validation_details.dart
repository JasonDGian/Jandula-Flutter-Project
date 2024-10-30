import 'package:dio/dio.dart';

class GetValidationDetails {
  final _dio = Dio();

  // Recuperar el listado de mapas de detalles de usuario.
  Future getValidationDetails() async {
    // Peticion al gScript
    final response = await _dio.get(
        'https://script.google.com/macros/s/AKfycbwtqeCI3105QvnYeq00g7WDel1bDYhEi3Ch8bjpMnxajIyAhhEAXexCJamMxburwy00UA/exec?spreadsheetId=1WR0MpsMVbCChMw4kg26OxzkMbiAaEj5UNOQBYnhIGvM&sheet=usuarios');

    // Si la respuesta es codigo 200 OK
    if (response.statusCode == 200) {
      return response.data;
    }

    // retorno vacio en cualquier otro caso.
    return;
  }
}
