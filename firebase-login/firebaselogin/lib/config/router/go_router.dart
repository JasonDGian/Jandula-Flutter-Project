// Enrutador de trafico de aplicacion.
import 'package:firebaselogin/main.dart';
import 'package:firebaselogin/screens/auth_gate.dart';
import 'package:go_router/go_router.dart';

import '../../screens/home_screen.dart';

// Clase router llamada por la aplicación para "saber como navegar"
final GoRouter myRouter = GoRouter(

    // Primera ubicación cargada: La raiz de la aplicación.
    initialLocation: '/',
    routes: [
      // MyApp carga directamente AuthGate, pero le alimenta antes el provider iniciado.
      GoRoute(
          path: '/',
          name: const AuthGate().name,
          builder: (context, state) {
            return const AuthGate();
          },

          // Rutas que cuelgan de '/'
          routes: [
            // Pantalla que invocada al hacer login con parametro por path.
            GoRoute(
              path: '/home_screen/:username',
              name: const HomeScreen().name,
              builder: (context, state) {
                return const HomeScreen(
                    /*username: state.pathParameters['username'],*/
                    );
              },
            ),
          ]),
    ]);
