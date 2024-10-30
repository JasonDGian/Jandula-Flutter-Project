import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_project/domain/models/user_model.dart';
import 'package:login_project/presentation/providers/user_detail_provider.dart';

class HomeScreen extends StatelessWidget {
  final name = "home_screen";

  const HomeScreen({super.key, this.username, this.pass});

  final String? username;
  final String? pass;

  @override
  Widget build(BuildContext context) {
    // Recoge el tamaño del mediaquery.
    final size = MediaQuery.of(context).size;

    const botonAceptar = "Volver a login";
    const tituloError = "Login fallido";
    const mensajeError = "Usuario o contraseña incorrecta.";

    const dialogoMensajeError = LoginErrorDialog(
        mensajeError: mensajeError,
        tituloError: tituloError,
        botonAceptar: botonAceptar);

    // Recoge ancho y largo del mediaquery.
    final mqWidth = size.width;
    final mqHeight = size.height;
    final proveedor = UserDetailProvider();

    // Futuro empleado en el builder.
    Future<bool> controlLogin() async {
      // Esperamos a que el proveedor obtenga la lista.
      await proveedor.obtenDetallesValidacion();
      // Controla el usuario para coincidencias.
      for (UserModel user in proveedor.listadoUsuarios) {
        if (user.nombre == username && user.clave == pass) {
          return true;
        }
      }
      return false;
    }

    // Throbber dimensionado.
    const cargando = Center(
      child:
          SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
    );

    // Pagina devuelta al usuario autenticado.
    final pagina = Scaffold(
      appBar: AppBar(
        title: Text(username ?? "null name"),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
            child: IconButton(
                tooltip: "Cerrar sesión.",
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.logout_outlined)),
          )
        ],
      ),
      body: Container(
        color: Colors.amber,
        width: mqWidth,
        height: mqHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 350,
                  width: 250,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                Container(
                  height: 350,
                  width: 250,
                  color: const Color.fromARGB(255, 71, 173, 114),
                ),
                Container(
                  height: 350,
                  width: 250,
                  color: const Color.fromARGB(255, 233, 68, 68),
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 350,
                    width: 250,
                    color: const Color.fromARGB(255, 197, 153, 153),
                  ),
                  Container(
                    height: 350,
                    width: 250,
                    color: const Color.fromARGB(255, 148, 187, 76),
                  ),
                  Container(
                    height: 350,
                    width: 250,
                    color: const Color.fromARGB(255, 161, 64, 145),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: const Color.fromARGB(255, 63, 58, 58),
            )
          ],
        ),
      ),
    );

    // Future builder para cargar pagina o throbber.
    return FutureBuilder(
        future: controlLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            context.pop();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return pagina;
            }
            if (snapshot.data == false) {
              return dialogoMensajeError;
            }
            return dialogoMensajeError;
          }
          // Si la conexión no ha terminado entonces mostrar throbber.
          else {
            return cargando;
          }
        });
  }
}

class LoginErrorDialog extends StatelessWidget {
  const LoginErrorDialog(
      {super.key,
      required this.mensajeError,
      required this.tituloError,
      required this.botonAceptar});

  final String mensajeError;
  final String tituloError;
  final String botonAceptar;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(child: Text(tituloError)),
        content: Text(mensajeError),
        actions: [
          // Boton que cierra la ventana actual.
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: FilledButton(
                  onPressed: () => context.pop(), child: Text(botonAceptar)),
            ),
          )
        ]);
  }
}
