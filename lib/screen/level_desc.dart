import 'package:flutter/material.dart';
import 'package:sudoku/data/help_data.dart';
import 'package:sudoku/widget/instruction_item.dart';
class LevelDescription extends StatelessWidget{
  const LevelDescription({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.all(12),
      child: ListView(
        children: [
          for(int i = 0 ; i < level.length ; i++)
            ...[
              InstructionItem(instruction: level[i]),
              if(i < level.length - 1)
                const SizedBox(height: 16),
            ],
        ],
      ),
    );
  }
}