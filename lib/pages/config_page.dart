import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/main.dart';
import 'package:oonhecendo_organismo/models/opcao_model.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';
import 'package:oonhecendo_organismo/pages/widgets/option_widget.dart';
import 'package:oonhecendo_organismo/utils/imagem_util.dart';

import '../settings/colors.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  double size = 30;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 10;
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
                            "Créditos:",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Adriano Ribeiro",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Fernanda Campolin",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Nathan Luiz",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
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
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 140,
                                child: Text("Narração", style: GoogleFonts.robotoSlab(fontSize: 25),)
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() => GlobalVariables.narracao = !GlobalVariables.narracao);
                                },
                                onPanEnd: (b) {
                                  setState(() => GlobalVariables.narracao = !GlobalVariables.narracao);
                                },
                                child: AnimatedContainer(
                                  height: size,
                                  width: size * 2,
                                  padding: EdgeInsets.all(innerPadding),
                                  alignment: GlobalVariables.narracao ? Alignment.centerRight : Alignment.centerLeft,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GlobalVariables.narracao ? Appcolors.buttomcolor : Colors.grey.shade300,
                                  ),
                                  child: Container(
                                    width: size - innerPadding * 2,
                                    height: size - innerPadding * 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Appcolors.titlecolor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child: Text("Volume", style: GoogleFonts.robotoSlab(fontSize: 25),)
                              ),
                              Slider(
                                activeColor: Appcolors.buttomcolor,
                                thumbColor: Appcolors.titlecolor,
                                value: GlobalVariables.volume,
                                onChanged: (newvol) => setState(() => GlobalVariables.volume = newvol),
                                min: 0,
                                max:  1,
                                divisions: 100,
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home())),
                              child: Icon(Icons.arrow_back, size: 150, color: Appcolors.titlecolor,),
                            ),

                            SizedBox(height: 20),

                            Text(
                              "Voltar",
                              style: GoogleFonts.robotoSlab(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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

  _setVolume() => setState(() => GlobalVariables.narracao = !GlobalVariables.narracao);
}
