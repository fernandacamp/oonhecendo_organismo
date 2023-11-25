import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/models/opcao_model.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';
import 'package:oonhecendo_organismo/pages/widgets/option_widget.dart';
import 'package:oonhecendo_organismo/settings/helpers.dart';
import 'package:oonhecendo_organismo/utils/imagem_util.dart';
import '../main.dart';
import '../settings/colors.dart';
import '../utils/audios_util.dart';

class Fase1Page extends StatefulWidget {
  const Fase1Page({Key? key}) : super(key: key);

  @override
  State<Fase1Page> createState() => _Fase1PageState();
}

class _Fase1PageState extends State<Fase1Page> {

  late OpcaoModel pathImage;

  bool acertou = false;

  int nTentativas = 0;
  int nDicas = 0;

  final player = AssetsAudioPlayer();

  List<OpcaoModel> images = [
    OpcaoModel(path: "assets/images/olho.png", selected: false, certoErrado: false, pathAudio: "OlhoMp3"),
    OpcaoModel(path: "assets/images/boca.png", selected: false, certoErrado: false, pathAudio: "BocaMp3"),
    OpcaoModel(path: "assets/images/nariz.png", selected: false, certoErrado: false, pathAudio: "NarizMp3"),
    OpcaoModel(path: "assets/images/cabeça.png", selected: false, certoErrado: false, pathAudio: "CabecaMp3"),
    OpcaoModel(path: "assets/images/orelha.png", selected: false, certoErrado: false, pathAudio: "OrelhaMp3"),
  ];

  @override
  void initState(){
    super.initState();
    pathImage = ImagemUtil.sortearImagens();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Appcolors.backgroundcolor, Appcolors.backgroundcolor2],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 3*(MediaQuery.of(context).size.width/4),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Appcolors.buttomcolor, width: 10),
                                  borderRadius: BorderRadius.circular(110)
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 90,
                                  child: Image.asset(pathImage.path,),
                                ),
                              ),

                              SizedBox(height: GlobalVariables.narracao ? 15 : 0,),
                              Visibility(
                                visible: GlobalVariables.narracao,
                                child: GestureDetector(
                                  onTap: () => AudioUtil.tocarAudio(player, pathImage.pathAudio),
                                  child: Icon(Icons.record_voice_over) ,
                                ),
                              )

                            ],
                          ),

                          SizedBox(height: 100,),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 230,
                                  child: Center(
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: images.length,
                                      itemBuilder: (context, index ){

                                        OpcaoModel model = images[index];

                                        return Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 180,
                                                width: 180,
                                                child: Visibility(
                                                  visible: !model.boolDica,
                                                  child: GestureDetector(
                                                    onTap: () => !acertou && nTentativas < 2 && !model.selected ? _selected(model) : null,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(color: Appcolors.buttomcolor, width: 5),
                                                              borderRadius: BorderRadius.circular(110)
                                                          ),
                                                          child: CircleAvatar(
                                                            backgroundColor: Colors.white,
                                                            radius: 90,
                                                            child: Image.asset(model.path),
                                                          )
                                                        ),

                                                        Visibility(
                                                          visible: model.selected,
                                                          child: Container(
                                                            alignment: Alignment.topRight,
                                                            child: Image.asset(model.certoErrado ? "assets/images/verificar.png" : "assets/images/letra-x.png", width: 60, )
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: GlobalVariables.narracao ? 15 : 0,),
                                              Visibility(
                                                visible: GlobalVariables.narracao,
                                                child: GestureDetector(
                                                  onTap: () => AudioUtil.tocarAudio(player,model.pathAudio),
                                                  child: Icon(Icons.record_voice_over) ,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: (MediaQuery.of(context).size.width/4),
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GlobalVariables.narracao ? OptionWidget(icon: Icon(Icons.record_voice_over), valor: "Narração", function: () => AudioUtil.tocarAudio(player, "SelecionarMp3")) : SizedBox(),
                          OptionWidget(icon: Icon(Icons.star), valor: GlobalVariables.pontuacao.toString(), function: (){}),
                        ],
                      ),

                      Text(
                        acertou ? "PARABÉNS \n \n Você acertou!!" : (nTentativas == 2 ? "QUE PENA!! \n\n Você atingiu o número máximo de tentativas" : 'Selecione a imagem correspondente'),
                        style: GoogleFonts.robotoSlab(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.titlecolor
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(
                        child: Visibility(
                          visible: acertou || nTentativas == 2,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => AppHelpers.verificarProximaFase(context),
                                child: Icon(Icons.arrow_forward_outlined, size: 150, color: Appcolors.titlecolor,),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OptionWidget(icon: Icon(Icons.lightbulb), valor: "Dica", function: _dica),
                          OptionWidget(icon: Icon(Icons.exit_to_app_outlined), valor: "Sair", function: _sair,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selected(OpcaoModel model) => setState(() {
    nTentativas++;
    model.selected = true;
    if(pathImage.path == model.path){
      if(GlobalVariables.narracao){
        AudioUtil.tocarAudio(player, 'AcertoMp3');
      }

      model.certoErrado = true;
    }
    else{
      if(GlobalVariables.narracao && nTentativas == 2){
        AudioUtil.tocarAudio(player, 'FalhouMp3');
      }
      model.certoErrado = false;
      AppHelpers.calcularPontuacao(TypePontuacao.Errou);
    }
    acertou = model.certoErrado;
  });

  _sair() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));

  _dica() {
    if(nDicas < 2 && !acertou && nTentativas < 2 ){
      int x = Random().nextInt(images.length) - 1;

      while(x < 0 || images.elementAt(x).path == pathImage.path || images.elementAt(x).selected || images.elementAt(x).boolDica){
        x = Random().nextInt(images.length) - 1;
      }

      AppHelpers.calcularPontuacao(TypePontuacao.Dica);

      setState(() {
        images.elementAt(x).boolDica = true;
        nDicas++;
      });
    }
  }
}
