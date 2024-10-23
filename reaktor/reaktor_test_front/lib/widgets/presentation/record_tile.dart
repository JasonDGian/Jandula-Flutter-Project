import 'package:flutter/material.dart';
import 'package:reaktor_test_front/models/incidencia.dart';

class RecordTile extends StatelessWidget {
  const RecordTile({super.key, required this.incidencia});

  // Objeto que presta sus datos para rellenar el record.
  final Incidencia incidencia;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(child: Text(incidencia.numAula)),
        Container(child: Text(incidencia.correoDocente)),
        Container(child: Text(incidencia.descripcionIncidencia)),
        Container(child: Text(incidencia.eastadoIncidencia)),
        Container(child: Text(incidencia.fechaIncidencia.toString()))
      ],
    );
  }
}
