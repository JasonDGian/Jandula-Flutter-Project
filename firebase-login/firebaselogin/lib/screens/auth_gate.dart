import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebaselogin/main.dart';
import 'package:firebaselogin/presentation/providers/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  final name = "auth_gate";

  @override
  Widget build(BuildContext context) {
    // Proveedor de listado de usuarios autorizados.
    final proveedor = context.watch<UserDetailProvider>();

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              // Proveedor de correos.
              //EmailAuthProvider(),
              // Proveedor de google.
              GoogleProvider(
                  clientId:
                      "735294905016-585tgkr2hdjo48rtjshtfhqk7v7jh5gp.apps.googleusercontent.com")
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      'https://www.shutterstock.com/image-photo/litte-cute-birman-cat-jumping-600nw-2462995331.jpg'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to FlutterFire, please sign in!')
                    : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder: (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                        'https://www.shutterstock.com/image-photo/litte-cute-birman-cat-jumping-600nw-2462995331.jpg')),
              );
            },
          );
        }
        String? correo = snapshot.data?.email;
        String? username = snapshot.data?.displayName;

        return proveedor.usuarioAutorizado(correo)
            ? HomeScreen(username: username)
            : const LoginErrorDialog(
                botonAceptar: "Volver al login.",
                tituloError: "Usuario no autorizado.",
                mensajeError:
                    "El usuario empleado para iniciar sesión no está dado de alta en nuestras bases de datos.",
              );
      },
    );
  }
}

// Mensaje error devuelto.
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
                  onPressed: () => const MyApp(), child: Text(botonAceptar)),
            ),
          )
        ]);
  }
}
