// To parse this JSON data, do
//
//     final incidenciaDto = incidenciaDtoFromJson(jsonString);

import 'dart:convert';

List<IncidenciaDto> incidenciaDtoFromJson(String str) =>
    List<IncidenciaDto>.from(
        json.decode(str).map((x) => IncidenciaDto.fromJson(x)));

String incidenciaDtoToJson(List<IncidenciaDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncidenciaDto {
  String numeroAula;
  String correoDocente;
  String fechaIncidencia;
  String descripcionIncidencia;
  String estadoIncidencia;
  String comentario;

  IncidenciaDto({
    required this.numeroAula,
    required this.correoDocente,
    required this.fechaIncidencia,
    required this.descripcionIncidencia,
    required this.estadoIncidencia,
    required this.comentario,
  });

  factory IncidenciaDto.fromJson(Map<String, dynamic> json) => IncidenciaDto(
        numeroAula: json["numeroAula"],
        correoDocente: json["correoDocente"],
        fechaIncidencia: json["fechaIncidencia"],
        descripcionIncidencia: json["descripcionIncidencia"],
        estadoIncidencia: json["estadoIncidencia"],
        comentario: json["comentario"],
      );

  Map<String, dynamic> toJson() => {
        "numeroAula": numeroAula,
        "correoDocente": correoDocente,
        "fechaIncidencia": fechaIncidencia,
        "descripcionIncidencia": descripcionIncidencia,
        "estadoIncidencia": estadoIncidencia,
        "comentario": comentario,
      };

  @override
  String toString() {
    return 'IncidenciaDto(numeroAula: $numeroAula, correoDocente: $correoDocente, '
        'fechaIncidencia: $fechaIncidencia, descripcionIncidencia: $descripcionIncidencia, '
        'estadoIncidencia: $estadoIncidencia, comentario: $comentario)';
  }
}
