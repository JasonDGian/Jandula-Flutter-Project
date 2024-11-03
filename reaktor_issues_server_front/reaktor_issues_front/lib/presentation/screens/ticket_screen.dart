import 'package:flutter/material.dart';
import 'package:reaktor_issues_front/presentation/widgets/formulario_descripcion.dart';
import 'package:reaktor_issues_front/presentation/widgets/selector_fecha.dart';
import 'package:reaktor_issues_front/presentation/widgets/selector_numero_aula.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectorAula = const SelectorNumeroAula();
    var selectorFecha = const SelectorFecha();
    var formularioDescripcion = const FormularioDescripcion();
    var size = MediaQuery.of(context).size;

    var columnaFormulario = Column(
      children: [
        const Text(
          "Señalar incidencia",
          style: TextStyle(
              fontSize: 30, color: const Color.fromARGB(255, 20, 94, 155)),
        ),
        selectorAula,
        selectorFecha,
        formularioDescripcion
      ],
    );

    var contWidth = size.width * 0.3;
    var contWidth2 = size.width * 0.6;

    if (size.width * 0.3 < 280) {
      contWidth = size.width;
      contWidth2 = size.width;
    }

    var contenedor = Container(
      width: contWidth,
      color: Colors.amber,
      child: columnaFormulario,
    );

    var contenedor2 = Container(
      height: 800,
      width: contWidth2,
      color: const Color.fromARGB(255, 11, 88, 133),
    );

    var miPagina = Center(
      child: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          children: [contenedor, contenedor2],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Incidencias"),
        ),
        body: miPagina);
  }
}
