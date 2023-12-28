import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpItem extends StatelessWidget {
  const HelpItem({super.key, required this.helpName, required this.onHelp});

  final String helpName;
  final void Function() onHelp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onHelp,
      child: Container(
        width: 260,
        height: 55,
        padding: const EdgeInsets.all(4),
        color: Colors.deepPurple,
        child: Text(
          helpName,
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
