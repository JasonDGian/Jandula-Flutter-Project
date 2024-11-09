import 'package:flutter/material.dart';
import 'package:reaktor_issues_front/domain/models/incidencia_dto.dart';
import 'package:reaktor_issues_front/shared/data/data_constants.dart';

/// Registro que se renderiza a partir de una incidencia pasada como parametro.
/// El registro cambia de color segun el estado de la incidencia.
class TicketRecord extends StatelessWidget {
  const TicketRecord(
      {super.key, required this.incidencia, required this.funcionActualizar});

  final IncidenciaDto incidencia;

  final Function funcionActualizar;

  @override
  Widget build(BuildContext context) {
    // Botones de poner en hecho y cancelar.
    var botonesAccion = Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 216, 215, 228),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // BOTON DE CANCELAR
          Column(
            children: [
              IconButton(
                onPressed: () {
                  incidencia.estadoIncidencia = DataConstants.estadoCancelada;
                  funcionActualizar(incidencia);
                },
                icon: const Icon(Icons.cancel_presentation_rounded),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {
                  incidencia.estadoIncidencia = DataConstants.estadoPendiente;
                  funcionActualizar(incidencia);
                },
                icon: const Icon(Icons.preview_outlined),
                color: const Color.fromARGB(255, 248, 168, 47),
              ),
            ],
          ),
          // BOTON DE PENDIENTE

          // BOTON DE EN PROGRESO
          Column(
            children: [
              IconButton(
                onPressed: () {
                  incidencia.estadoIncidencia = DataConstants.estadoEnProgreso;
                  funcionActualizar(incidencia);
                },
                icon: const Icon(Icons.done),
                color: Colors.green,
              ),
              IconButton(
                onPressed: () {
                  incidencia.estadoIncidencia = DataConstants.estadoResuelta;
                  funcionActualizar(incidencia);
                },
                icon: const Icon(Icons.done),
                color: Colors.green,
              ),
            ],
          ),
          // BOTON DE RESUELTA
        ],
      ),
    );
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: _decoracionBasadaEnEstado(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          botonesAccion,
          Expanded(
              child:
                  _columnaCampo("Estado", Text(incidencia.estadoIncidencia))),
          Expanded(
              child: _columnaCampo("Usuario", Text(incidencia.correoDocente))),
          _columnaCampo("Aula", Text(incidencia.numeroAula)),
          Expanded(
            // este estaba en un flexible 4
            child: _columnaCampo(
                "Descripción", Text(incidencia.descripcionIncidencia)),
          ),
          Expanded(
              child: _columnaCampo(
                  "Fecha", Text(incidencia.fechaIncidencia.toString()))),
          Expanded(
              child: _columnaCampo("Comentario", Text(incidencia.comentario))),
        ],
      ),
    );
  }

  /// Función que define el color del registro basándose en el estado de la incidencia.
  BoxDecoration _decoracionBasadaEnEstado() {
    var colorRegistro = const Color.fromARGB(255, 200, 252, 204);

    switch (incidencia.estadoIncidencia) {
      case DataConstants.estadoEnProgreso:
        colorRegistro = const Color.fromARGB(255, 254, 255, 174);
        break;
      case DataConstants.estadoCancelada:
        colorRegistro = const Color.fromARGB(255, 156, 156, 156);
        break;
      case DataConstants.estadoPendiente:
        colorRegistro = const Color.fromRGBO(253, 215, 185, 1);
        break;
      case DataConstants.estadoResuelta:
        colorRegistro = const Color.fromARGB(255, 200, 252, 204);
        break;
    }

    return BoxDecoration(
        border: Border.all(color: Colors.black),
        color: colorRegistro,
        borderRadius: const BorderRadius.all(Radius.circular(15)));
  }
}

/// Devuelve un Widget que representa un campo en el registro de incidencias.
Widget _columnaCampo(String titulo, dynamic valor) {
  return Column(
    children: [
      Container(
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.black), color: Colors.white),

        //width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
        color: Colors.white,
        child: Center(
          child: Text(
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 1,
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        color: Colors.amber,
        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: valor,
      ),
    ],
  );
}
