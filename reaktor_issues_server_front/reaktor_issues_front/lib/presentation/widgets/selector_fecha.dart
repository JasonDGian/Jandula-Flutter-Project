import 'package:flutter/material.dart';

class SelectorFecha extends StatelessWidget {
  const SelectorFecha({super.key});

  @override
  Widget build(BuildContext context) {
    final controladorTexto = TextEditingController();

    Future<void> seleccionaFecha(context) async {
      DateTime? seleccionada = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime(2124));

      if (seleccionada != null) {
        controladorTexto.text = seleccionada
            .toString()
            .split(" ")[0]; //controlar el formato tostring
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controladorTexto,
          decoration: inputDecor,
          readOnly: true,
          onTap: () {
            seleccionaFecha(context);
          },
        ),
      ),
    );
  }
}

const inputDecor = InputDecoration(
  labelText: 'FECHA',
  filled: true,
  prefix: Icon(Icons.calendar_today),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue),
  ),
);
