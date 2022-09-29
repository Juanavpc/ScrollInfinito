import 'package:clase_22_09_22/Pages/Home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación Gifs',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MyHomeApp(title: 'Aplicación de Gifs')
      },
    );
  }
}