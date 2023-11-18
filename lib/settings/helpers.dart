import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oonhecendo_organismo/pages/fase_page1.dart';
import 'package:oonhecendo_organismo/pages/fase_page2.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';

import '../main.dart';
import '../pages/pontuacao_page.dart';

class AppHelpers{

  static void calcularPontuacao(TypePontuacao typePontuacao){
    switch(typePontuacao){
      case TypePontuacao.Errou: GlobalVariables.pontuacao -= 10; break;
      case TypePontuacao.Dica: GlobalVariables.pontuacao -= 5; break;
    }
  }

  static void verificarProximaFase(BuildContext context){
    GlobalVariables.faseAtual++;

    if(GlobalVariables.pontuacao <= 0){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }else{
      switch(GlobalVariables.dificuldade){
        case TypeDificuldade.Facil: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GlobalVariables.faseAtual%2 == 0 ? PontucaoPage() : Fase2Page())); break;
        case TypeDificuldade.Medio: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GlobalVariables.faseAtual < 2 ? Fase1Page() : (GlobalVariables.faseAtual < 4 ? Fase2Page() : PontucaoPage()))); break;
        case TypeDificuldade.Dificil: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GlobalVariables.faseAtual < 3 ? Fase1Page() : (GlobalVariables.faseAtual < 6 ? Fase2Page() : PontucaoPage()))); break;
      }
    }
  }

}

enum TypePontuacao{
  Errou, Dica
}