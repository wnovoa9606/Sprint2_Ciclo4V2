import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba1/controlador/controlador.dart';

class pag2_comprar extends StatefulWidget {
  const pag2_comprar({super.key});

  @override
  State<pag2_comprar> createState() => _pag2_comprarState();
}

class _pag2_comprarState extends State<pag2_comprar> {
  controlador control_comprar = Get.find(); // se instancia el controlador
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx((() => ListView.builder(
              itemCount: control_comprar.instancia_productos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: Image(
                        image: NetworkImage(control_comprar
                            .instancia_productos[index]
                            .imagen)), // se trae la imagen de la clase producto en la posicion index
                    title: Text(control_comprar
                            .instancia_productos[index].nombre +
                        " - " +
                        control_comprar.instancia_productos[index].precio
                            .toString()), // se trae el nombre de la clase producto en la posicion index
                    trailing: Text(control_comprar.instancia_productos[index]
                        .cantidad // se trae la cantidad de la clase producto en la posicion index
                        .toString()),
                    subtitle: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (control_comprar
                                          .instancia_productos[index].cantidad -
                                      1 <
                                  0) {
                                int nueva_cantidad = 0;
                                control_comprar.CambiarCantidad(
                                    index, nueva_cantidad);
                                control_comprar.instancia_productos.refresh();
                              } else {
                                int nueva_cantidad = control_comprar
                                        .instancia_productos[index].cantidad -
                                    1; // se realiza la operacion aritmetica para añadir o quitar cantidades
                                control_comprar.CambiarCantidad(
                                    index, nueva_cantidad);
                                control_comprar.instancia_productos.refresh();
                              }
                            },
                            icon: Icon(Icons.arrow_downward_outlined)),
                        VerticalDivider(),
                        IconButton(
                            onPressed: () {
                              int nueva_cantidad = control_comprar
                                      .instancia_productos[index].cantidad +
                                  1; // se realiza la operacion aritmetica para añadir o quitar cantidades
                              control_comprar.CambiarCantidad(
                                  index, nueva_cantidad);
                              control_comprar.instancia_productos.refresh();
                            },
                            icon: Icon(Icons.arrow_upward_outlined))
                      ],
                    ));
              },
            ))));
  }
}
