import 'package:flutter/material.dart';

class BeachParkScreen extends StatelessWidget {
  const BeachParkScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Row de navegacion.
    var navigationRow = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
              Image.network(""),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined))
            ],
          );

    // Estilo botones naranja.
    const decoracionBotones = BoxDecoration(
      color: Colors.orange);
    
    const decoracionTextoBotones = TextStyle(
      color: Colors.white,
    );

    var buttonRow = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: decoracionBotones,
                child: TextButton.icon(onPressed: (){}, label: const Text("Buscar", style: decoracionTextoBotones), icon: const Icon(Icons.search, color: Colors.white,),),
              ),
              Container(
                decoration: decoracionBotones,
                child: TextButton.icon(onPressed: (){}, label: const Text("Mis entradas", style: decoracionTextoBotones), icon: const Icon(Icons.ad_units_outlined, color: Colors.white,),),
              )
            ],
          );
    var scsvRowAtraccionesRestaurantes = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.amber,
          child: const Text("Atracciones"),
        ),
        Container(
          color: Colors.blue,
          child: const Text("Restaurantes"),
        )
      ],
    );
    var scsvMapa = Container(
                  color: Colors.green,
                  child: const Text("Mapa"),
                );

    _entradaMenu( icono, String texto ) {
        return 
        Row(
        children: [
          Icon(icono), 
          Text(texto),
          const Expanded(child: SizedBox()),
          const Icon(Icons.arrow_forward_ios)
        ],
      );
    }

    var listaEntradasMenu = [
      _entradaMenu(Icons.storefront_outlined, "Tienda"),
      _entradaMenu(Icons.map_outlined, "Cómo llegar"),
      _entradaMenu(Icons.calendar_month_outlined, "Horario de apertura"),
      _entradaMenu(Icons.roller_shades_sharp, "Otros servicios"),
      _entradaMenu(Icons.sticky_note_2_sharp, "Normas de funcionamiento"),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            // Elementos fijos
            Expanded(
              flex: 1,
              child: navigationRow,
              ),
            Expanded(
              flex: 1,
              child: buttonRow,
              ),
            // Elementos deslizables.
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  scsvRowAtraccionesRestaurantes,
                  scsvMapa,
                  Expanded(
                    child:
                    ListView.builder(
                      itemCount: listaEntradasMenu.length,
                      itemBuilder:(context, index) {
                        return listaEntradasMenu[index];
                      } , 
                    ) 
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}