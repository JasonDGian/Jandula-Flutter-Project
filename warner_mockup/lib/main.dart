import 'package:flutter/material.dart';
import 'package:warner_mockup/screens/beach_park_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<bool> getData() async {
    await Future.delayed(const Duration(seconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final funcionFutura = getData();

    return MaterialApp(
        debugShowCheckedModeBanner: false, home: futuroDeCarga(funcionFutura));
  }

  // Future builder que devuelve un circular progress indicator
  // hasta que la carga de la pagina ha sido completada con exito.
  FutureBuilder<bool> futuroDeCarga(Future<bool> funcionFutura) {
    return FutureBuilder(
        // Funcion que imita una funcion asincrona.
        future: funcionFutura,

        // builder que decide que se devuelve mientras que la funcion asincrona completa.
        builder: (context, snapshot) {
          // Si el snapshot devuelve error se muestra por texto.
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text(error.toString());
          }

          // Si el snapshot devuelve el dato esperado invoca la pantalla pertinente.
          else if (snapshot.hasData) {
            return const BeachParkScreen();
          }

          // Si no hay error y no ha completado la carga devuelve el indicador de carga.
          else {
            return Stack(
              children: [
                Image.asset("assets/img/fondoInicial.png"),
                const Center(
                    child: CircularProgressIndicator(
                  color: Colors.amber,
                ))
              ],
            );
          }
        });
  }
}
