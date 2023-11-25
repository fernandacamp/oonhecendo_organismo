import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/models/opcao_model.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';
import 'package:oonhecendo_organismo/pages/widgets/option_widget.dart';
import 'package:oonhecendo_organismo/settings/helpers.dart';
import 'package:oonhecendo_organismo/utils/audios_util.dart';
import 'package:oonhecendo_organismo/utils/imagem_util.dart';
import '../main.dart';
import '../settings/colors.dart';

class Fase2Page extends StatefulWidget {
  const Fase2Page({Key? key}) : super(key: key);

  @override
  State<Fase2Page> createState() => _Fase2PageState();
}

class _Fase2PageState extends State<Fase2Page> {

  late OpcaoModel pathImage;

  bool acertou = false;

  int nTentativas = 0;
  int nDicas = 0;

  final player = AssetsAudioPlayer();

  List<OpcaoModel> images = [
    OpcaoModel(path: "Olhos", selected: false, certoErrado: false, pathAudio: ""),
    OpcaoModel(path: "Boca", selected: false, certoErrado: false, pathAudio: ""),
    OpcaoModel(path: "Nariz", selected: false, certoErrado: false, pathAudio: ""),
    OpcaoModel(path: "Orelhas", selected: false, certoErrado: false, pathAudio: ""),
  ];

  @override
  void initState() {
    super.initState();
    pathImage = ImagemUtil.sortearImagens2();
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 150,
                              child: Image.asset(pathImage.path,),
                            ),
                          ),

                          SizedBox(width: 100,),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width/6,
                                  child: Center(
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: images.length,
                                      itemBuilder: (context, index ){

                                        OpcaoModel model = images[index];

                                        return SizedBox(
                                          width: MediaQuery.of(context).size.width/4,
                                          child: Visibility(
                                            visible: !model.boolDica,
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 20.0),
                                              child: GestureDetector(
                                                onTap: () => !acertou && nTentativas < 2 && !model.selected ? _selected(model) : null,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color:   Appcolors.buttomcolor,
                                                          //border: Border.all(color: Appcolors.buttomcolor, width: 5),
                                                          borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20, bottom: 10),
                                                        child: Text(model.path, style: GoogleFonts.robotoSlab(fontSize: 30, color: Colors.white),),
                                                      ),
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
                          GlobalVariables.narracao ? OptionWidget(icon: Icon(Icons.record_voice_over), valor: "Narração", function: () => AudioUtil.tocarAudio(player, "Area_DestacadaMp3")) : SizedBox(),
                          OptionWidget(icon: Icon(Icons.star), valor: GlobalVariables.pontuacao.toString(), function: (){}),
                        ],
                      ),

                      Text(
                        acertou ? "PARABÉNS \n \n Você acertou!!" : (nTentativas == 2 ? "QUE PENA!! \n\n Você atingiu o número máximo de tentativas" : 'A área destacada representa qual parte da cabeça?'),
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
    if(pathImage.path.contains(model.path.toLowerCase())){
      model.certoErrado = true;
      if(GlobalVariables.narracao) {
        AudioUtil.tocarAudio(player, 'AcertoMp3');
      }
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

      while(x < 0 || pathImage.path.contains(images.elementAt(x).path.toLowerCase()) || images.elementAt(x).selected || images.elementAt(x).boolDica){
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
