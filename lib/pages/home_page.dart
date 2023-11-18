import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/pages/config_page.dart';
import 'package:oonhecendo_organismo/pages/fase_page1.dart';
import 'package:oonhecendo_organismo/pages/widgets/dificuldade_widget.dart';
import 'package:oonhecendo_organismo/pages/widgets/option_widget.dart';

import '../settings/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool volume = true;

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
              width: (MediaQuery.of(context).size.width/2),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('assets/images/home.jpg'),
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width/2),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Conhecendo o Organismo',
                            style: GoogleFonts.robotoSlab(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Appcolors.titlecolor
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height:40),

                          ElevatedButton(
                            onPressed: () => showDialog(context: context, builder: (context) => DificuldadeWidget()),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_arrow, size: 40,),
                                SizedBox(width: 15,),
                                Text('Inciar', style: GoogleFonts.robotoSlab(fontSize: 30),)
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolors.buttomcolor,
                                fixedSize: Size(200, 80),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OptionWidget(icon: Icon(Icons.settings), valor: 'Configurações', function: _configFunction),
                            OptionWidget(icon: Icon(Icons.help), valor: 'Ajuda', function: _configFunction),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _configFunction() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ConfigPage()));
}
