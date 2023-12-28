import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class TimerDisplay extends StatefulWidget {
  const TimerDisplay({super.key,});


  @override
  State<StatefulWidget> createState() {
    return _TimerDisplayState();
  }
}
class _TimerDisplayState extends State<TimerDisplay>{
  int _seconds = 0;
  int _minutes = 0;
  late Timer _timer;
  bool _istimerPaused = false;
  DateTime? _pauseTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(!_istimerPaused){
        setState(() {
          if (_seconds < 59) {
            _seconds++;
          } else {
            _minutes++;
            _seconds = 0;
          }
        });
      }
    });
  }

  void _dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: Colors.indigoAccent,
          size: 36,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$_minutes:${_seconds.toString().padLeft(2, '0')}',
          style: GoogleFonts.robotoMono(
            fontSize: 34,
            color: Colors.indigoAccent,
          ),
        ),


      ],
    );
  }
}