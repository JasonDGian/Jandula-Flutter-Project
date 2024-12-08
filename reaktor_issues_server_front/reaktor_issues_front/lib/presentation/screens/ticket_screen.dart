import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/domain/models/incidencia_dto.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';
import 'package:reaktor_issues_front/presentation/widgets/formulario_descripcion.dart';
import 'package:reaktor_issues_front/presentation/widgets/selector_fecha.dart';
import 'package:reaktor_issues_front/presentation/widgets/selector_numero_aula.dart';
import 'package:reaktor_issues_front/presentation/widgets/ticket_record.dart';
import 'package:reaktor_issues_front/shared/data/data_constants.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //IncidenciaDto incidenciaTemporal;
    //String numeroAula;

    TextEditingController tcDescripcion = TextEditingController();
    TextEditingController tcNumeroAula = TextEditingController();
    TextEditingController tcFecha = TextEditingController();

    void funcionNumeroAula(String numeroAula) {
      tcNumeroAula.text = numeroAula;
    }

    // Widget selector de aula, recibe una función que
    // define el comportamiento del valor seleccionado.
    var selectorAula = SelectorNumeroAula(
      funcion: funcionNumeroAula,
    );
    var selectorFecha = SelectorFecha(controller: tcFecha);

    // Formulario de descripcion que espera un text controller.
    var formularioDescripcion = FormularioDescripcion(
      paramController: tcDescripcion,
    );

    var size = MediaQuery.of(context).size;

    final proveedor = context.watch<DataProvider>();
    final listado = proveedor.incidencias;
    String usuarioAppbar = proveedor.usuario;

    // Bloque que calcula el ancho de los contenedores.
    var anchoContenedorFormulario = size.width * 0.25;
    var anchoContenedorIncidencias = size.width * 0.7;
    if (size.width * 0.3 < 280) {
      anchoContenedorFormulario = size.width;
      anchoContenedorIncidencias = size.width;
    }

    final textButton = TextButton.icon(
      onPressed: () {
        // LOGICA DE CREACION Y ENVIO.
        proveedor.descripcion = tcDescripcion.text;
        proveedor.numero = tcNumeroAula.text;
        proveedor.fecha = DateTime.now();
        proveedor.comentario = "";
        proveedor.estado = DataConstants.estadoPendiente;
        proveedor.crearIncidencia(); // Carga la incidencia.
      },
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
      child: Column(
        children: [
          Text(
            DataConstants.avisoFormularioIncidencias1,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Text(
            DataConstants.avisoFormularioIncidencias2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    // Decoracion de contenedor.
    var boxDecoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15));

    // Contenedor izquierdode elementos del formulario.
    var contenedorFormulario = Container(
      decoration: boxDecoration,
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: anchoContenedorFormulario,
      child: Column(
        children: [
          const Text(
            DataConstants.tituloFormularioIncidencias,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 20, 94, 155)),
          ),
          selectorAula,
          selectorFecha,
          formularioDescripcion,
          recordatorio,
          textButton
        ],
      ),
    );

    funcionActualizar(IncidenciaDto incidencia) {
      proveedor.modificarIncidencia(incidencia);
    }

    // Contenedor derecho que contiene el listado de incidencias.
    var contenedorIncidencias = Container(
      decoration: boxDecoration,
      padding: const EdgeInsets.all(10),
      height: size.height * 0.88,
      width: anchoContenedorIncidencias,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Boton de buscar incidencias.
            // TODO: Escribir formulario de busqueda.
            TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "Buscar incidencia",
                ),
                icon: const Icon(Icons.search)),
            const Text("Incidencias",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 20, 94, 155))),
            // Boton de actualizar incidencias o recargar.
            TextButton.icon(
                onPressed: () {
                  proveedor.buscaIncidencias();
                },
                label: const Text(
                  "Actualizar.",
                ),
                icon: const Icon(Icons.refresh)),
          ]),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listado.length,
              itemBuilder: (context, index) {
                return TicketRecord(
                    incidencia: listado[index],
                    funcionActualizar: funcionActualizar);
              },
            ),
          ),
        ],
      ),
    );

    // Barra de navegación de la pagina.
    var appBar = AppBar(
      elevation: 5.0,
      backgroundColor: Colors.white,
      title: const Text("Incidencias"),
      actions: [
        Text(usuarioAppbar),
        const SizedBox(width: 20),
        const SignOutButton() // personalizar este boton
      ],
    );

    // Cuerpo de la pagina mostrada..
    var body = Container(
      color: const Color.fromARGB(255, 207, 218, 230),
      child: Center(
        child: SingleChildScrollView(
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              contenedorFormulario,
              SizedBox(
                width: size.width * 0.01,
              ),
              contenedorIncidencias
            ],
          ),
        ),
      ),
    );

    // Retorno de la vista.
    return SafeArea(child: Scaffold(appBar: appBar, body: body));
  }
}
