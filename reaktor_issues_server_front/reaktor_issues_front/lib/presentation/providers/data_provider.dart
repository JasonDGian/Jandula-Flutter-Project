import 'package:flutter/material.dart';
import 'package:reaktor_issues_front/config/helpers/data_interaction.dart';
import 'package:reaktor_issues_front/domain/models/incidencia_dto.dart';

class DataProvider extends ChangeNotifier {
  List<DropdownMenuItem<String>> entradasNumAula = const [
    DropdownMenuItem<String>(
        value: "default",
        child: Text(
          "Selección.",
          style: TextStyle(color: Color.fromARGB(255, 151, 10, 0)),
        )),
    DropdownMenuItem<String>(value: "0.1", child: Text("0.1")),
    DropdownMenuItem<String>(value: "0.2", child: Text("0.2")),
    DropdownMenuItem<String>(value: "0.3", child: Text("0.3")),
    DropdownMenuItem<String>(value: "0.4", child: Text("0.4")),
    DropdownMenuItem<String>(value: "0.5", child: Text("0.5")),
  ];

  // DIO
  DataInteraction dataInteraction = DataInteraction();

  // Almacen de incidencias en Provider.
  List<IncidenciaDto> incidencias = [];

  // Metodo del provider que
  Future<void> buscaIncidencias() async {
    incidencias.clear();
    final respuesta = await dataInteraction.listaIncidencias();

    for (var x in respuesta) {
      // introduce la primera recuperada (la ultima añadida) a la lista como priemr elemento.
      incidencias.insert(0, IncidenciaDto.fromJson(x));
    }

    debugPrint("incidencias recibidas: " + incidencias.length.toString());
    notifyListeners();
  }

  // Genearcion incidencias.
  String numero = "";
  String usuario = "";
  String correo = "";
  DateTime? fecha;
  String descripcion = "";
  String estado = "";
  String comentario = "";

  // Funcion de seguridad para 'vaciar valores'.
  _clearValues() {
    numero = "";
    usuario = "";
    correo = "";
    fecha = null;
    descripcion = "";
    estado = "";
    comentario = "";
  }

  Future<void> crearIncidencia() async {
    debugPrint("antes de provider ejecutar");
    await dataInteraction.crearIncidencia(numero, descripcion, correo);
    debugPrint("despues de provider ejecutar");
    buscaIncidencias(); // actualiza la lista.
    notifyListeners(); // notifica a los oyentes.
    _clearValues(); // limpia valores del provider.
  }

  // Metodo que recibe un objeto incidencia DTO y lo envia tal cual para actualizar o crear.
  Future<void> modificarIncidencia(IncidenciaDto incidencia) async {
    await dataInteraction.modificarIncidencia(incidencia);
    buscaIncidencias();
    notifyListeners();
    _clearValues(); // limpia valores del provider.
  }
}
