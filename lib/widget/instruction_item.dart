import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({super.key, required this.instruction});

  final Map<String, List<String>> instruction;

  @override
  Widget build(BuildContext context) {
    final title = instruction.keys.first;
    final content = instruction[title];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 12),
        if (content != null)
          ...content.map(
            (item) => Text(
              item,
              style: GoogleFonts.robotoMono(
                fontSize: 24,
                color: Colors.indigoAccent,
              ),

            ),
          ),
      ],
    );
  }
}
