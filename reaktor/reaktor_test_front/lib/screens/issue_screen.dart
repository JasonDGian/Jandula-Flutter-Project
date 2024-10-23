import 'package:flutter/material.dart';
import 'package:reaktor_test_front/models/incidencia.dart';
import 'package:reaktor_test_front/widgets/presentation/record_tile.dart';

class IssueScreen extends StatelessWidget {
  const IssueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var itemCount = 10;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Incidencias REAKTOR")),
      body: Container(
        color: const Color.fromARGB(255, 201, 202, 201),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                    color: Colors.amber,
                    height: size.height * 0.9,
                    width: size.width * 0.35)
              ],
            ),
            Column(
              children: [
                Container(
                  width: size.width * 0.65,
                  color: Colors.grey,
                  child: const Column(
                    children: [
                      Text("Mis abiertas"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Numero de aula"),
                          Text("Correo docente"),
                          Text("Descripcion incidencia"),
                          Text("Estado incidencia"),
                          Text("Fecha incidencia"),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 192, 154, 154),
                  height: size.height * 0.45,
                  width: size.width * 0.65,
                ),
                Container(
                  color: Colors.grey,
                  child: Text("Incidencias abiertas"),
                ),
                Container(
                  color: const Color.fromARGB(255, 192, 248, 154),
                  height: size.height * 0.45,
                  width: size.width * 0.65,
                  child: ListView.builder(
                      itemCount:
                          litaInci.length, // introducir recuento de elementos.
                      itemBuilder: (context, index) {
                        return RecordTile(incidencia: litaInci[index]);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

var litaInci = [
  Incidencia(
      numAula: "0.7",
      correoDocente: "yo@tu.el",
      descripcionIncidencia: "Se han roto cosas",
      eastadoIncidencia: "EN PROGRESO",
      fechaIncidencia: DateTime.now()),
  Incidencia(
      numAula: "0.8",
      correoDocente: "yo@tu.el",
      descripcionIncidencia: "Se han mas roto cosas",
      eastadoIncidencia: "PENDIENTE",
      fechaIncidencia: DateTime.now()),
  Incidencia(
      numAula: "0.6",
      correoDocente: "yo@tu.el",
      descripcionIncidencia: "Se han roto cosas que no estaban rotas",
      eastadoIncidencia: "CANCELADA",
      fechaIncidencia: DateTime.now())
];
