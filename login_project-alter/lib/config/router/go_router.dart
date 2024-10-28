// Enrutador de trafico de aplicacion.
import 'package:go_router/go_router.dart';
import 'package:login_project/screens/home_screen/home_screen.dart';
import 'package:login_project/screens/login/login_screen.dart';

// Clase router llamada por la aplicación para "saber como navegar"
final GoRouter myRouter = GoRouter(

    // Primera ubicación cargada: La raiz de la aplicación.
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: const LoginScreen().name, // login_screen.
          builder: (context, state) {
            return const LoginScreen();
          },

          // Rutas que cuelgan de '/'
          routes: [
            // Pantalla que invocada al hacer login.
            GoRoute(
              path: '/home_screen/:username:pass',
              name: const HomeScreen().name,
              builder: (context, state) {
                return HomeScreen(
                  username: state.pathParameters['username'],
                  pass: state.pathParameters['pass'],
                );
              },
            ),
          ]),
    ]);
