import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  // Listado de numeros de aulas recuperado por el proveedor.
  List<String> numeroAula = ["0.5", "0.7"];

  List<DropdownMenuItem<String>> entradasNumAula = const [
    DropdownMenuItem<String>(value: "0.1", child: Text("0.1")),
    DropdownMenuItem<String>(value: "0.2", child: Text("0.2")),
    DropdownMenuItem<String>(value: "0.3", child: Text("0.3")),
    DropdownMenuItem<String>(value: "0.4", child: Text("0.4")),
    DropdownMenuItem<String>(value: "0.5", child: Text("0.5")),
  ];
}
