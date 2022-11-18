import 'package:flutter/material.dart';
import 'package:get/get.dart'; // se debe importar la libreria Gte
import 'package:prueba1/controlador/controlador.dart';
import 'Interfaz_grafica/pag_principal.dart';

void main() {
  Get.put(
      controlador()); // trae el controlador al main para que pueda ser inicializado
  runApp(const MyApp());
}
