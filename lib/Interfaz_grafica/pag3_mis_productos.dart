import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:prueba1/controlador/controlador.dart';

class pag3_mis_productos extends StatefulWidget {
  const pag3_mis_productos({super.key});

  @override
  State<pag3_mis_productos> createState() => _pag3_mis_productosState();
}

class _pag3_mis_productosState extends State<pag3_mis_productos> {
  controlador control_mis_productos = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx((() => Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: control_mis_productos.instancia_productos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return control_mis_productos
                                .instancia_productos[index].cantidad ==
                            0
                        ? Text(
                            "") // se genera la condicion de que si la concidion es 0, no ejecute el codigo de abajo, de lo ocntrario si
                        : ListTile(
                            leading: Image(
                                image: NetworkImage(control_mis_productos
                                    .instancia_productos[index].imagen)),
                            title: Text(control_mis_productos
                                .instancia_productos[index].nombre),
                            subtitle: Text("Precio: " +
                                control_mis_productos
                                    .instancia_productos[index].precio
                                    .toString() +
                                " - " +
                                "Cantidad seleccionada: " +
                                control_mis_productos
                                    .instancia_productos[index].cantidad
                                    .toString()),
                            trailing: Text((control_mis_productos
                                        .instancia_productos[index].cantidad *
                                    control_mis_productos
                                        .instancia_productos[index].precio)
                                .toString()));
                  },
                ),
              ),
              Divider(),
              Text(
                "Total a pagar:" +
                    control_mis_productos.calcular_total().toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              ElevatedButton.icon(
                  onPressed: () {
                    Alert(
                        type: AlertType.success,
                        context: context,
                        title: "CAUTION",
                        desc: "Compra Realizada",
                        buttons: [
                          DialogButton(
                              child: Text("Cerrar"),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ]).show();
                  },
                  icon: Icon(Icons.card_giftcard_sharp),
                  label: Text("Calcular"))
            ],
          ),
        )));
  }
}
