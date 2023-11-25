import 'dart:math';

import 'package:oonhecendo_organismo/models/opcao_model.dart';

class ImagemUtil{

  static OpcaoModel sortearImagens(){
    int x = Random().nextInt(5)+1;

    switch(x){
      case 1: return OpcaoModel(path: "assets/images/olho.png", selected: false, certoErrado: false, pathAudio: "OlhoMp3");
      case 2: return OpcaoModel(path: "assets/images/boca.png", selected: false, certoErrado: false, pathAudio: "BocaMp3");
      case 3: return OpcaoModel(path: "assets/images/nariz.png", selected: false, certoErrado: false, pathAudio: "NarizMp3");
      case 4: return OpcaoModel(path: "assets/images/cabeça.png", selected: false, certoErrado: false, pathAudio: "CabecaMp3");
      case 5: return OpcaoModel(path: "assets/images/orelha.png", selected: false, certoErrado: false, pathAudio: "OrelhaMp3");
    }

    return OpcaoModel(path: "assets/images/olho.png", selected: false, certoErrado: false, pathAudio: "OlhoMp3");
  }

  static OpcaoModel sortearImagens2(){
    int x = Random().nextInt(5)+1;

    switch(x){
      case 1: return OpcaoModel(path: "assets/images/cabeça-olhos.png", selected: false, certoErrado: false, pathAudio:"" );
      case 2: return OpcaoModel(path: "assets/images/cabeça-boca.png", selected: false, certoErrado: false, pathAudio:"" );
      case 3: return OpcaoModel(path: "assets/images/cabeça-nariz.png", selected: false, certoErrado: false, pathAudio:"" );
      case 5: return OpcaoModel(path: "assets/images/cabeça-orelhas.png", selected: false, certoErrado: false, pathAudio:"" );
    }

    return OpcaoModel(path: "assets/images/cabeça-olhos.png", selected: false, certoErrado: false, pathAudio:"" );
  }

}