import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelItem extends StatelessWidget {
  const LevelItem({super.key, required this.level, required this.onSelectLevel});

  final String level;
  final void Function() onSelectLevel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectLevel,
      borderRadius: BorderRadius.circular(12),
      // splashColor: Colors.blueAccent,
      child: Container(
        width: 250,
        height: 50,
        padding: const EdgeInsets.all(1),
        color: Colors.deepPurple,
        child: Text(
          level,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(
            fontSize: 32,
            color: Colors.white,

          ),
        ),
      ),
    );
  }
}
