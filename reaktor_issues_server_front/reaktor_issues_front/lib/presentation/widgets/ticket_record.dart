import 'package:flutter/material.dart';
import 'package:reaktor_issues_front/domain/models/incidencia_dto.dart';

/// Registro que se renderiza a partir de una incidencia pasada como parametro.
/// El registro cambia de color segun el estado de la incidencia.
class TicketRecord extends StatelessWidget {
  const TicketRecord({super.key, required this.incidencia});

  final IncidenciaDto incidencia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: _decoracionBasadaEnEstado(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _columnaCampo("Estado", incidencia.estadoIncidencia),
          _columnaCampo("Usuario", incidencia.correoDocente),
          _columnaCampo("Aula", incidencia.numeroAula),
          Flexible(
            flex: 4, // Asigna más espacio a la columna de descripción
            child:
                _columnaCampo("Descripción", incidencia.descripcionIncidencia),
          ),
          _columnaCampo("Fecha", incidencia.fechaIncidencia),
          _columnaCampo("Comentario", incidencia.comentario),
        ],
      ),
    );
  }

  /// Función que define el color del registro basándose en el estado de la incidencia.
  BoxDecoration _decoracionBasadaEnEstado() {
    var colorRegistro = const Color.fromARGB(255, 200, 252, 204);

    switch (incidencia.estadoIncidencia.toLowerCase()) {
      case 'en progreso':
        colorRegistro = const Color.fromARGB(255, 254, 255, 174);
        break;
      case 'cancelada':
        colorRegistro = const Color.fromARGB(255, 156, 156, 156);
        break;
      case 'pendiente':
        colorRegistro = const Color.fromRGBO(253, 215, 185, 1);
        break;
      case 'resuelta':
        colorRegistro = const Color.fromARGB(255, 200, 252, 204);
        break;
    }

    return BoxDecoration(
        border: Border.all(color: Colors.black), color: colorRegistro);
  }
}

/// Devuelve un Widget que representa un campo en el registro de incidencias.
/// Recibe dos líneas de texto.
/// 1. Título del campo.
/// 2. Valor del campo.
Widget _columnaCampo(String titulo, String valor) {
  return Flexible(
    flex: 1, // Espacio mínimo para columnas que no son la descripción
    child: Column(
      children: [
        Container(
          /*decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.white),*/
          width: double.infinity,
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: Center(
            child: Text(
              titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Text(valor),
        ),
      ],
    ),
  );
}
