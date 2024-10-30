import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_project/config/router/go_router.dart';
import 'package:login_project/config/theme/app_theme.dart';
import 'package:login_project/firebase_options.dart';
import 'package:login_project/presentation/providers/user_detail_provider.dart';
import 'package:provider/provider.dart';

void main()  async {
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
          create: (_) => UserDetailProvider(),
          lazy: false, // Con esto hará una carga en cuanto sea llamado.
        )
      ],
      child: MaterialApp.router(
        theme: AppTheme(selectedColor: 1).theme(),
        debugShowCheckedModeBanner: false,
        title: 'Aplicación flutter',
        routerConfig: myRouter,
      ),
    );
  }
}
