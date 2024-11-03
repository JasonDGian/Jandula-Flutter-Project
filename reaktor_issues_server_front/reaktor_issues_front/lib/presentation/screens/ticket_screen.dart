import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';
import 'package:reaktor_issues_front/presentation/widgets/formulario_descripcion.dart';
import 'package:reaktor_issues_front/presentation/widgets/selector_fecha.dart';
import 'package:reaktor_issues_front/presentation/widgets/selector_numero_aula.dart';
import 'package:reaktor_issues_front/presentation/widgets/ticket_record.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectorAula = const SelectorNumeroAula();
    var selectorFecha = const SelectorFecha();
    var formularioDescripcion = const FormularioDescripcion();
    var size = MediaQuery.of(context).size;

    final proveedor = context.watch<DataProvider>();

    final textButton = TextButton.icon(
      onPressed: () {},
      label: const Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          "Señalar incidencia",
          style: TextStyle(color: Colors.white),
        ),
      ),
      icon: const Icon(Icons.announcement),
      style: const ButtonStyle(
          iconColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(
            Color.fromARGB(255, 11, 88, 133),
          )),
    );

    const recordatorio = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          "recuerde verificar la existencia de dkflañflksañdfjklsadñfjlaksñfjalksjfalñsdjasñfl"),
    );

    var columnaFormulario = Column(
      children: [
        const Text(
          "Señalar incidencia",
          style:
              TextStyle(fontSize: 30, color: Color.fromARGB(255, 20, 94, 155)),
        ),
        selectorAula,
        selectorFecha,
        formularioDescripcion,
        recordatorio,
        textButton
      ],
    );

    var contWidth = size.width * 0.33;
    var contWidth2 = size.width * 0.63;

    if (size.width * 0.3 < 280) {
      contWidth = size.width;
      contWidth2 = size.width;
    }

    var contenedor = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: contWidth,
      //color: Colors.amber,
      child: columnaFormulario,
    );

    var contenedor2 = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      height: size.height * 0.8,
      width: contWidth2,
      //color: const Color.fromARGB(255, 11, 88, 133),
      child: ListView.builder(
        itemCount: proveedor.incidencias.length,
        itemBuilder: (context, index) {
          return TicketRecord(incidencia: proveedor.incidencias[index]);
          //return Text(proveedor.incidencias[index].toString());
        },
      ),
    );

    var miPagina = Center(
      child: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            contenedor,
            SizedBox(
              width: size.width * 0.01,
            ),
            contenedor2
          ],
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
