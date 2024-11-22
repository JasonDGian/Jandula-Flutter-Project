import 'package:flutter/material.dart';

class BeachParkScreen extends StatelessWidget {
  const BeachParkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Decoracion botones navbar.
    const decoracionTextoBotones = TextStyle(
      color: Colors.white,
    );

    // Decoracion contenedor botones naranja.
    var decorationContenedorNavbar = const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Color.fromARGB(255, 255, 255, 255));

    // Devuelve un ListTile personalizado.
    entradaMenu(icono, String texto, funcion) {
      return ListTile(
        leading: Icon(icono),
        title: Text(texto),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: funcion,
      );
    }

    var anchoImagenesTop = size.width * 0.42;
    var listaEntradasMenu = [
      // FILA COMPUESTA POR CONTENEDORES ATRACCIONES + RESTAURANTES
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Stack imagen ATRACCIONES -----------------------------------
          _contenedorImagenGradiente(
              anchoImagenesTop, "Atracciones", "assets/img/Fuente.png"),
          // SIZEDBOX SEPARADOR
          const SizedBox(
            width: 10,
          ),
          // Stack imagen RESTAURANTE -----------------------------------
          _contenedorImagenGradiente(
              anchoImagenesTop, "Restaurantes", "assets/img/restaurantes.png"),
        ],
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // SIZEDBOX SEPARADOR
        const SizedBox(
          height: 15,
        ),
        // Stack imagen MAPA -----------------------------------
        _contenedorImagenGradiente(
            size.width * 0.84, "Restaurantes", "assets/img/ParqueMapa.png"),
        // SIZEDBOX SEPARADOR
        const SizedBox(
          height: 15,
        ),
      ]),
      entradaMenu(Icons.storefront_outlined, "Tienda", () {}),
      entradaMenu(Icons.map_outlined, "Cómo llegar", () {}),
      entradaMenu(Icons.calendar_month_outlined, "Horario de apertura", () {}),
      entradaMenu(Icons.roller_shades_sharp, "Otros servicios", () {}),
      entradaMenu(Icons.sticky_note_2_sharp, "Normas de funcionamiento", () {}),
    ];

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
                decoration: decorationContenedorNavbar,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Contenedor de boton "Buscar"
                      Container(
                        width: anchoImagenesTop,
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
                        width: 2,
                      ),
                      // Contenedor de boton "Mis entradas"
                      Container(
                        width: anchoImagenesTop,
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

_contenedorImagenGradiente(anchoImagen, String textoCartel, String rutaImagen) {
  // Listado empleado en el ListViewBuilder como fuente para las entradas.
  const borderRadiusImagenes = BorderRadius.all(Radius.circular(10));

  // Estilo de texto para la fuente de las imagenes.
  const estiloTextoImagenes = TextStyle(color: Colors.white, fontSize: 20);

  // Decoracion contenedores imagenes (ATRACCIONES, RESTAURANTES, MAPA)
  const boxDecorationGradiente = BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.black, Colors.transparent],
        end: FractionalOffset.bottomCenter,
        begin: FractionalOffset.topCenter),
  );

  return ClipRRect(
    borderRadius: borderRadiusImagenes,
    child: Stack(
      children: [
        SizedBox(
            width: anchoImagen, // Ancho (double) que recibe por parametro.
            child: Image.asset(rutaImagen,
                fit: BoxFit.cover)), // Ruta que recibe por parametro.
        Positioned.fill(
          child: Container(
            decoration: boxDecorationGradiente,
          ),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: Text(
              textoCartel, // Texto que recibe por parametro.
              style: estiloTextoImagenes,
            )),
      ],
    ),
  );
}
