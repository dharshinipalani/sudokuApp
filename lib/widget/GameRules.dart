import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/data/help_data.dart';

class GameRules extends StatelessWidget {
  const GameRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.all(10),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 12,
          // ),
          Text(
            'Sudoku is a number puzzle game played on a 9x9 grid.',
            style: GoogleFonts.robotoMono(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          for (int i = 0; i < rules.length; i++)
            Column(
              children: [
                Text(
                  '${i + 1}. ${rules[i]}',
                  style: GoogleFonts.robotoMono(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo,
                  ),
                ),
                if (i < rules.length - 1)
                  const SizedBox(
                    height: 20,
                  ),
              ],
            )
        ],
      ),
    );
  }
}
