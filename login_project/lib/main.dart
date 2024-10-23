import 'package:flutter/material.dart';
import 'package:login_project/config/router/go_router.dart';
import 'package:login_project/presentation/providers/user_detail_provider.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailProvider() )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Aplicación flutter',
        routerConfig: myRouter,
      ),
    );
  }
}
