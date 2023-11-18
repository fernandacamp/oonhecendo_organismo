import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionWidget extends StatelessWidget {
  
  final Icon icon;
  final String valor;
  final Function function;

  const OptionWidget({super.key, required this.icon, required this.valor, required this.function});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function.call(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ,
          SizedBox(width: 10,height: 20,),
          Text(valor, style: GoogleFonts.robotoSlab(fontSize: 25),)
        ],
      ),
    );
  }
}
