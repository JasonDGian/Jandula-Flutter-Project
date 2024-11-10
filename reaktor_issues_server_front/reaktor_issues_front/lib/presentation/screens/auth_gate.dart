import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart'; // new
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';
import 'package:reaktor_issues_front/presentation/screens/ticket_screen.dart';
import 'package:reaktor_issues_front/shared/data/data_constants.dart';

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
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                color: const Color.fromARGB(255, 33, 56, 182),
              ),
              Expanded(
                child: SignInScreen(
                  providers: [
                    // Proveedor de correos.
                    //EmailAuthProvider(),
                    // Proveedor de google.
                    GoogleProvider(
                        clientId:
                            "350157611272-kofp037hl05ktlau0ddogh1gs28sr56f.apps.googleusercontent.com"), // new
                  ],
                  headerBuilder: (context, constraints, shrinkOffset) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(DataConstants.imagenHero),
                      ),
                    );
                  },
                  subtitleBuilder: (context, action) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: action == AuthAction.signIn
                          ? const Text(DataConstants.mensajeBienvenida)
                          : const Text(DataConstants.mensajeBienvenida),
                    );
                  },
                  footerBuilder: (context, action) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        DataConstants.subtituloLogin,
                        style:
                            TextStyle(color: Color.fromARGB(255, 228, 23, 23)),
                      ),
                    );
                  },
                  sideBuilder: (context, shrinkOffset) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(DataConstants.imagenHero)),
                    );
                  },
                ),
              ),
              Container(
                //height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                color: const Color.fromARGB(255, 33, 56, 182),
                child: MediaQuery.of(context).size.width * 0.3 < 300
                    ? const SizedBox()
                    : Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              "- Aviso legal -",
                              style: TextStyle(
                                  color: Color.fromARGB(193, 248, 246, 246),
                                  fontSize: 11,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.1,
                              ),
                              const FooterTextBox(
                                  data: DataConstants.avisoParrafo1),
                              const FooterTextBox(
                                  data: DataConstants.avisoParrafo2),
                              const FooterTextBox(
                                  data: DataConstants.avisoParrafo3),
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.1,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
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

class FooterTextBox extends StatelessWidget {
  final String data;

  const FooterTextBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        data,
        style: const TextStyle(
            color: Color.fromARGB(137, 255, 255, 255),
            fontSize: 10,
            decoration: TextDecoration.none),
      ),
    ));
  }
}
