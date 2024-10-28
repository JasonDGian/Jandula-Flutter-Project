import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_project/domain/models/user_model.dart';
import 'package:login_project/presentation/providers/user_detail_provider.dart';
import 'package:login_project/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  final name = "login_screen";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingSize = size.height * 0.05;

    final textControllerUser = TextEditingController();
    final textControllerPass = TextEditingController();
    final focusnodeUser = FocusNode();
    final focusnodePass = FocusNode();

    final underlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(25));

    var txtDecoration = InputDecoration(
      filled: true,
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
    );

    const decoracionFondo = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(1, 0.3),
            end: Alignment(0, 0),
            colors: [
          Color.fromARGB(255, 128, 212, 238),
          Color.fromARGB(255, 44, 0, 102)
        ]));

    const decoracionCuadro = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 15,
              offset: Offset(5, 5))
        ]);

    var proveedorDatos = UserDetailProvider();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      // Contenedor que da fondo a la pagina.
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: decoracionFondo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              // Contenedor que da aspecto al cuadro de inicio de sesion.
              Container(
                decoration: decoracionCuadro,
                height: size.height * 0.6 < 310 ? 310 : size.height * 0.6,
                width: size.width * 0.25 < 250 ? 250 : size.width * 0.25,
                child: Padding(
                  padding: EdgeInsets.all(paddingSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.person,
                        size: size.width * 0.05,
                      ),
                      const Text(
                        "LOG IN",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      // Formulario de introduccion de usuario.
                      _UserTextFormField(
                        focusnodeUser: focusnodeUser,
                        textControllerUser: textControllerUser,
                        txtDecoration: txtDecoration,
                        textControllerPass: textControllerPass,
                        proveedor: proveedorDatos,
                      ),
                      //Formulario de contraseña.
                      _PasswordTextFormField(
                        focusnodeUser: focusnodeUser,
                        focusnodePass: focusnodePass,
                        textControllerPass: textControllerPass,
                        txtDecoration: txtDecoration,
                        textControllerUser: textControllerUser,
                        proveedor: proveedorDatos,
                      ),
                      // Boton de login que recoge los valores
                      // almacenados en los formularios de texto.
                      _LoginTextButtonIcon(
                          textControllerUser: textControllerUser,
                          textControllerPass: textControllerPass)
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Colors.black
                    ])),
                height: size.height * 0.15,
              )
            ],
          ),
        ),
      ),
    ); // Return
  }
}

/*
* Formulario para introducir la contraseña.
*/
class _UserTextFormField extends StatelessWidget {
  const _UserTextFormField(
      {required this.focusnodeUser,
      required this.textControllerUser,
      required this.txtDecoration,
      required this.textControllerPass,
      required this.proveedor});

  final FocusNode focusnodeUser;
  final TextEditingController textControllerUser;
  final InputDecoration txtDecoration;
  final TextEditingController textControllerPass;
  final UserDetailProvider proveedor;

  @override
  Widget build(BuildContext context) {
    // Observa al proveedor.
    context.watch<UserDetailProvider>();

    return Column(
      children: [
        const Text("Introduce usuario:"),
        const SizedBox(
          height: 10,
        ),
        // Formulario de texto para el usuario.
        TextFormField(
          onTapOutside: (event) => focusnodeUser.unfocus,
          focusNode: focusnodeUser,
          controller: textControllerUser,
          decoration: txtDecoration,
          onFieldSubmitted: (value) {
            _inputCheckLoad(proveedor, context, textControllerUser.text,
                textControllerPass.text);
          },
        )
      ],
    );
  }
}

/*
* Formulario para introducir la contraseña.
*/
class _PasswordTextFormField extends StatelessWidget {
  const _PasswordTextFormField({
    required this.focusnodeUser,
    required this.focusnodePass,
    required this.textControllerPass,
    required this.txtDecoration,
    required this.textControllerUser,
    required this.proveedor,
  });

  final FocusNode focusnodeUser;
  final FocusNode focusnodePass;
  final TextEditingController textControllerPass;
  final InputDecoration txtDecoration;
  final TextEditingController textControllerUser;
  final UserDetailProvider proveedor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Introduce tu contraseña:"),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: true,
          onTapOutside: (event) => focusnodeUser.unfocus,
          focusNode: focusnodePass,
          controller: textControllerPass,
          decoration: txtDecoration,
          onFieldSubmitted: (value) async {
            _inputCheckLoad(proveedor, context, textControllerUser.text,
                textControllerPass.text);
          },
        )
      ],
    );
  }
}

/*
* Boton que confirma los formularios de texto 
* e invoca la pantalla de Home Screen mediante 
* un router 'goNamed'.
*/
class _LoginTextButtonIcon extends StatelessWidget {
  const _LoginTextButtonIcon({
    required this.textControllerUser,
    required this.textControllerPass,
  });

  final TextEditingController textControllerUser;
  final TextEditingController textControllerPass;

  @override
  Widget build(BuildContext context) {
    final proveedorDatos = UserDetailProvider();

    return TextButton.icon(
      onPressed: () async {
        // await _inputCheckLoad(proveedorDatos, context, textControllerUser.text,
        //     textControllerPass.text);
        _callHome(context, textControllerUser.text, textControllerPass.text);
      },
      icon: const Icon(Icons.login),
      label: const Text('Identificate'),
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
          foregroundColor: WidgetStatePropertyAll(Colors.white)),
    );
  }
}

Future<void> _inputCheckLoad(UserDetailProvider proveedorDatos,
    BuildContext context, String username, String pass) async {
  await proveedorDatos.obtenDetallesValidacion();

  if (_userMatchPass(username, pass, proveedorDatos)) {
    _callHome(context, username, pass);
  } else {
    // Mensaje de alerta de login fallido.
    _showAlertMessage(context);
  }
}

/* 
  * Metodo que invoca una ventana de error que informa al 
  * usuario de que algo ha fallado en el proceso de login. 
  */
_showAlertMessage(BuildContext context) {
  const botonAceptar = "Aceptar";
  const tituloError = "Login fallido";
  const mensajeError = "Usuario o contraseña incorrecta.";

  return showDialog(
      context: context,
      builder: (_) => (
              //Mensaje ventana que muestra.
              AlertDialog(
                  title: const Center(child: Text(tituloError)),
                  content: const Text(mensajeError),
                  actions: [
                // Boton que cierra la ventana actual.
                Center(
                  child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text(botonAceptar)),
                )
              ])));
}

/// Invoca la pantalla homescreen pasando el usuario con el que se titulará la appbar.
void _callHome(BuildContext context, String username, String pass) {
  // Invocación al router con parametro pasado.
  context.goNamed(const HomeScreen().name,
      pathParameters: {'username': username, 'pass': pass});
}

/// Metodo que comprueba si el usuario y contraseña almacenados matchean.
bool _userMatchPass(
    String username, String pass, UserDetailProvider proveedor) {
  for (UserModel user in proveedor.listadoUsuarios) {
    if (user.nombre == username && user.clave == pass) {
      return true;
    }
  }
  return false;
}
