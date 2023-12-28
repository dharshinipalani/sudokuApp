import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sudoku/screen/gamescreen.dart';
import 'package:sudoku/screen/sudoku.dart';

import 'level_screen.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key, required this.level,});

  final String level;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurpleAccent.shade200,
                Colors.indigoAccent.shade200,
                Colors.blueAccent.shade200,
                Colors.lightBlueAccent,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.all(24),
                    child: Lottie.asset(
                      'assets/animations/sad_yellow.json',
                      height: 300,
                      repeat: true,
                      reverse: true,
                      fit: BoxFit.cover,
                    ),
                  ),
                   Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.all(32),
                     child: Text('Oh no! you made 3 mistakes, Try new Game',
                     style: GoogleFonts.robotoMono(
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                     ),)
                   ),
                  const SizedBox(height: 14,),
                   Center(
                      child: ElevatedButton(
                        onPressed: () => NavigateToLevelPage(context),
                        style:  ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white70,
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ))
                        ),
                        child: Text( "HOME",
                             style: GoogleFonts.robotoMono(
                             color: Colors.indigo.shade600,
                             fontSize: 28,
                             fontWeight: FontWeight.w300,
                         )),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  void NavigateToLevelPage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (context) => const Sudoku(),
    ));
  }
}
