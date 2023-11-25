import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/pages/fase_page1.dart';

import '../../main.dart';
import '../../settings/colors.dart';

class DificuldadeWidget extends StatefulWidget {
  const DificuldadeWidget({Key? key}) : super(key: key);

  @override
  State<DificuldadeWidget> createState() => _DificuldadeWidgetState();
}

class _DificuldadeWidgetState extends State<DificuldadeWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Selecione a dificuldade', style: GoogleFonts.robotoSlab(fontSize: 30,color: Appcolors.buttomcolor, fontWeight: FontWeight.bold),),
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              GlobalVariables.dificuldade = TypeDificuldade.Facil;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Fase1Page()));
            },
            child: Text('Fácil', style: GoogleFonts.robotoSlab(fontSize: 30, color: Colors.white),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.buttomcolor,
                fixedSize: Size(200, 80),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () {
              GlobalVariables.dificuldade = TypeDificuldade.Medio;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Fase1Page()));
            },
            child: Text('Médio', style: GoogleFonts.robotoSlab(fontSize: 30, color: Colors.white),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.buttomcolor,
                fixedSize: Size(200, 80),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () {
              GlobalVariables.dificuldade = TypeDificuldade.Dificil;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Fase1Page()));
            },
            child: Text('Difícil', style: GoogleFonts.robotoSlab(fontSize: 30, color: Colors.white),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.buttomcolor,
                fixedSize: Size(200, 80),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
          ),
        ],
      )
    );
  }
}
