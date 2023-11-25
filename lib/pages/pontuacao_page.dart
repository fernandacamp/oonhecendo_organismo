import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/main.dart';
import 'package:oonhecendo_organismo/models/opcao_model.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';
import 'package:oonhecendo_organismo/pages/widgets/option_widget.dart';
import 'package:oonhecendo_organismo/utils/imagem_util.dart';

import '../settings/colors.dart';
import '../utils/audios_util.dart';

class PontucaoPage extends StatefulWidget {
  const PontucaoPage({Key? key}) : super(key: key);

  @override
  State<PontucaoPage> createState() => _PontucaoPageState();
}

class _PontucaoPageState extends State<PontucaoPage> {

  bool volume = false;

  double volumeValue = 1;

  bool isToggled = false;
  double size = 30;
  double innerPadding = 0;

  final player = AssetsAudioPlayer();

  @override
  void initState() {
    innerPadding = size / 10;

    if(GlobalVariables.narracao){
      AudioUtil.tocarAudio(player, 'TerminoMp3');
    }


    super.initState();
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
                          Text(
                            "FIM!",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 50,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dificuldade: ",
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                          color: Appcolors.titlecolor
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      GlobalVariables.dificuldade.name,
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pontuação: ",
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                          color: Appcolors.titlecolor
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${GlobalVariables.pontuacao.toString()} pontos",
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                      SizedBox(),

                      SizedBox(),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home())),
                            child: Icon(Icons.exit_to_app_outlined, size: 150, color: Appcolors.titlecolor,),
                          ),

                          SizedBox(height: 20),

                          Text(
                            "Sair",
                            style: GoogleFonts.robotoSlab(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(),
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

  _setVolume() => setState(() => volume = !volume);
}
