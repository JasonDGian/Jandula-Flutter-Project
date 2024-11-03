import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';

class SelectorNumeroAula extends StatefulWidget {
  const SelectorNumeroAula({super.key});

  @override
  _SelectorNumeroAulaState createState() => _SelectorNumeroAulaState();
}

class _SelectorNumeroAulaState extends State<SelectorNumeroAula> {
  String aulaSeleccionada = "0.1";

  @override
  Widget build(BuildContext context) {
    final proveedor = context.watch<DataProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Numero de aula: "),
        const SizedBox(
          width: 30,
        ),
        DropdownButton<String>(
          icon: const Icon(Icons.arrow_drop_down_circle),
          value: aulaSeleccionada,
          items: proveedor.entradasNumAula,
          // Funcion que se triggerea al cambiar
          onChanged: (newValue) {
            setState(() {
              aulaSeleccionada = newValue!;
            });
          },
        )
      ],
    );
  }
}
