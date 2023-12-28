import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/screen/gamescreen.dart';
import 'package:sudoku/screen/helpScreen.dart';
import 'package:sudoku/screen/level_screen.dart';
import 'package:sudoku/screen/start_screen.dart';

class Sudoku extends StatefulWidget{
  const Sudoku({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Sudoku();
  }
}
class _Sudoku extends State<Sudoku>{
  String screen = "";
  String presentScreenTitle = "" ;
  void _switchLevelScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 34, 149, 242,),
          title: Text(
            'Choose Level',
            style: GoogleFonts.robotoMono(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ) ,
        ),
        body: const LevelScreen(),
      ),
    ));
  }

  void _switchHelpScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 34, 149, 242,),
          title: Text(
            'Help',
            style: GoogleFonts.robotoMono(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ) ,
        ),
        body: const HelpScreen(),
      ),
    ));

  }
  @override
  Widget build(BuildContext context) {
    Widget w = StartScreen(context,_switchLevelScreen,_switchHelpScreen);
    bool gameScreen = false;

    if(screen == 'level-screen') {
      w =  const LevelScreen();
      gameScreen = true;
    }
    else if(screen == 'help-screen'){
      w = const HelpScreen();

    }
    if(screen == "") {
      return  Scaffold(
          body: w,
        );
    }
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              presentScreenTitle,
              style: GoogleFonts.robotoMono(
                fontSize: 22,
                color: Colors.white,
              ),),
          ),
          body: w,
        );
    }

}