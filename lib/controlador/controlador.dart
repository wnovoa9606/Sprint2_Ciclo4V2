import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Clases/productos.dart';

class controlador extends GetxController {
  final _numero_pagina_posicion = 0.obs;
  final instancia_productos = <productos>[]
      .obs; // se crea la variable "instancia_productos" de tipo clase productos

  @override
  void onInit() {
    // se realiza el OnInit para asignar valores a los atributos de la clase productos
    instancia_productos.add(productos(
        "SKU0001",
        "LG UHD TV",
        "https://www.lg.com/co/images/televisores/md07504655/gallery/1100_01_v1.jpg",
        0,
        1800000));
    super.onInit();
    instancia_productos.add(productos(
        "SKU0002",
        "LG FHD TV",
        "https://www.lg.com/co/images/televisores/md06104576/gallery/Medium-1100x730-01.jpg",
        0,
        2500000));
    super.onInit();
    instancia_productos.add(productos(
        "SKU0003",
        "XIAOMI 55 TV",
        "https://exitocol.vtexassets.com/arquivos/ids/15482599/Televisor-XIAOMI-55-Pulgadas-Uhd-4K-Smart-Tv-Televisor-Xiaomi-55-P1-4K-UHD-LED-3220005_c.jpg?v=638041668935170000",
        0,
        4000000));
    super.onInit();
  }

  void cambiarposicion(int x) {
    _numero_pagina_posicion.value = x;
  }

  int get posicion_pagina => _numero_pagina_posicion.value;

  void CambiarCantidad(int posicion, int valor) {
    instancia_productos[posicion].cantidad = valor;
  }

  int calcular_total() {
    int Total = 0;
    for (var i = 0; i < instancia_productos.length; i++) {
      Total = Total +
          instancia_productos[i].precio * instancia_productos[i].cantidad;
    }
    return Total;
  }
}
