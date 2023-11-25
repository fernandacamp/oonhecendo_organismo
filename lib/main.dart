import 'package:flutter/material.dart';
import 'package:oonhecendo_organismo/pages/config_page.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';
import 'pages/fase_page1.dart';
import 'pages/fase_page2.dart';
import 'pages/pontuacao_page.dart';

void main() {
  runApp(const MyApp());
}

class GlobalVariables{

  static late TypeDificuldade dificuldade;
  static int pontuacao = 100;
  static int faseAtual = 0;
  static double volume = 1;
  static bool narracao = false;

}

enum TypeDificuldade{
  Facil, Medio, Dificil
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Conhecendo o Organismo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

