import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.context, this.onSudoku, this.onHelp, {super.key});

  final void Function(BuildContext context) onSudoku;
  final void Function(BuildContext context) onHelp;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'assets/images/sudoku_icon.png',
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Sudoku',
          style: GoogleFonts.robotoMono(
            color:  Color.fromARGB(255, 34, 149, 242,),
            fontSize: 54,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
            onPressed: () => onSudoku(context),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                  )),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255,221, 160, 221,),),
            ),
            child: Text(
              'START',
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                fontSize: 32,
                color: Colors.white,
              ),
            )),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
            onPressed: () => onHelp(context),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255,221, 160, 221,),),
            ),
            child: Text(
              'HELP',
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                fontSize: 32,
                color: Colors.white,
              ),
            )),
      ],
    ));
  }
}
