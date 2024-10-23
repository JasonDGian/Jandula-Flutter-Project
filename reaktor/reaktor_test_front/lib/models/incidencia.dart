import 'package:flutter/material.dart';

class Incidencia {
  final String numAula;
  final String correoDocente;
  final String descripcionIncidencia;
  final String eastadoIncidencia;
  final DateTime fechaIncidencia;

  const Incidencia(
      {required this.numAula,
      required this.correoDocente,
      required this.descripcionIncidencia,
      required this.eastadoIncidencia,
      required this.fechaIncidencia});
}
