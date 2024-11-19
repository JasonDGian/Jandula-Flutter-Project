import 'package:flutter/material.dart';

class BeachParkScreen extends StatelessWidget {
  const BeachParkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const decoracionTextoBotones = TextStyle(
      color: Colors.white,
    );

    _entradaMenu(icono, String texto, funcion) {
      return ListTile(
        leading: Icon(icono),
        title: Text(texto),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: funcion,
      );
    }

    gradienteNegro() {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black, // Color negro en la parte superior
          Colors.transparent, // Transparente en la parte inferior
        ],
      );
    }

    var listaEntradasMenu = [
      // Fila de imagenes Fuente + Restaurantes.
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Stack imagen Fuente
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Container(
                    width: size.width * 0.40,
                    child: Image.asset("assets/img/Fuente.png",
                        fit: BoxFit.cover)),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        end: FractionalOffset.bottomCenter,
                        begin: FractionalOffset.topCenter),
                  ),
                ),
              ),
              const Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    "Atracciones",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          // Stack imagen Restaurante
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Container(
                    width: size.width * 0.40,
                    child: Image.asset("assets/img/restaurantes.png",
                        fit: BoxFit.fill)),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        end: FractionalOffset.bottomCenter,
                        begin: FractionalOffset.topCenter),
                  ),
                ),
              ),
              const Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    "Restaurantes",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ],
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 15,
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Container(
                  width: size.width * 0.80,
                  child: Image.asset("assets/img/ParqueMapa.png",
                      fit: BoxFit.fill)),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      end: FractionalOffset.bottomCenter,
                      begin: FractionalOffset.topCenter),
                ),
              ),
            ),
            const Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Restaurantes",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ]),
      _entradaMenu(Icons.storefront_outlined, "Tienda", () {}),
      _entradaMenu(Icons.map_outlined, "Cómo llegar", () {}),
      _entradaMenu(Icons.calendar_month_outlined, "Horario de apertura", () {}),
      _entradaMenu(Icons.roller_shades_sharp, "Otros servicios", () {}),
      _entradaMenu(
          Icons.sticky_note_2_sharp, "Normas de funcionamiento", () {}),
    ];

    var decoration = const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Color.fromARGB(255, 255, 255, 255));

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 8, 42, 94),
        child: Column(
          children: [
            // Elementos fijos
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white),
                Image.asset(
                  "assets/img/logo.png",
                  height: size.height * 0.2,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                    color: Colors.white)
              ],
            ),
            // Contenedor de barra de botones "Buscar" y "Mis entradas"
            Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Contenedor de boton "Buscar"
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        child: TextButton.icon(
                          onPressed: () {},
                          label: const Text("Buscar",
                              style: decoracionTextoBotones),
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      // Contenedor de boton "Mis entradas"
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        child: TextButton.icon(
                          onPressed: () {},
                          label: const Text("Mis entradas",
                              style: decoracionTextoBotones),
                          icon: const Icon(
                            Icons.ad_units_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            // Caja de elementos deslizables.
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListView.builder(
                  itemCount: listaEntradasMenu.length,
                  itemBuilder: (context, index) {
                    return listaEntradasMenu[index];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
