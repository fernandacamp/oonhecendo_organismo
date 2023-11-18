import 'dart:math';

import 'package:oonhecendo_organismo/models/opcao_model.dart';

class ImagemUtil{

  static OpcaoModel sortearImagens(){
    int x = Random().nextInt(5)+1;

    switch(x){
      case 1: return OpcaoModel(path: "assets/images/olho.png", selected: false, certoErrado: false);
      case 2: return OpcaoModel(path: "assets/images/boca.png", selected: false, certoErrado: false);
      case 3: return OpcaoModel(path: "assets/images/nariz.png", selected: false, certoErrado: false);
      case 4: return OpcaoModel(path: "assets/images/cabeça.png", selected: false, certoErrado: false);
      case 5: return OpcaoModel(path: "assets/images/orelha.png", selected: false, certoErrado: false);
    }

    return OpcaoModel(path: "assets/images/olho.png", selected: false, certoErrado: false);
  }

  static OpcaoModel sortearImagens2(){
    int x = Random().nextInt(5)+1;

    switch(x){
      case 1: return OpcaoModel(path: "assets/images/cabeça-olhos.png", selected: false, certoErrado: false);
      case 2: return OpcaoModel(path: "assets/images/cabeça-boca.png", selected: false, certoErrado: false);
      case 3: return OpcaoModel(path: "assets/images/cabeça-nariz.png", selected: false, certoErrado: false);
      case 5: return OpcaoModel(path: "assets/images/cabeça-orelhas.png", selected: false, certoErrado: false);
    }

    return OpcaoModel(path: "assets/images/cabeça-olhos.png", selected: false, certoErrado: false);
  }

}