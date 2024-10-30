import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/config/router/go_router.dart';
import 'package:firebaselogin/firebase_options.dart';
import 'package:firebaselogin/presentation/providers/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final name = "my_app";

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserDetailProvider()..obtenDetallesValidacion(),
          lazy: false,
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        title: "mi aplicacion de login",
        routerConfig: myRouter,
      ),
    );
  }
}
