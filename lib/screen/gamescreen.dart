import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/data/blokChar.dart';
import 'package:sudoku/data/box_inner.dart';
import 'package:sudoku/data/focus.dart';
import 'package:sudoku/screen/game_over_screen.dart';
import 'package:sudoku/screen/winner_screen.dart';
import 'package:sudoku/widget/timer.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';
import 'package:quiver/iterables.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key,required this.emptyBox,required this.level}) : super(key: key);
  final int emptyBox;
  final String level;
  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  List<BoxInner> boxInners = [];
  FocusClass focus = FocusClass();
  bool isFinished = false;
  String? tapBoxIndex;
  int clearButtonTaps = 0;

  @override
  void initState() {
    generateSudoku();
    super.initState();
  }

  void generateSudoku() {
    isFinished = false;
    focus = FocusClass();
    tapBoxIndex = null;
    generatePuzzle();
    checkFinish();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Row(
                children: [
                    SizedBox(width: 145,),
                   TimerDisplay(),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(4),
                color: const  Color.fromARGB(255, 21, 20, 20),
                child: GridView.builder(
                    itemCount: boxInners.length,
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    physics: const ScrollPhysics(),
                    itemBuilder: (buildContext, index) {
                      BoxInner boxInner = boxInners[index];
                      return Container(
                        alignment: Alignment.center,
                        child: GridView.builder(
                            itemCount: boxInner.blokChars.length,
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3
                            ),
                            physics: const ScrollPhysics(),
                            itemBuilder: (buildContext, indexChar) {
                              BlokChar blockChar =
                              boxInner.blokChars[indexChar];
                              Color color = Colors.yellowAccent.shade100;
                              Color colorText = Colors.black;

                              if (isFinished){
                                color = Colors.green.shade300;
                                WidgetsBinding.instance?.addPostFrameCallback((_) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (ctx) =>
                                      const Scaffold(
                                        body: WinPage(),
                                      ),
                                      )
                                  );
                                });
                              }
                              else if (blockChar.isDefault) {
                                color = const  Color.fromARGB(
                                    255, 209, 225, 136);
                              } else if (blockChar.isFocus) {
                                color = const Color.fromARGB(255, 232, 163, 163);
                              }

                              if (tapBoxIndex == "$index - $indexChar" && !isFinished) {
                                color = Colors.blue.shade300;
                              }

                              if (isFinished) {
                                colorText = Colors.white;
                              } else if (blockChar.isExist) {
                                colorText = Colors.red.shade600;
                              }

                              return Container(
                                color: color,
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: blockChar.isDefault
                                      ? null
                                      : () => setFocus(index, indexChar),
                                  child: Text(
                                    "${blockChar.text}",
                                    style: GoogleFonts.robotoMono(
                                      color: colorText,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
              ),
              const SizedBox(height: 24,),
              Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // First Row (Numbers 1 to 5)
                  Container(
                    child: GridView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1, // Maintain square aspect ratio
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      physics: const ScrollPhysics(),
                      itemBuilder: (buildContext, index) {
                        return ElevatedButton(
                          onPressed: () => setInput(index + 1),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const  Color.fromARGB(
                                  255, 83, 196, 207),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Adjust the radius to make it more square
                              ),
                            ),
                          ),
                          child: Text("${index + 1}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                              fontSize: 36,
                            ),),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10), // Add spacing between rows

                  // Second Row (Numbers 6 to 9 and Clear Button)
                  Container(
                    child: GridView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1, // Maintain square aspect ratio
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      physics: const ScrollPhysics(),
                      itemBuilder: (buildContext, index) {
                        if (index < 4) {
                          // Numbers 6 to 9
                          return ElevatedButton(
                            onPressed: () => setInput(index + 6),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const   Color.fromARGB(
                                    255, 83, 196, 207),
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                              ),
                            ),
                            child: Text("${index + 6}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoMono(
                                fontSize: 36,
                              ),),
                          );
                        } else {
                          // Clear Button
                          return ElevatedButton(

                            onPressed: () {
                              clearButtonTaps++;
                              setInput(null);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red.shade800,
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child:  Text("X",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                              fontSize: 36,

                            ),),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
        ),
    );
  }

  void generatePuzzle() {
    boxInners.clear();
    var sudokuGenerator = SudokuGenerator(emptySquares: widget.emptyBox);
    List<List<List<int>>> completes = partition(sudokuGenerator.newSudokuSolved,
        sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList();
    partition(sudokuGenerator.newSudoku,
        sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList()
        .asMap()
        .entries
        .forEach((entry) {
      List<int> tempListCompletes =
      completes[entry.key].expand((element) => element).toList();
      List<int> tempList = entry.value.expand((element) => element).toList();
      tempList.asMap().entries.forEach((entryIn) {
        int index = entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
            (entryIn.key % 9).toInt() ~/ 3;

        if (boxInners.where((element) => element.index == index).isEmpty) {
          boxInners.add(BoxInner(index, []));
        }
        BoxInner boxInner =
            boxInners.where((element) => element.index == index).first;

        boxInner.blokChars.add(BlokChar(
          entryIn.value == 0 ? "" : entryIn.value.toString(),
          index: boxInner.blokChars.length,
          isDefault: entryIn.value != 0,
          isCorrect: entryIn.value != 0,
          correctText: tempListCompletes[entryIn.key].toString(),
        ));
      });
    });
    print(boxInners);
  }

  setFocus(int index, int indexChar) {
    tapBoxIndex = "$index - $indexChar";
    focus.setData(index, indexChar);
    showFocusCenterLine();
    setState(() {});
  }

  void showFocusCenterLine() {
    int rowNoBox = focus.indexBox! ~/ 3;
    int colNoBox = focus.indexBox! % 3;

    for (var element in boxInners) {
      element.clearFocus();
    }

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach(
            (element) => element.setFocus(focus.indexChar!, Direction.Horizontal));

    boxInners
        .where((element) => element.index % 3 == colNoBox)
        .forEach((e) => e.setFocus(focus.indexChar!, Direction.Vertical));
  }

  setInput(int? number) {
    if (focus.indexBox == null) return;
    if (boxInners[focus.indexBox!].blokChars[focus.indexChar!].text ==
        number.toString() ||
        number == null) {
      boxInners.forEach((element) {
        element.clearFocus();
        element.clearExist();
      });
      boxInners[focus.indexBox!].blokChars[focus.indexChar!].setEmpty();
      tapBoxIndex = null;
      isFinished = false;
      showSameInputOnSameLine();
    } else {

      boxInners[focus.indexBox!].blokChars[focus.indexChar!].setText("$number");
      showSameInputOnSameLine();
      checkFinish();
    }
    if (clearButtonTaps >= 3) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => Scaffold(
              body: GameOverPage(level: widget.level,),
            ),
          ),
        );
      });
    }

    setState(() {});
  }

  void showSameInputOnSameLine() {
    int rowNoBox = focus.indexBox! ~/ 3;
    int colNoBox = focus.indexBox! % 3;
    String textInput =
    boxInners[focus.indexBox!].blokChars[focus.indexChar!].text!;
    boxInners.forEach((element) => element.clearExist());
    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach((e) =>
        e.setExistValue(focus.indexChar!, focus.indexBox!, textInput,
            Direction.Horizontal));
    boxInners.where((element) => element.index % 3 == colNoBox).forEach((e) =>
        e.setExistValue(
            focus.indexChar!, focus.indexBox!, textInput, Direction.Vertical));

    List<BlokChar> exists = boxInners
        .map((element) => element.blokChars)
        .expand((element) => element)
        .where((element) => element.isExist)
        .toList();
    if (exists.length == 1) exists[0].isExist = false;
  }

  void checkFinish() {
    int totalUnFinish = boxInners
        .map((e) => e.blokChars)
        .expand((element) => element)
        .where((element) => !element.isCorrect).length;

    isFinished = totalUnFinish == 0 ;
  }
}
