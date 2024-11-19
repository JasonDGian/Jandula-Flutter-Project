import 'package:flutter/material.dart';

class BeachParkScreen extends StatelessWidget {
  const BeachParkScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // Row de navegacion.
    var navigationRow = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
              Image.asset("assets/img/logo.png"),
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
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
                child: TextButton.icon(onPressed: (){}, label: const Text("Buscar", style: decoracionTextoBotones), icon: const Icon(Icons.search, color: Colors.white,),),
              ),
              const SizedBox(width: 1,),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
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

    _entradaMenu( icono, String texto, funcion ) {
        return 
          ListTile(
            leading: Icon(icono),
            title: Text(texto),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: funcion,
          );
    }

    var listaEntradasMenu = [
      scsvRowAtraccionesRestaurantes,
      scsvMapa,
      _entradaMenu(Icons.storefront_outlined, "Tienda", (){}),
      _entradaMenu(Icons.map_outlined, "Cómo llegar", (){}),
      _entradaMenu(Icons.calendar_month_outlined, "Horario de apertura", (){}),
      _entradaMenu(Icons.roller_shades_sharp, "Otros servicios", (){}),
      _entradaMenu(Icons.sticky_note_2_sharp, "Normas de funcionamiento", (){}),
    ];

    var decoration = const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      color: Colors.white
    );

    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Column(
          children: [
            // Elementos fijos
            navigationRow,
            Container(
              decoration: decoration,
              padding: const EdgeInsets.all(10),
              child: buttonRow),
            // Elementos deslizables.
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child:
                ListView.builder(
                  itemCount: listaEntradasMenu.length,
                  itemBuilder:(context, index) {
                    
                    return listaEntradasMenu[index];
                  } , 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}