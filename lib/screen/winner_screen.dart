import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sudoku/screen/sudoku.dart';

import 'level_screen.dart';

class WinPage extends StatefulWidget {
  const WinPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WinPageState();
  }
}

class _WinPageState extends State<WinPage> {
  final _controller = ConfettiController();
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
    _controller.play();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurpleAccent.shade200,
                Colors.indigoAccent.shade200,
                Colors.blueAccent.shade200,
                Colors.lightBlueAccent,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Center(
                child: Column(
                  children: [
                    // const SizedBox(height: 46,),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      margin: const EdgeInsets.all(24),
                      padding: const EdgeInsets.all(24),
                      child: Lottie.asset(
                        'assets/animations/owl.json',
                        height: 300,
                        repeat: true,
                        reverse: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // const SizedBox(height: 16,),
                    Center(
                        child: Text('Hurray! you Won',
                          style: GoogleFonts.robotoMono(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),)
                    ),
                    const SizedBox(height: 16,),
                    MaterialButton(
                      onPressed: () {
                        if (!isPlaying) {
                          _controller.stop();
                          NavigateToLevelPage(context);
                        } else {
                          _controller.play();
                        }
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      height: 52,
                      minWidth: 50,
                      color: Colors.white70,
                      child:  Text(
                        "PLAY AGAIN",
                        style: GoogleFonts.robotoMono(
                          color: Colors.indigo.shade600,
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: const [
            Colors.yellowAccent,
            Colors.orange,
            Colors.redAccent,
            Colors.teal,
            Colors.pink,
            Colors.deepPurple,
            Colors.white,
          ],
          gravity: 0.01,
          emissionFrequency: 0.04,
        ),
      ],
    );
  }
  void NavigateToLevelPage(BuildContext ctx){
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => const Sudoku(),
        // Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.teal,
        //     title: Text(
        //       'Choose Level',
        //       style: GoogleFonts.shojumaru(
        //         fontSize: 28,
        //         color: Colors.white,
        //       ),
        //     ) ,
        //   ),
        //   body: const LevelScreen(),
        // ),
      )
    );
  }

}
