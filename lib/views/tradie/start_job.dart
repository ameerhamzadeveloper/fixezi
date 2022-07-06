import 'dart:async';

import 'package:fixezi/config/colors.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
class StartJobTime extends StatefulWidget {
  @override
  _StartJobTimeState createState() => _StartJobTimeState();
}

class _StartJobTimeState extends State<StartJobTime> {
  late Timer timer;
  int seconds = 0;
  bool isTimerStart = false;
  int totalTime = 0;

  startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        isTimerStart = true;
      });
    });
  }
  stopTimer(){
    setState(() {
      isTimerStart = false;
      timer.cancel();
      totalTime += seconds;
      seconds = 0;
    });
  }
  pauseTimer(){
    setState(() {
      isTimerStart = false;
      timer.cancel();
    });
  }
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Job Timer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Total ${'${(Duration(seconds: totalTime))}'.split('.')[0].padLeft(8, '0')}",style: TextStyle(fontSize: 50),),
            SizedBox(height: 10,),
            Text('${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0'),style: TextStyle(fontSize: 50),),
            SizedBox(height: 50,),
            FixeziButton(title: isTimerStart ? "Pause":"Start", color: aquaColor, onTap: (){
              isTimerStart ? pauseTimer(): startTimer();
            }, textColor: Colors.white),
            SizedBox(height: 10,),
            FixeziButton(title: "Stop", color: Colors.red, onTap: (){
              stopTimer();
            }, textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
