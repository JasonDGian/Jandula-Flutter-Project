import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaktor_issues_front/firebase_options.dart';
import 'package:reaktor_issues_front/presentation/providers/data_provider.dart';
import 'package:reaktor_issues_front/presentation/screens/auth_gate.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              lazy: false, create: (_) => DataProvider()..buscaIncidencias())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.blue),
          title: 'David Jason Gianmoena',
          home: const AuthGate(),
        ));
  }
}
