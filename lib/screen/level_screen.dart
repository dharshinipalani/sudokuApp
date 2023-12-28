import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/screen/gamescreen.dart';
import 'package:sudoku/widget/level_item.dart';

final List<String> levels = ['EASY', 'MEDIUM', "HARD"];

class LevelScreen extends StatelessWidget {
  const LevelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          for (int i = 0; i < levels.length; i++)
            Column(
              children: [
                LevelItem(
                    level: levels[i],
                    onSelectLevel: () {
                      navigateLevelPage(context, levels[i]);
                    }),
                if (i < levels.length - 1)
                  const SizedBox(
                    height: 24,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  void navigateLevelPage(BuildContext ctx, String level) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 34, 149, 242,),
            title: Text(
              level,
              style: GoogleFonts.robotoMono(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: GameScreen(
            emptyBox: getEmptyBoxCount(level),
            level: level,
          ),
        ),
      ),
    );
  }

  int getEmptyBoxCount(String level) {
    switch (level) {
      // case 'FAST':
      //   return getRandomNumberInRange(3, 8);
      case 'EASY':
        return getRandomNumberInRange(5, 15);
      case 'MEDIUM':
        return getRandomNumberInRange(15, 25);
      case 'HARD':
        return getRandomNumberInRange(25, 35);
      default:
        return 0;
    }
  }

  int getRandomNumberInRange(int min, int max) {
    final random = Random();
    // print(min + random.nextInt(max - min + 1));
    return min + random.nextInt(max - min + 1);
  }
}
