import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';
import 'package:reaktor_issues_front/presentation/screens/ticket_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                DataProvider(), // añadir llamada inicial al proveedor.
          )
        ],
        child: const MaterialApp(
            title: 'Incidencias Reaktor DJG', home: TicketScreen()));
  }
}
