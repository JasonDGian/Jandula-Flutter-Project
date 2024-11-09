import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart'; // new
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';
import 'package:reaktor_issues_front/presentation/screens/ticket_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Proveedor para datos de usuario e incidencias.
    final proveedor = context.watch<DataProvider>();

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              // Proveedor de correos.
              EmailAuthProvider(),
              // Proveedor de google.
              GoogleProvider(
                  clientId:
                      "735294905016-585tgkr2hdjo48rtjshtfhqk7v7jh5gp.apps.googleusercontent.com"), // new
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('flutterfire_300x.png'),
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

        if (correo != null && correo.isNotEmpty) {
          proveedor.correo = correo;
          proveedor.usuario = username.toString();
        }

        return const TicketScreen();
      },
    );
  }
}
