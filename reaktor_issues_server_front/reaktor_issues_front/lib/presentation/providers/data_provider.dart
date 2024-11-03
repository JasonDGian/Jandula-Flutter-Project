import 'package:flutter/material.dart';
import 'package:reaktor_issues_front/config/helpers/data_interaction.dart';
import 'package:reaktor_issues_front/domain/models/incidencia_dto.dart';

class DataProvider extends ChangeNotifier {
  // Listado de numeros de aulas recuperado por el proveedor.
  List<String> numeroAula = ["0.5", "0.7"];

  List<DropdownMenuItem<String>> entradasNumAula = const [
    DropdownMenuItem<String>(value: "0.1", child: Text("0.1")),
    DropdownMenuItem<String>(value: "0.2", child: Text("0.2")),
    DropdownMenuItem<String>(value: "0.3", child: Text("0.3")),
    DropdownMenuItem<String>(value: "0.4", child: Text("0.4")),
    DropdownMenuItem<String>(value: "0.5", child: Text("0.5")),
  ];

  // ----------------------------------------------
  // Instanciamos el dio.
  final dataFetcher = DataInteraction();
  // Listado inicial incidencias vacio.
  List<IncidenciaDto> listadoIncidencias = [];
  // Metodo que rellena la lista de incidencias.
  List<IncidenciaDto> incidencias = [
    IncidenciaDto(
      numeroAula: 'B201',
      correoDocente: 'profesor1@example.com',
      fechaIncidencia: '2023-10-20',
      descripcionIncidencia:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.',
      estadoIncidencia: 'Pendiente',
      comentario: 'Audio distorsionado en volumen alto',
    ),
    IncidenciaDto(
      numeroAula: 'C302',
      correoDocente: 'profesor2@example.com',
      fechaIncidencia: '2023-10-21',
      descripcionIncidencia: 'Fallo en el proyector',
      estadoIncidencia: 'En progreso',
      comentario: 'Se necesita cambiar el cable HDMI',
    ),
    IncidenciaDto(
      numeroAula: 'D403',
      correoDocente: 'profesor3@example.com',
      fechaIncidencia: '2023-10-22',
      descripcionIncidencia: 'Aire acondicionado sin funcionar',
      estadoIncidencia: 'Resuelto',
      comentario: 'Reparado el 2023-10-23',
    ),
    IncidenciaDto(
      numeroAula: 'A101',
      correoDocente: 'profesor4@example.com',
      fechaIncidencia: '2023-10-23',
      descripcionIncidencia: 'Falta de iluminación en el aula',
      estadoIncidencia: 'Pendiente',
      comentario: 'Varios focos están fundidos',
    ),
    IncidenciaDto(
      numeroAula: 'B201',
      correoDocente: 'profesor1@example.com',
      fechaIncidencia: '2023-10-20',
      descripcionIncidencia:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.',
      estadoIncidencia: 'Cancelada',
      comentario: 'Audio distorsionado en volumen alto',
    ),
    IncidenciaDto(
      numeroAula: 'C302',
      correoDocente: 'profesor2@example.com',
      fechaIncidencia: '2023-10-21',
      descripcionIncidencia: 'Fallo en el proyector',
      estadoIncidencia: 'En progreso',
      comentario: 'Se necesita cambiar el cable HDMI',
    ),
    IncidenciaDto(
      numeroAula: 'D403',
      correoDocente: 'profesor3@example.com',
      fechaIncidencia: '2023-10-22',
      descripcionIncidencia: 'Aire acondicionado sin funcionar',
      estadoIncidencia: 'Resuelto',
      comentario: 'Reparado el 2023-10-23',
    ),
    IncidenciaDto(
      numeroAula: 'A101',
      correoDocente: 'profesor4@example.com',
      fechaIncidencia: '2023-10-23',
      descripcionIncidencia: 'Falta de iluminación en el aula',
      estadoIncidencia: 'Cancelada',
      comentario: 'Varios focos están fundidos',
    ),
    IncidenciaDto(
      numeroAula: 'B201',
      correoDocente: 'profesor1@example.com',
      fechaIncidencia: '2023-10-20',
      descripcionIncidencia:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.',
      estadoIncidencia: 'Pendiente',
      comentario: 'Audio distorsionado en volumen alto',
    ),
    IncidenciaDto(
      numeroAula: 'C302',
      correoDocente: 'profesor2@example.com',
      fechaIncidencia: '2023-10-21',
      descripcionIncidencia: 'Fallo en el proyector',
      estadoIncidencia: 'En progreso',
      comentario: 'Se necesita cambiar el cable HDMI',
    ),
    IncidenciaDto(
      numeroAula: 'D403',
      correoDocente: 'profesor3@example.com',
      fechaIncidencia: '2023-10-22',
      descripcionIncidencia: 'Aire acondicionado sin funcionar',
      estadoIncidencia: 'Resuelto',
      comentario: 'Reparado el 2023-10-23',
    ),
    IncidenciaDto(
      numeroAula: 'A101',
      correoDocente: 'profesor4@example.com',
      fechaIncidencia: '2023-10-23',
      descripcionIncidencia: 'Falta de iluminación en el aula',
      estadoIncidencia: 'Cancelada',
      comentario: 'Varios focos están fundidos',
    ),
  ];

  Future<void> buscaIncidencias() async {
    // final respuesta = await dataFetcher.listaIncidencias();

    // List<IncidenciaDto> listadonuevo =
    //     incidenciaDtoFromJson(respuesta.toString());

    // listadoIncidencias.clear();
    // listadoIncidencias.addAll(listadonuevo);

    // notifyListeners();
    notifyListeners();
  }
}
