import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/data/help_data.dart';
import 'package:sudoku/widget/instruction_item.dart';
class InstructionScreen extends StatelessWidget{
  const InstructionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const  EdgeInsets.all(12),
        child: ListView(
          children: [
            for(int i = 0 ; i < instructions.length ; i++)
              ...[
                InstructionItem(instruction: instructions[i]),
                if(i < instructions.length - 1)
                const SizedBox(height: 16),
              ],
          ],
        ),
    );
  }
}