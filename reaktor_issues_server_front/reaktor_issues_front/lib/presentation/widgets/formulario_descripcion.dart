import 'package:flutter/material.dart';

class FormularioDescripcion extends StatelessWidget {
  const FormularioDescripcion({super.key});

  // PONER EL CONTROLADOR DE TEXTO Y FUNCION DE SUBMIT
  // https://bosctechlabs.com/create-multi-line-textfield-input-like-textarea-flutter/
  // https://youtu.be/Y_1SHNI__6I

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Descripcion de la incidencia",
                fillColor: Color.fromARGB(255, 252, 240, 217),
                filled: true),
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: 4,
          ),
        ),
      ),
    );
  }
}
