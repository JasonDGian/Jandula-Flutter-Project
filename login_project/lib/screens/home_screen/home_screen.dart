import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final name = "home_screen";

  const HomeScreen({super.key, this.username});

  final String? username;

  @override
  Widget build(BuildContext context) {
    // Recoge el tamaño del mediaquery.
    final size = MediaQuery.of(context).size;

    // Recoge ancho y largo del mediaquery.
    final mqWidth = size.width;
    final mqHeight = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(username ?? "null name"),
        actions: [
          TextButton.icon(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.logout),
              label: const Text("Cerrar sesión"))
        ],
      ),
      body: Container(
        color: Colors.amber,
        width: mqWidth,
        height: mqHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 350,
                  width: 250,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                Container(
                  height: 350,
                  width: 250,
                  color: const Color.fromARGB(255, 71, 173, 114),
                ),
                Container(
                  height: 350,
                  width: 250,
                  color: const Color.fromARGB(255, 233, 68, 68),
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 350,
                    width: 250,
                    color: const Color.fromARGB(255, 197, 153, 153),
                  ),
                  Container(
                    height: 350,
                    width: 250,
                    color: const Color.fromARGB(255, 148, 187, 76),
                  ),
                  Container(
                    height: 350,
                    width: 250,
                    color: const Color.fromARGB(255, 161, 64, 145),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: const Color.fromARGB(255, 63, 58, 58),
            )
          ],
        ),
      ),
    );
  }
}
