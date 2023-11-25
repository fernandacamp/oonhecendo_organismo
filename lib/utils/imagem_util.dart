import 'dart:math';

import 'package:oonhecendo_organismo/main.dart';
import 'package:oonhecendo_organismo/models/opcao_model.dart';

class ImagemUtil{

  static OpcaoModel sortearImagens(){
    int x = Random().nextInt(5)+1;

    late OpcaoModel model;

    switch(x){
      case 1: model = OpcaoModel(path: "assets/images/olho.png", selected: false, certoErrado: false, pathAudio: "OlhoMp3");
      case 2: model = OpcaoModel(path: "assets/images/boca.png", selected: false, certoErrado: false, pathAudio: "BocaMp3");
      case 3: model = OpcaoModel(path: "assets/images/nariz.png", selected: false, certoErrado: false, pathAudio: "NarizMp3");
      case 4: model = OpcaoModel(path: "assets/images/cabeça.png", selected: false, certoErrado: false, pathAudio: "CabecaMp3");
      case 5: model = OpcaoModel(path: "assets/images/orelha.png", selected: false, certoErrado: false, pathAudio: "OrelhaMp3");
    }

    if(GlobalVariables.opcoesFase1.isEmpty || GlobalVariables.opcoesFase1.where((z) => z.path == model.path).isEmpty){
      GlobalVariables.opcoesFase1.add(model);

      return model;
    }

    return sortearImagens();
  }

  static OpcaoModel sortearImagens2(){
    int x = Random().nextInt(4)+1;

    late OpcaoModel model;

    switch(x){
      case 1: model = OpcaoModel(path: "assets/images/cabeça-olhos.png", selected: false, certoErrado: false, pathAudio: "OlhoMp3");
      case 2: model = OpcaoModel(path: "assets/images/cabeça-boca.png", selected: false, certoErrado: false, pathAudio: "BocaMp3");
      case 3: model = OpcaoModel(path: "assets/images/cabeça-nariz.png", selected: false, certoErrado: false, pathAudio: "NarizMp3");
      case 4: model = OpcaoModel(path: "assets/images/cabeça-orelhas.png", selected: false, certoErrado: false, pathAudio: "OrelhaMp3");
    }

    if(GlobalVariables.opcoesFase2.isEmpty || GlobalVariables.opcoesFase2.where((z) => z.path == model.path).isEmpty){
      GlobalVariables.opcoesFase2.add(model);

      return model;
    }

    return sortearImagens2();
  }

}