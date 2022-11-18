import 'package:flutter/material.dart'; // se importa la libreria Material para que se traigan las clases inherentes a Dart.
import 'package:prueba1/Interfaz_grafica/menu.dart';
import 'package:prueba1/Interfaz_grafica/pag1_inicio.dart';
import 'package:prueba1/Interfaz_grafica/pag2_comprar.dart';
import 'package:prueba1/Interfaz_grafica/pag3_mis_productos.dart';
import 'package:get/get.dart';
import 'package:prueba1/controlador/controlador.dart'; //se importa la libreria get

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // se cambia "MaterialApp" por "GetMaterialApp"
      debugShowCheckedModeBanner:
          false, // quita la etiqueta de debug en el aplicativo
      title: "Sprint2_Ciclo4",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Carrito de Compras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List paginas_navegacion = [
  pag1_inicio(),
  pag2_comprar(),
  pag3_mis_productos()
]; //se genera la lista y se trae cada uno de las paginas generaadas en otros archivos, con el objetivo de poder trabajar con ellar

class _MyHomePageState extends State<MyHomePage> {
  controlador Control = Get
      .find(); // se trae el controlador a la pagina principal con todos sus atributos y metodos, es una instancia
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          Menu(), // los elementos del Drawer se desarrollan en la clase "Menu", aca simplemente se trae la clase
      body: Obx((() => paginas_navegacion[
          Control // se genera de forma obx por que se esta tratando de variables que cambian de acuerdo al controlador
              .posicion_pagina])), // se determina que la pagina a la que va a redigir de acuerdo al archivo menu, esta dada de forma variable de acuerdo al item seleccionado, que trae el numero del item y por consiguiente la pagina a redirigir del listado creado arriba
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
