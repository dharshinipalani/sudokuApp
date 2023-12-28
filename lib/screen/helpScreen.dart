import 'package:flutter/material.dart';
import 'package:sudoku/screen/Instructions.dart';
import 'package:sudoku/screen/level_desc.dart';
import 'package:sudoku/widget/GameRules.dart';
import 'package:sudoku/widget/help_item.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HelpScreenState();
  }
}

class _HelpScreenState extends State<HelpScreen> {
  final List<String> _buttonName = [
    'Game Rules',
    'How to play?',
    'Difficulty levels',
  ];

  void _displayDescription(String name) {
    Widget w = const GameRules();
    if(name == 'How to play?') w = const InstructionScreen();
    if(name == 'Difficulty levels') w = const LevelDescription();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 34, 149, 242,),
              title: Text(name,
                style: GoogleFonts.robotoMono(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: w,
          );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          for (int i = 0; i < _buttonName.length; i++)
            Column(
              children: [
                HelpItem(
                  helpName: _buttonName[i],
                  onHelp: () => _displayDescription(_buttonName[i]),
                ),
                if (i < _buttonName.length - 1)
                  const SizedBox(
                    height: 24,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
