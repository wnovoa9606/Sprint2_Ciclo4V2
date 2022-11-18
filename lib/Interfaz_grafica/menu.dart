import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prueba1/controlador/controlador.dart'; //siempre se importa el paquete material

class Menu extends StatefulWidget {
  //se genera la clase que
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  controlador control_menu = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          // se genera el menu desplegable a la izquierda
          child: Column(
        children: [
          DrawerHeader(
            //
            decoration: BoxDecoration(color: Color.fromARGB(255, 254, 180, 83)),
            child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 108, 34, 15)),
                accountName: Text(
                  "User",
                ),
                accountEmail: Text("Mail")),
          ),
          Divider(),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: Text("Inicio"),
                leading: Icon(Icons.home_filled),
                trailing: Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  Navigator.pop(
                      context); // cada vez que se selecciona el widget, se cierra automaticamente
                  control_menu.cambiarposicion(0);
                },
              ),
              ListTile(
                title: Text("comprar"),
                leading: Icon(Icons.monetization_on_outlined),
                trailing: Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  Navigator.pop(context);
                  control_menu.cambiarposicion(1);
                },
              ),
              ListTile(
                title: Text("Mis Productos"),
                leading: Icon(Icons.shopify_outlined),
                trailing: Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  Navigator.pop(context);
                  control_menu.cambiarposicion(2);
                },
              ),
            ],
          ))
        ],
      )),
    );
  }
}
